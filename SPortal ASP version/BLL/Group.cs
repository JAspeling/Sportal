using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
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
        public Group(int id, string name, string description, string username, bool limited, DateTime founded)
        {
            this.id = id;
            Name = name;
            Description = description;
            Username = username;
            Limited = limited;
            this.founded = founded;
        }

        #region Fields

        private int id;
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

        public int Id
        {
            get { return id; }
        }

        #endregion

        #region Methods
        public bool Update()
        {
            //updates all the group detail, so that a group can be edited
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@Name",name),
                                            new SqlParameter("@Description",description),
                                            new SqlParameter("@Username",username),
                                            new SqlParameter("@Limited",limited) };
            return da.Update("UpdateGroup", parameters);
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
                return new Group(Convert.ToInt16(dt.Rows[0]["GroupID"].ToString()), dt.Rows[0]["TopicName"].ToString(), dt.Rows[0]["TopicDescription"].ToString(),
                    dt.Rows[0]["Username"].ToString(), Convert.ToBoolean(dt.Rows[0]["Limited"]),
                    Convert.ToDateTime(dt.Rows[0]["CreationDate"]));
            
            return null;
        }

        public static List<Group> GetGroupsByUsername(string username)
        {
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@Username",username) };
            List<Group> groups = new List<Group>();
            DataTable dt = da.Select("SelectGroupsByUsername", parameters);
            foreach (DataRow row in dt.Rows)
                groups.Add(Group.GetGroupByName(row["TopicName"].ToString()));
            return groups;
        }

        public static bool CreateGroup(string name, string description, string username, bool limited)
        {
            //calls a stored procedure to create a new group
            DataAccess da = new DataAccess();

            int limitedInt = limited == true ? 1 : 0;

            SqlParameter[] parameters = { new SqlParameter("@GroupName", name), 
                                            new SqlParameter("@Description", description), 
                                            new SqlParameter("@Username", username), 
                                            new SqlParameter("@Limited", limitedInt) };
            return da.Insert("CreateGroup", parameters);
        }

        // Invites

        public static bool RequestInvite(string name, string username)
        {
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@Name",name),
					new SqlParameter("@Username",username) };
            return da.Insert("InsertGroupInvite", parameters);
        }

        public static bool GetInvites(string name, string username)
        {
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@Name",name),
					new SqlParameter("@Username",username) };
            return da.Insert("SelectGroupInvites", parameters);
        }

        public static bool DeleteGroup(string name)
        {
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@GroupName", name) };
            return da.Delete("DeleteGroup", parameters);
        }

        public static List<Group> GetGroupsByKeywords(string text)
        {
            //gets a list of groups based on entered keywords
            List<string> keywords = text.Split(' ').ToList();
            List<string> filteredKeywords = new List<string>();
            foreach (string word in keywords)
                if (word.Length > 3)
                    filteredKeywords.Add(word);

            if (keywords.Count > 0 && keywords[0] != "")
            {
                List<Group> groups = new List<Group>();
                DataAccess da = new DataAccess();
                DataTable dt = da.KeywordSearch(2, filteredKeywords);
                if (dt.Rows.Count != 0)
                    foreach (DataRow row in dt.Rows)
                        groups.Add(Group.GetGroupByName(row["TopicName"].ToString()));
                return groups;
            }
            return null;
        }
    

        public static List<Group> GetGroups()
        {
            List<Group> groups = new List<Group>();
            DataAccess da = new DataAccess();
            DataTable dt = da.Select("SelectGroups", null);
            if (dt.Rows.Count != 0)
                foreach (DataRow row in dt.Rows)
                {
                    bool value = row["Limited"].ToString() == "1" ? true : false;
                    groups.Add(new Group(Convert.ToInt16(row["GroupID"].ToString()), row["TopicName"].ToString(),
                        row["TopicDescription"].ToString(), row["Username"].ToString(), 
                        value, Convert.ToDateTime(row["CreationDate"].ToString())));
                }
                    
            return groups;
        }
        #endregion
    }
}
