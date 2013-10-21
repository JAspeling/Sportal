using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

namespace DAL
{
    public class DataAccess
    {
        /// <constructor>
        /// Constructor
        /// </constructor>
        public DataAccess()
        {
            connection = new SqlConnection("Data Source=MR-BEASTLY;Initial Catalog=SPortalDb;Integrated Security=True");

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

        public DataTable KeywordSearch(int type, List<string> keywords )
        {
            DataSet ds = new DataSet();
            try
            {
                connection.Open();

                StringBuilder searchString = new StringBuilder();

                if (type == 1)
                    searchString.Append(String.Format("SELECT TopicID FROM Topic WHERE TopicName LIKE '%{0}%'", keywords[0]));
                else
                    searchString.Append(String.Format("SELECT TopicName FROM Topic WHERE TopicName LIKE '%{0}%'", keywords[0]));

                for (int counter = 1; counter < keywords.Count; counter++)
                    searchString.Append(String.Format(" OR TopicName LIKE '%{0}%'", keywords[counter]));

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = searchString.ToString();
                cmd.ExecuteNonQuery();
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
            if (ds.Tables[0].Rows.Count > 0)
                return ds.Tables[0];
            else
                return null;
        }
    }
}
