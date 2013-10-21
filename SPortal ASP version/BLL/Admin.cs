using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class Admin : User
    {
        ///<constructor>
        ///Constructor
        ///</constructor>
        public Admin(string username, string email, string name, string surname, DateTime dob, string picture, string institution, int rating, DateTime joinDate, UserRoles userRoles, UserType userType)
            : base(username, email, name, surname, dob, picture, institution, rating, joinDate, userRoles, userType) { }

        #region Methods

        public static bool CreateInstitution(string name)
        {
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@Institution", name) };
            return da.Update("CreateInstitution", parameters);
        }

        #endregion
    }
}
