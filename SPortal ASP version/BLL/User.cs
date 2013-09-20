using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class User : Person
    {
        ///<constructor>
        ///Constructor
        ///</constructor>
        public User(string username, string email, string name, string surname, DateTime dob)
            : base(username, email, name, surname, dob) { UserType = UserType.USER; }

        #region Methods
        public bool Update()
        {
            return true;
        }

        public bool Remove()
        {
            return true;
        }

        public bool AssignRole(UserRoles userRoles, string group)
        {
            return true;
        }

        public bool RemoveRole(UserRoles userRole, string group)
        {
            return true;
        }

        public static User GetUserByUsername(string username)
        {
            return null;
        }

        public static List<User> GetUsersByInstitution(string institution)
        {
            return new List<User>();
        }

        public static List<User> GetUsersByGroup(string group)
        {
            return new List<User>();
        }

        public static List<User> GetUsersByProject(string project)
        {
            return new List<User>();
        }
        #endregion
    }
}
