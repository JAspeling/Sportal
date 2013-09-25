using System.Data;
using System.Data.SqlClient;
using DAL;

namespace BLL
{
    public class Connection
    {
        public static bool Login(string username, string password)
        {
            
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("Username", username), 
                                            new SqlParameter("Password", MD5Hashing.MD5Hash(password)) };
            DataTable dt = da.Select("LoginUser", parameters);
            if (dt.Rows.Count != 0)
                return true;
            else
                return false;
        }
    }
}
