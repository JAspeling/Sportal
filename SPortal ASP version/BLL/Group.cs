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
    public class Group
    {
        ///<constructor>
        ///Constructor
        ///</constructor>
        public Group(string name, string description, string username, bool limited, DateTime founded)
        {
            Name = name;
            Description = description;
            Username = username;
            Limited = limited;
            this.founded = founded;
        }

        #region Fields
        private string name;
        private string description;
        private string username;
        private bool limited;
        private DateTime founded;
        #endregion

        #region Properties
        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        public string Description
        {
            get { return description; }
            set { description = value; }
        }

        public string Username
        {
            get { return username; }
            set { username = value; }
        }

        public bool Limited
        {
            get { return limited; }
            set { limited = value; }
        }

        public DateTime Founded
        {
            get { return founded; }
        }
        #endregion

        #region Methods
        public bool Update()
        {
            return true;
        }

        public bool AddMember(string username)
        {
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@GroupName", name), 
                                            new SqlParameter("@Username", username) };
            return da.Insert("AddGroupMember", parameters);
        }

        public bool RemoveMember(string username)
        {
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@GroupName", name), 
                                            new SqlParameter("@Username", username) };
            return da.Delete("RemoveGroupMember", parameters);
        }

        public static Group GetGroupByName(string name)
        {
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@GroupName", name) };
            DataTable dt = da.Select("SelectGroupByGroupName", parameters);
            if (dt.Rows.Count > 0)
                return new Group(dt.Rows[0]["GroupHouse"].ToString(), dt.Rows[0]["Description"].ToString(),
                    dt.Rows[0]["Username"].ToString(), Convert.ToBoolean(dt.Rows[0]["Limited"]),
                    Convert.ToDateTime(dt.Rows[0]["FoundedDate"]));
            
            return null;
        }

        public static List<Group> GetGroupsByUsername(string username)
        {
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@Username",username) };
            List<Group> groups = new List<Group>();
            DataTable dt = da.Select("SelectGroupsByUsername", parameters);
            foreach (DataRow row in dt.Rows)
                groups.Add(new Group(row["GroupHouse"].ToString(), row["Description"].ToString(), row["Username"].ToString(), Convert.ToBoolean(row["Limited"]), Convert.ToDateTime(row["FoundedDate"])));
            return groups;
        }

        public static bool CreateGroup(string name, string description, string username, bool limited)
        {
            //calls a stored procedure to create a new group
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@GroupName", name), 
                                            new SqlParameter("@Description", description), 
                                            new SqlParameter("@Username", username), 
                                            new SqlParameter("@Limited", limited) };
            return da.Insert("CreateGroup", parameters);
        }
        #endregion
    }
}
