using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
        #endregion
    }
}
