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
        public Post(PostType postType, int postID, int commentID, string text, string username, int upvotes, int downvotes, DateTime date)
        {
            //postID = thread or main post
            //commentID = main post or comments on that post
            this.postType = postType;
            this.postID = postID;
            this.commentID = commentID;
            Text = text;
            Username = username;
            Upvotes = upvotes;
            Downvotes = downvotes;
            this.date = date;
        }

        #region Fields
        private PostType postType;
        private int postID;
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

        public int PostID
        {
            get { return postID; }
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
        public bool Upvote(int postID)
        {
            //this uses a procedure to upvote a post
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@PostTypeID",Convert.ToString((int)postType)),
                                            new SqlParameter("@PostID",postID),
                                            new SqlParameter("@CommentID",commentID),
                                            new SqlParameter("@Vote","1")};
            return da.Update("UpdatePostVotes", parameters);
        }

        public bool Downvote(int postID)
        {
            //this uses a procedure to downvote a post
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@PostTypeID",Convert.ToString((int)postType)),
                                            new SqlParameter("@PostID",postID),
                                            new SqlParameter("@CommentID",commentID),
                                            new SqlParameter("@Vote","-1")};
            return da.Update("UpdatePostVotes", parameters);
        }

        public static bool CreatePost(PostType postType, string description, string username)
        {
            //create a new post
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@PostTypeID",Convert.ToString((int)postType)),
                                            new SqlParameter("@Text", description),
                                            new SqlParameter("@Username", username)};
            return da.Insert("CreatePost", parameters);
        }

        public static Post GetPostByPostID(int postID)
        {
            //gets a new post based on the unique postID
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@PostID", postID) };
            DataTable dt = da.Select("SelectPostByPostID", parameters);
            return new Post((PostType)Convert.ToInt16(dt.Rows[0]["PostTypeID"]), Convert.ToInt16(dt.Rows[0]["PostID"]), Convert.ToInt16(dt.Rows[0]["CommentID"]), 
                            dt.Rows[0]["Text"].ToString(), dt.Rows[0]["Username"].ToString(), Convert.ToInt16(dt.Rows[0]["UpVotes"]), 
                            Convert.ToInt16(dt.Rows[0]["DownVotes"]), Convert.ToDateTime(dt.Rows[0]["SubmissionDate"]));
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
        #endregion
    }
}
