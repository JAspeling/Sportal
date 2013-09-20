using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Group
    {
        ///<constructor>
        ///Constructor
        ///</constructor>
        public Group(string name, string description)
        {
            Name = name;
            Description = description;
            limited = false;
            founded = DateTime.Now.Date;
        }

        #region Fields

        private string name;
        private string description;
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
        public void GetGroupByName(string name)
        {
        }

        public bool Update()
        {
            return true;
        }

        public static List<Group> GetGroupsByUsername(string username)
        {
            return new List<Group>();
        }
        #endregion
    }
}
