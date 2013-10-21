using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SPortal
{
    public static class Helpers
    {
        public static string LimitLength(this string description, int amount)
        {
            if (description.Length > amount)
                return string.Format(description.Substring(0, amount) + "...");

            return description;
        }
    }
}