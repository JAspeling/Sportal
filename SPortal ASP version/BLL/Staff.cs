using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Staff : User
    {
        ///<constructor>
        ///Constructor
        ///</constructor>
        public Staff(string username, string email, string name, string surname, DateTime dob, string picture, string institution, int rating, DateTime joinDate, UserRoles userRoles)
            : base(username, email, name, surname, dob, picture, institution, rating, joinDate, userRoles) { }

        #region Methods
        #endregion
    }
}
