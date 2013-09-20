using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Project
    {
        ///<constructor>
        ///Constructor
        ///</constructor>
        public Project(string name, string description, DateTime startDate, DateTime endDate)
        {
            Name = name;
            Description = description;
            StartDate = startDate;
            EndDate = endDate;
        }

        #region Fields
        private string name;
        private string description;
        private DateTime startDate;
        private DateTime endDate;
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

        public DateTime StartDate
        {
            get { return startDate; }
            set { startDate = value; }
        }

        public DateTime EndDate
        {
            get { return endDate; }
            set { endDate = value; }
        }
        #endregion

        #region Methods
        public void GetProjectByName(string name)
        {

        }

        public bool Update()
        {
            return true;
        }

        public bool Remove()
        {
            return true;
        }

        public static List<Project> GetProjectsByUsername(string username)
        {
            return new List<Project>();
        }
        #endregion
    }
}
