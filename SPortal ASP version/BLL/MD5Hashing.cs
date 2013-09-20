using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public static class MD5Hashing
    {
        public static string MD5Hash(string text)
        {
            string salt = "Random words of nothingness";
            text += salt;

            MD5 md5 = new MD5CryptoServiceProvider();

            md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(text));

            byte[] result = md5.Hash;

            StringBuilder str = new StringBuilder();

            for (int a = 0; a < result.Length; a++)
            {
                str.Append(result[a].ToString("x2"));
            }

            return str.ToString();
        }
    }
}
