using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Admin : Person
    {
        ///<constructor>
        ///Constructor
        ///</constructor>
        public Admin(string username, string email, string name, string surname, DateTime dob)
            : base(username, email, name, surname, dob) { UserType = UserType.ADMIN; }

        #region Methods
        public bool Update()
        {
            return true;
        }

        public bool Remove()
        {
            return true;
        }

        public bool AssignRole(UserRoles userRole, string group)
        {
            return true;
        }

        public bool RemoveRole(UserRoles userRole, string group)
        {
            return true;
        }

        public static Admin GetAdminByUsername(string username)
        {
            return null;
        }

        public static List<Staff> GetAdminsByInstitution(string institution)
        {
            return new List<Staff>();
        }

        public static List<Staff> GetAdminsByGroup(string group)
        {
            return new List<Staff>();
        }

        public static List<Staff> GetAdminsByProject(string project)
        {
            return new List<Staff>();
        }
        #endregion
    }
}
