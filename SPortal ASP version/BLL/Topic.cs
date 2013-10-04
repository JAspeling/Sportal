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
        public Topic(int id, string name, string description, string text, DateTime date, int upvotes, int downvotes, string topicType)
        {
            this.id = id;
            Name = name;
            Text = text;
            this.date = date;
            Description = description;
            Upvotes = upvotes;
            Downvotes = downvotes;
            TopicType = topicType;
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

        #endregion

        #region Methods
        public static bool CreateTopic(string name, string text)
        {
            //create a new topic
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@TopicName", name),
                                            new SqlParameter("@Text", text) };
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
                    Convert.ToInt16(dt.Rows[0]["Upvotes"].ToString()),
                    Convert.ToInt16(dt.Rows[0]["Downvotes"].ToString()),
                    dt.Rows[0]["TopicType"].ToString());
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

        #endregion
    }
}
