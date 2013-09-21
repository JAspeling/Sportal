using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DAL
{
    public class DataAccess
    {
        /// <constructor>
        /// Constructor
        /// </constructor>
        public DataAccess()
        {
            connection = new SqlConnection("Data Source=XCYTHER;Initial Catalog=SportalDb;Integrated Security=True");

            //string connString = ConfigurationManager.ConnectionStrings["Johan Computer"].ConnectionString;

            //connection = new SqlConnection(connString);
            da = new SqlDataAdapter();
        }

        private SqlConnection connection;
        private SqlDataAdapter da;

        public DataTable Select(string procedure, SqlParameter[] parameters)
        {
            DataSet ds = new DataSet();
            try
            {
                connection.Open();

                SqlCommand cmd = new SqlCommand(procedure, connection);
                cmd.CommandType = CommandType.StoredProcedure;
                if (parameters!= null)
                    cmd.Parameters.AddRange(parameters);
                //cmd.ExecuteNonQuery();
                da.SelectCommand = cmd;
                da.Fill(ds);
            }
            catch (SqlException)
            {
                connection.Close();
            }
            finally
            {
                connection.Close();
            }
            return ds.Tables[0];
        }

        public bool Insert(string procedure, SqlParameter[] parameters)
        {
            try
            {
                connection.Open();

                SqlCommand cmd = new SqlCommand(procedure, connection);
                cmd.CommandType = CommandType.StoredProcedure;
                if (parameters != null)
                    cmd.Parameters.AddRange(parameters);
                da.InsertCommand = cmd;
                cmd.ExecuteNonQuery();
            }
            catch (SqlException)
            {
                //connection.Close();
                return false;
            }
            finally
            {
                connection.Close();
            }
            return true;
        }

        public bool Update(string procedure, SqlParameter[] parameters)
        {
            try
            {
                connection.Open();

                SqlCommand cmd = new SqlCommand(procedure, connection);
                cmd.CommandType = CommandType.StoredProcedure;
                if (parameters != null)
                    cmd.Parameters.AddRange(parameters);
                da.UpdateCommand = cmd;
                cmd.ExecuteNonQuery();
            }
            catch (SqlException)
            {
                connection.Close();
                return false;
            }
            finally
            {
                connection.Close();
            }
            return true;
        }

        public bool Delete(string procedure, SqlParameter[] parameters)
        {
            try
            {
                connection.Open();

                SqlCommand cmd = new SqlCommand(procedure, connection);
                cmd.CommandType = CommandType.StoredProcedure;
                if (parameters != null)
                    cmd.Parameters.AddRange(parameters);
                da.DeleteCommand = cmd;
                cmd.ExecuteNonQuery();
            }
            catch (SqlException)
            {
                connection.Close();
                return false;
            }
            finally
            {
                connection.Close();
            }
            return true;
        }
    }
}
