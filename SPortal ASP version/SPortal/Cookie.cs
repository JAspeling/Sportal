using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace SPortal
{
    public static class Cookie
    {
        public static void SetCookie(Page page, string cookieName, string cookieValue, int expire)
        {
            HttpCookie userCookie = page.Request.Cookies[cookieName];

            if (userCookie == null)
            {
                userCookie = new HttpCookie(cookieName);
            }

            userCookie.Value = cookieValue;
            userCookie.Expires = DateTime.Now.AddDays(expire);

            page.Response.Cookies.Add(userCookie);
        }

        public static string SetSessionFromCookie(Page page)
        {
            HttpCookie userCookie = page.Request.Cookies["SPortalUsername"];

            if (userCookie != null) // User cookie is created.
            {
                page.Session["User"] = userCookie.Value;
                return SetLoginState(LoginState.LoggedIn);
            }
            else
            {
                if (page.Session["User"] != null)    // No cookie created, but user is logged in.
                {
                    return SetLoginState(LoginState.LoggedIn);
                }
                else
                {
                    return SetLoginState((LoginState.LoggedOut));
                }

            }
        }

        private static string SetLoginState(LoginState login)
        {
            switch (login)
            {
                case LoginState.LoggedIn: return "images/logout.png";
                case LoginState.LoggedOut: return "images/sign.png";
                default:
                    return null;
            }

        }

        enum LoginState
        {
            LoggedIn,
            LoggedOut
        }
    }
}