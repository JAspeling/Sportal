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
    public class Post
    {
        ///<constructor>
        ///Constructor
        ///</constructor>
        public Post(PostType postType, int id, int commentID, string text, string username, DateTime date)
        {
            //postID = thread or main post
            //commentID = main post or comments on that post
            this.postType = postType;
            this.id = id;
            this.commentID = commentID;
            Text = text;
            Username = username;
            this.date = date;
        }

        #region Fields
        private PostType postType;
        private int id;
        private int commentID;
        private string text;
        private string username;
        private int upvotes;
        private int downvotes;
        private DateTime date;
        #endregion

        #region Properties
        public PostType PostType
        {
            get { return postType; }
        }

        public int Id
        {
            get { return id; }
        }

        public int CommentID
        {
            get { return commentID; }
        }

        public string Text
        {
            get { return text; }
            set { text = value; }
        }
        
        public string Username
        {
            get { return username; }
            set { username = value; }
        }

        public int Upvotes
        {
            get { return upvotes; }
            set { upvotes = value; }
        }

        public int Downvotes
        {
            get { return downvotes; }
            set { downvotes = value; }
        }

        public DateTime Date
        {
            get { return date; }
        }
        #endregion

        #region Methods
        public bool Upvote(string username)
        {
            //this uses a procedure to upvote a post
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@Type", 2),
                                            new SqlParameter("@PostID",id),
                                            new SqlParameter("@Username",username)};
            return da.Update("Upvote", parameters);
        }

        public bool Downvote(string username)
        {
            //this uses a procedure to downvote a post
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@Type", 2),
                                            new SqlParameter("@PostID",id),
                                            new SqlParameter("@Username",username)};
            return da.Update("Downvote", parameters);
        }


        public static bool CreatePost(PostType postType, string text, string username, int topicID)
        {
            //create a new post
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@PostTypeID",(int)postType),
                                            new SqlParameter("@Text", text),
                                            new SqlParameter("@Username", username),
                                            new SqlParameter("@TopicID", topicID)};
            return da.Insert("CreatePost", parameters);
        }

        public static bool CreatePostReply(PostType postType, string text, string username, int postID)
        {
            //create a new post
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@PostTypeID",(int)postType),
                                            new SqlParameter("@Text", text),
                                            new SqlParameter("@Username", username),
                                            new SqlParameter("@PostID", postID)};
            return da.Insert("CreatePostReply", parameters);
        }

        public static Post GetPostByPostID(int postID)
        {
            //gets a new post based on the unique postID
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = {new SqlParameter("@PostID", postID)};
            DataTable dt = da.Select("SelectPostByPostID", parameters);
            if (dt.Rows.Count > 0)
            {
                PostType postType = dt.Rows[0]["PostTypeID"].ToString() == "Parent" ? PostType.PARENT : PostType.CHILD;
                int commentId = dt.Rows[0]["CommentID"] == DBNull.Value ? -1 : Convert.ToInt16(dt.Rows[0]["CommentID"]);
                return new Post(postType,
                    Convert.ToInt16(dt.Rows[0]["PostID"]),
                    commentId,
                    dt.Rows[0]["Text"].ToString(), dt.Rows[0]["Username"].ToString(),
                    Convert.ToDateTime(dt.Rows[0]["SubmissionDate"]));
            }

            return null;
        }

        public static string GetPostTopicName(int postID)
        {
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@PostID", postID) };
            DataTable dt = da.Select("SelectPostTopicName", parameters);
            if (dt.Rows.Count > 0)
            {
                return dt.Rows[0]["TopicName"].ToString();
            }

            return null;
        }

        public static List<Post> GetPostsByPostID(int postID)
        {
            //uses a stored procedure to get all postIDs, then uses those ids to get a list of posts
            List<Post> posts = new List<Post>();
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@PostID", postID) };
            DataTable dt = da.Select("SelectPostsByPostID", parameters);
            foreach (DataRow row in dt.Rows)
                posts.Add(Post.GetPostByPostID(Convert.ToInt16(row["PostID"])));
            return posts;
        }

        public static List<Post> GetPostsByUser(string username)
        {
            //uses a stored procedure to get all postIDs, then uses those names to get a list of posts, based on username
            List<Post> posts = new List<Post>();
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@Username", username) };
            DataTable dt = da.Select("SelectPostsByUser", parameters);
            foreach (DataRow row in dt.Rows)
                posts.Add(Post.GetPostByPostID(Convert.ToInt16(row["PostID"])));
            return posts;
        }

        public static bool Remove(int postID)
        {
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@PostID", postID.ToString()) };
            return da.Delete("RemovePost", parameters);
        }

        public int GetPostRating()
        {
            int upvotes = 0;
            int downvotes = 0;
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@PostID", id) };
            DataTable dt = da.Select("SelectPostRating", parameters);
            if (dt.Rows.Count > 0)
            {
                upvotes = Convert.ToInt16(dt.Rows[0]["Upvotes"].ToString());
                downvotes = Convert.ToInt16(dt.Rows[0]["Downvotes"].ToString());
                return (upvotes - downvotes);
            }
                
            return 0;
        }

        public static List<Post> GetPostsByTopicID(int topicId)
        {
            List<Post> posts = new List<Post>();
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@TopicID", topicId) };
            DataTable dt = da.Select("SelectPostsByTopicID", parameters);
            foreach (DataRow row in dt.Rows)
            {
                PostType postType = row["PostType"].ToString() == "Parent" ? PostType.PARENT : PostType.CHILD;
                int commentID = row["CommentID"] == DBNull.Value ? 0 : Convert.ToInt16(row["CommentID"].ToString());
                posts.Add(new Post(postType, Convert.ToInt16(row["PostID"].ToString()),
                    commentID, row["Text"].ToString(),
                    row["Username"].ToString(), 
                    Convert.ToDateTime(row["SubmissionDate"])));
            }

            return posts;
        }

        public static List<Post> GetPostsReplies(int postID)
        {
            List<Post> posts = new List<Post>();
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@PostID", postID) };
            DataTable dt = da.Select("SelectPostReplies", parameters);
            foreach (DataRow row in dt.Rows)
                posts.Add(Post.GetPostByPostID(Convert.ToInt16(row["PostID"])));
            return posts;
        }

        public int GetUpvotes()
        {
            //uses a stored procedure to get all upvotes
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@Type",2),
                                            new SqlParameter("@ID",id) };
            DataTable dt = da.Select("SelectUpvotes", parameters);
            return Convert.ToInt16(dt.Rows[0]["Upvotes"]);
        }

        public int GetDownvotes()
        {
            //uses a stored procedure to get all downvotes
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@Type",2),
                                            new SqlParameter("@ID",id) };
            DataTable dt = da.Select("SelectDownvotes", parameters);
            return Convert.ToInt16(dt.Rows[0]["Downvotes"]);
        }
        #endregion
    }
}
