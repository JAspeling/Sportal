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
    class Topic
    {
        ///<constructor>
        ///Constructor
        ///</constructor>
        public Topic(string name, string text, DateTime date)
        {
            Name = name;
            Text = text;
            this.date = date;
        }

        #region Fields
        private string name;
        private string text;
        private DateTime date;
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
            return new Topic(dt.Rows[0]["TopicName"].ToString(), dt.Rows[0]["Text"].ToString(), Convert.ToDateTime(dt.Rows[0]["CreationDate"]));
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
        #endregion
    }
}
