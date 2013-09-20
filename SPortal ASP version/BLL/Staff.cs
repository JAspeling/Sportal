using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Staff : Person
    {
        ///<constructor>
        ///Constructor
        ///</constructor>
        public Staff(string username, string email, string name, string surname, DateTime dob)
            : base(username, email, name, surname, dob) { UserType = UserType.STAFF; }

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

        public static Staff GetStaffByUsername(string username)
        {
            return null;
        }

        public static List<Staff> GetStaffByInstitution(string institution)
        {
            return new List<Staff>();
        }

        public static List<Staff> GetStaffByGroup(string group)
        {
            return new List<Staff>();
        }

        public static List<Staff> GetStaffByProject(string project)
        {
            return new List<Staff>();
        }
        #endregion
    }
}
