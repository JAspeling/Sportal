using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using DAL;

namespace BLL
{
    public class User
    {
        ///<constructor>
        ///Constructor
        ///</constructor>
        public User(string username, string email, string name, string surname, DateTime dob, string picture, string institution, int rating, DateTime joinDate, UserRoles userRoles)
        {
            Username = username;
            Email = email;
            Name = name;
            Surname = surname;
            DOB = dob;
            Picture = picture;
            Institution = institution;
            Rating = rating;
            this.joinDate = joinDate;
            UserRoles = userRoles;
        }

        #region Fields
        private string username;
        private string email;
        private string name;
        private string surname;
        private DateTime dob;
        private string picture;
        private string institution;
        private int rating;
        private DateTime joinDate;
        private UserRoles userRoles;
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

        public string Institution
        {
            get { return institution; }
            set { institution = value; }
        }

        public int Rating
        {
            get { return rating; }
            set { rating = value; }
        }

        public DateTime JoinDate
        {
            get { return joinDate; }

        }

        public UserRoles UserRoles
        {
            get { return userRoles; }
            set { userRoles = value; }
        }
        #endregion

        #region Methods
        public override string ToString()
        {
            return username;
        }

        public virtual bool Update()
        {
            //updates all the user detail except for user roles, which can be done separately
            //this can be overridden if sub classes contains extra fields
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@Username",username),
                                            new SqlParameter("@Email",email),
                                            new SqlParameter("@Name",name),
                                            new SqlParameter("@Surname",surname),
                                            new SqlParameter("@DOB",dob),
                                            new SqlParameter("@Picture",picture),
                                            new SqlParameter("@Institution",institution),
                                            new SqlParameter("@Rating",rating) };
            return da.Update("UpdateUser", parameters);
        }

        public bool AssignRole(UserRoles userRole, string group)
        {
            //this uses a procedure to insert a userRole to a subtable
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@Username",username),
                                            new SqlParameter("@UserRole",userRole),
                                            new SqlParameter("@Group",group) };
            return da.Insert("AssignUserRole", parameters);
        }

        public bool RemoveRole(UserRoles userRole, string group)
        {
            //this uses a procedure to remove a userRole from a subtable
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@Username",username),
                                            new SqlParameter("@UserRole",userRole),
                                            new SqlParameter("@Group",group) };
            return da.Delete("RemoveUserRole", parameters);
        }

        public static bool CreateUser(string username, string password, string email, string name, string surname, DateTime dob, string picture, UserType userType)
        {
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@Username", username),
                                            new SqlParameter("@Password", MD5Hashing.MD5Hash(password)),
                                            new SqlParameter("@Email", email),
                                            new SqlParameter("@Name", name), 
                                            new SqlParameter("@Surname", surname),
                                            new SqlParameter("@DOB", dob.Date),
                                            new SqlParameter("@Picture", picture),
                                            new SqlParameter("@UserTypeID", Convert.ToString((int)userType)) };
            return da.Insert("RegisterUser", parameters);
        }

        public static User GetUserByUsername(string username)
        {
            //requires two stored procedures one to select the userRoles from a userRoles subtable and one to select the user detail
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@Username",username) };
            UserRoles userRoles = new UserRoles();
            //DataTable dt = da.Select("SelectUserRoles", parameters);
            //foreach (DataRow row in dt.Rows)
            //    userRoles += Convert.ToInt16(row["UserRoleID"]);
            DataTable dt = da.Select("SelectUserInfo", parameters);
            if (dt.Rows.Count > 0)
                return new User(dt.Rows[0]["Username"].ToString(),dt.Rows[0]["Email"].ToString(),dt.Rows[0]["Name"].ToString(),dt.Rows[0]["Surname"].ToString(),
                            Convert.ToDateTime(dt.Rows[0]["DOB"]),dt.Rows[0]["Picture"].ToString(),dt.Rows[0]["Institution"].ToString(),
                            Convert.ToInt16(dt.Rows[0]["Rating"]),Convert.ToDateTime(dt.Rows[0]["JoinDate"]), userRoles);
            
            return null;
        }

        public static UserType GetUserType(string username)
        {
            //gets the user type based on username
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@Username", username) };
            DataTable dt = da.Select("SelectUserType", parameters);
            dt = da.Select("SelectUserInfo", parameters);
            if (dt.Rows.Count > 0)
                return (UserType)Convert.ToInt16(dt.Rows[0]["UserTypeID"]);

            return UserType.USER; // Should be changed to unspecified
        }

        public static List<User> GetUsersByInstitution(string institution)
        {
            //uses a stored procedure that returns only the usernames of user from a certain institution
            List<User> users = new List<User>();
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@Institution", institution) };
            DataTable dt = da.Select("SelectUsersByInstitution", parameters);
            foreach(DataRow row in dt.Rows)
                users.Add(User.GetUserByUsername(row["Username"].ToString()));
            return users;
        }

        public static List<User> GetUsersByGroup(string group)
        {
            //uses a stored procedure that returns only the usernames of user from a certain group
            List<User> users = new List<User>();
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@GroupName", group) };
            DataTable dt = da.Select("SelectUsersByGroup", parameters);
            foreach (DataRow row in dt.Rows)
                users.Add(User.GetUserByUsername(row["Username"].ToString()));
            return users;
        }

        public static List<User> GetUsersByProject(string project)
        {
            //uses a stored procedure that returns only the usernames of user from a certain project
            List<User> users = new List<User>();
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@Project", project) };
            DataTable dt = da.Select("SelectUsersByProject", parameters);
            foreach (DataRow row in dt.Rows)
                users.Add(User.GetUserByUsername(row["Username"].ToString()));
            return users;
        }

        public static bool RemoveUser(string username)
        {
            //deletes a user entirely
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@Username", username) };
            return da.Delete("RemoveUser", parameters);
        }
        #endregion
    }
}
