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
    public class Topic
    {
        ///<constructor>
        ///Constructor
        ///</constructor>
        public Topic(int id, string name, string description, string text, DateTime date, string topicType, string username)
        {
            this.id = id;
            Name = name;
            Text = text;
            this.date = date;
            Description = description;
            TopicType = topicType;
            Username = username;
        }

        #region Fields

        private int id;
        private string name;
        private string description;
        private string text;
        private DateTime date;
        private int downvotes;
        private int upvotes;
        private string topicType;
        private string username;
        #endregion

        #region Properties
        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        public string Text
        {
            get { return text; }
            set { text = value; }
        }

        public DateTime Date
        {
            get { return date; }
        }

        public int Id
        {
            get { return id; }
        }

        public string Description
        {
            get { return description; }
            set { description = value; }
        }

        public int Downvotes
        {
            get { return downvotes; }
            set { downvotes = value; }
        }

        public int Upvotes
        {
            get { return upvotes; }
            set { upvotes = value; }
        }

        public string TopicType
        {
            get { return topicType; }
            set { topicType = value; }
        }

        public string Username
        {
            get { return username; }
            set { username = value; }
        }

        #endregion

        #region Methods
        public static bool CreateTopic(string name, string description, string text, int type, string username)
        {
            //create a new topic
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@TopicName", name),
                                            new SqlParameter("@Description", description),
                                            new SqlParameter("@Text", text),
                                            new SqlParameter("@Username", username),
                                            new SqlParameter("@Type", type),};
            return da.Insert("CreateTopic", parameters);
        }

        public static Topic GetTopicByName(string topic)
        {
            //gets a new topic based on the unique name
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@TopicName", topic) };
            DataTable dt = da.Select("SelectTopicByName", parameters);
            if (dt.Rows.Count > 0)
                return new Topic(Convert.ToInt16(dt.Rows[0]["TopicID"].ToString()), dt.Rows[0]["TopicName"].ToString(),
                    dt.Rows[0]["TopicDescription"].ToString(), dt.Rows[0]["TopicBody"].ToString(),
                    Convert.ToDateTime(dt.Rows[0]["CreationDate"].ToString()),
                    dt.Rows[0]["TopicType"].ToString(),
                    dt.Rows[0]["Username"].ToString());
            return null;
        }

        public static Topic GetTopicByID(int id)
        {
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@TopicID", id) };
            DataTable dt = da.Select("SelectTopicByID", parameters);
            if (dt.Rows.Count > 0)
                return new Topic(Convert.ToInt16(dt.Rows[0]["TopicID"].ToString()), dt.Rows[0]["TopicName"].ToString(),
                    dt.Rows[0]["TopicDescription"].ToString(), dt.Rows[0]["TopicBody"].ToString(),
                    Convert.ToDateTime(dt.Rows[0]["CreationDate"].ToString()),
                    dt.Rows[0]["TopicType"].ToString(),
                    dt.Rows[0]["Username"].ToString());
            return null;
        }

        public static List<Topic> GetTopics()
        {
            //uses a stored procedure to get all topic names, then uses those names to get a list of topics
            List<Topic> topics = new List<Topic>();
            DataAccess da = new DataAccess();
            DataTable dt = da.Select("SelectTopics", null);
            foreach (DataRow row in dt.Rows)
                topics.Add(Topic.GetTopicByName(row["TopicName"].ToString()));
            return topics;
        }

        public static bool Remove(string topic)
        {
            //deletes a topic entirely
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@TopicName", topic) };
            return da.Delete("RemoveTopic", parameters);
        }

        public int GetTopicReplyAmount()
        {
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@TopicName", name) };
            DataTable dt = da.Select("SelectTopicRepliesAmount", parameters);

            if (dt.Rows.Count > 0)
                return Convert.ToInt16(dt.Rows[0]["Amount"].ToString());
            return 0;
        }

        public int GetRating()
        {
            double val = upvotes/(float)(upvotes + downvotes)*10f;
            if (upvotes + downvotes == 0)
                return 0;
            return Convert.ToInt16(val);
        }

        public bool Upvote(string username)
        {
            //this uses a procedure to upvote a topic
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@Type", 1),
                                            new SqlParameter("@ID",id),
                                            new SqlParameter("@Username",username)};
            bool temp = da.Update("Upvote", parameters);

            return temp;
        }

        public bool Downvote(string username)
        {
            //this uses a procedure to downvote a topic
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@Type", 1),
                                            new SqlParameter("@ID",id),
                                            new SqlParameter("@Username",username)};
            return da.Update("Downvote", parameters);
        }

        public int GetUpvotes()
        {
            //uses a stored procedure to get all upvotes
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@Type",1),
                                            new SqlParameter("@ID",id) };
            DataTable dt = da.Select("SelectUpvotes", parameters);
            return Convert.ToInt16(dt.Rows[0]["Upvotes"]);
        }

        public int GetDownvotes()
        {
            //uses a stored procedure to get all downvotes
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@Type",1),
                                            new SqlParameter("@ID",id) };
            DataTable dt = da.Select("SelectDownvotes", parameters);
            return Convert.ToInt16(dt.Rows[0]["Downvotes"]);
        }

        public static List<Topic> GetTopicsByKeywords(string text)
        {
            //gets a list of groups based on entered keywords
            List<string> keywords = text.Split(' ').ToList();
            List<string> filteredKeywords = new List<string>();
            foreach (string word in keywords)
                if (word.Length > 3)
                    filteredKeywords.Add(word);

            if (keywords.Count > 0)
            {
                List<Topic> topics = new List<Topic>();
                DataAccess da = new DataAccess();
                DataTable dt = da.KeywordSearch(1, filteredKeywords);
                if (dt.Rows.Count != 0)
                    foreach (DataRow row in dt.Rows)
                        topics.Add(Topic.GetTopicByID(Convert.ToInt16(row["TopicID"])));
                return topics;
            }
            return null;
        }

        #endregion
    }
}
