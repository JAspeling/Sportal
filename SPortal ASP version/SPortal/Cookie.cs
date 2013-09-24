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
    }
}