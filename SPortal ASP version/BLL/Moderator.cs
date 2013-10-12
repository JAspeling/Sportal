using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    class Moderator : User
    {
        public Moderator(string username, string email, string name, string surname, DateTime dob, string picture, string institution, int rating, DateTime joinDate, UserRoles userRoles, UserType userType)
            : base(username, email, name, surname, dob, picture, institution, rating, joinDate, userRoles, userType) { }

        #region Methods
        public bool EditPost(string postID)
        {
            return true;
        }
        #endregion
    }
}
