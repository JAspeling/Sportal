using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    class Institution
    {
        #region Methods
     	public static bool CreateInstitution(string name)
	    {
	        DataAccess da = new DataAccess();
	        SqlParameter[] parameters = { new SqlParameter("@Institution",name) };
	        return da.Update("CreateInstitution",parameters);
	    }

        public static List<string> GetInstitutions()
        {
            List<string> institutions = new List<string>();
            DataAccess da = new DataAccess();
            DataTable dt = da.Select("SelectInstitutions", null);
            foreach (DataRow row in dt.Rows)
                institutions.Add(row["Institution"].ToString());
            return institutions;
        }

        public static bool JoinInstitutionRequest(string institution, string username)
        {
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@Institution",institution),
                                            new SqlParameter("@Username",username) };
            return da.Insert("JoinInstitutionRequest", parameters);
        }

        public static bool LeaveInstitution(string username)
        {
            DataAccess da = new DataAccess();
            SqlParameter[] parameters = { new SqlParameter("@Username",username) };
            return da.Insert("LeaveInstitution", parameters);
        }
        #endregion
    }
}
