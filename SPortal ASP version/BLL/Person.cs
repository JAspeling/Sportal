using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public abstract class Person
    {
        ///<constructor>
        ///Constructor
        ///</constructor>
        public Person(string username, string email, string name, string surname, DateTime dob)
        {
            Username = username;
            Email = email;
            Name = name;
            Surname = surname;
            DOB = dob;
            joinDate = DateTime.Now.Date;
        }

        #region Fields
        private string username;
        private string email;
        private string name;
        private string surname;
        private DateTime dob;
        private string picture;
        private DateTime joinDate;
        private UserType userType;
        private UserRoles userRoles;
        private string institution;
        #endregion

        #region Properties
        public string Username
        {
            get { return username; }
            set { username = value; }
        }

        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        public string Surname
        {
            get { return surname; }
            set { surname = value; }
        }

        public DateTime DOB
        {
            get { return dob; }
            set { dob = value; }
        }

        public string Picture
        {
            get { return picture; }
            set { picture = value; }
        }

        public DateTime JoinDate
        {
            get { return joinDate; }

        }

        public UserType UserType
        {
            get { return userType; }
            set { userType = value; }
        }

        public UserRoles UserRoles
        {
            get { return userRoles; }
            set { userRoles = value; }
        }

        public string Institution
        {
            get { return institution; }
            set { institution = value; }
        }
        #endregion

        #region Methods
        public override string ToString()
        {
            return username;
        }
        #endregion
    }
}
