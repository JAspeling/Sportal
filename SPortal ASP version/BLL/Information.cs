using System.Data.SqlClient;
using System.Runtime.Remoting.Messaging;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace BLL
{
    public class Information
    {
        ///<constructor>
        ///Constructor
        ///</constructor>
        public Information() { }

        #region Fields
        #endregion

        #region Properties
        #endregion

        #region Methods

        public static List<string> GetEmails()
        {
            DataAccess da = new DataAccess();
            List<string> emails = new List<string>();

            DataTable dt = da.Select("SelectEmails", null);
            foreach (DataRow row in dt.Rows)
            {
                emails.Add(row["Email"].ToString());
            }

            return emails;
        }
        #endregion
    }
}
