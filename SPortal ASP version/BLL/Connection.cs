using System;
using System.Data;
using System.Data.SqlClient;
using DAL;

namespace BLL
{
    public class Connection
    {
        public bool Login(string username, string password)
        {
            //MD5 encryptor = new MD5CryptoServiceProvider();
            //encryptor.ComputeHash(ASCIIEncoding.ASCII.GetBytes(password));
            //byte[] bytes = encryptor.Hash;
            //StringBuilder sb = new StringBuilder();
            //foreach (byte temp in bytes)
            //    sb.Append(temp.ToString("x2"));
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("Username", username), 
                                            new SqlParameter("Password", MD5Hashing.MD5Hash(password).ToString()) };
            DataTable dt = da.Select("LoginUser", parameters);
            if (dt.Rows.Count != 0)
                return true;
            else
                return false;
        }

        public bool Register(string username, string password, string email, string name, string surname, DateTime dob, string picture, int userType)
        {
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@Username", username),
                                            new SqlParameter("@Password", MD5Hashing.MD5Hash(password)),
                                            new SqlParameter("@Email", email),
                                            new SqlParameter("@Name", name), 
                                            new SqlParameter("@Surname", surname),
                                            new SqlParameter("@DOB", dob.ToString()),
                                            new SqlParameter("@Picture", picture),
                                            new SqlParameter("@JoinDate", DateTime.Now.ToString()),
                                            //new SqlParameter("UserType", SqlDbType.Int, 3, Convert.ToString((int)userType)) };
                                            new SqlParameter("@UserTypeID", userType.ToString()) };
            return da.Insert("RegisterUser", parameters);
            return true;
        }
    }
}
