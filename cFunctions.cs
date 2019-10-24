using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Collections;

namespace MyYugiohStore
{
    public class cFunctions
    {
        public string StringConnection
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["MyYugiohStoreConnectionString"].ConnectionString;
            }
        }

        public DataSet GetDataset(string sSQL)
        {
            DataSet oDataset = new DataSet();
            SqlDataAdapter dataAdapter = new SqlDataAdapter(sSQL, StringConnection);
            string sMessage = "";

            try
            {
                dataAdapter.Fill(oDataset, "DatasetOutput");
            }
            catch (Exception ex)
            {
                sMessage = ex.Message.ToString();
                return oDataset;
            }

            return oDataset;
        }


        public long GetLong(string sSQL)
        {
            SqlDataReader oReader = null;
            SqlConnection oConnection;
            SqlCommand oCommand;
            long iOutput = 0;

            try
            {
                oConnection = new SqlConnection(StringConnection.ToString().Trim());
                oCommand = new SqlCommand(sSQL, oConnection);
                oConnection.Open();
                oReader = oCommand.ExecuteReader();

                if (oReader.Read())
                {
                    iOutput = oReader.GetInt32(0);
                }

                oReader.Close();
                oConnection.Close();
            }
            catch
            {
                return iOutput;
            }

            return iOutput;
        }

        public string GetString(string sSQL)
        {
            SqlDataReader oReader = null;
            SqlConnection oConnection;
            SqlCommand oCommand;
            string sOutput = "";

            try
            {
                oConnection = new SqlConnection(StringConnection.ToString().Trim());
                oCommand = new SqlCommand(sSQL, oConnection);
                oConnection.Open();
                oReader = oCommand.ExecuteReader();

                if (oReader.Read())
                {
                    sOutput = oReader.GetValue(0).ToString().Trim();
                }

                oReader.Close();
                oConnection.Close();
            }
            catch (Exception ex)
            {
                sOutput = ex.Message;
                return sOutput;
            }

            return sOutput;
        }

        public Boolean GetStringBool(string sSQL)
        {
            SqlDataReader oReader = null;
            SqlConnection oConnection;
            SqlCommand oCommand;
            //string sOutput = "";
            string sOutput1 = "";
            DateTime sOutput = DateTime.Today;

            try
            {
                oConnection = new SqlConnection(StringConnection.ToString().Trim());
                oCommand = new SqlCommand(sSQL, oConnection);
                oConnection.Open();
                oReader = oCommand.ExecuteReader();

                if (oReader.Read())
                {
                    try
                    {
                        sOutput = DateTime.Parse(oReader.GetDateTime(0).ToShortTimeString());
                    }
                    catch (Exception ex)
                    {
                        sOutput1 = ex.Message;
                        return false;
                    }
                }

                oReader.Close();
                oConnection.Close();
            }
            catch (Exception ex)
            {
                sOutput1 = ex.Message;
                return false;
            }

            return true;
        }

        public int RunQuery(string sSQL)
        {
            SqlConnection oConnection;
            SqlCommand oCommand;
            SqlDataReader oReader;
            string sString = "";

            try
            {
                oConnection = new SqlConnection(StringConnection.ToString().Trim());
                oCommand = new SqlCommand(sSQL, oConnection);
                oConnection.Open();
                oReader = oCommand.ExecuteReader();
                oReader.Close();
                oConnection.Close();
                oCommand.Dispose();


            }
            catch (Exception ex)
            {
                sString = ex.Message.ToString().Trim();
                return 0;
            }
            finally
            {
                oReader = null;
                oConnection = null;
                oCommand = null;
            }

            return 1;
        }

        public int GetInteger(string sSQL)
        {
            SqlDataReader oReader = null;
            SqlConnection oConnection;
            SqlCommand oCommand;
            int iOutput = 0;

            try
            {
                oConnection = new SqlConnection(StringConnection.ToString().Trim());
                oCommand = new SqlCommand(sSQL, oConnection);
                oConnection.Open();
                oReader = oCommand.ExecuteReader();

                if (oReader.Read())
                {
                    iOutput = oReader.GetInt32(0);
                }

                oReader.Close();
                oConnection.Close();
            }
            catch
            {
                return iOutput;
            }

            return iOutput;
        }

        public int GetCount(string sSQL)
        {
            SqlDataReader oReader;
            SqlConnection oConnection;
            SqlCommand oCommand;
            int iCount = 0;

            try
            {
                string oConnectionString = StringConnection.ToString().Trim();
                oConnection = new SqlConnection(oConnectionString);
                oCommand = new SqlCommand(sSQL, oConnection);
                oConnection.Open();
                oReader = oCommand.ExecuteReader();
                if (oReader.Read())
                {
                    iCount = oReader.GetInt32(0);
                }

                oReader.Close();
                oConnection.Close();
            }
            catch
            {
                return 0;
            }

            return iCount;
        }

        public bool RunSprocBool(string sSproc, Hashtable hParms)
        {

            SqlConnection oConnection = new SqlConnection(StringConnection.ToString().Trim());
            SqlCommand oCommand = new SqlCommand(sSproc, oConnection);
            oCommand.CommandType = CommandType.StoredProcedure;
            oCommand.CommandText = sSproc.ToString().Trim();

            foreach (DictionaryEntry element in hParms)
            {
                string sKey = (string)element.Key;
                string sValue = (string)element.Value;
                oCommand.Parameters.AddWithValue(sKey, sValue);
            }

            try
            {
                oConnection.Open();
                int rows = oCommand.ExecuteNonQuery();
                oCommand.Connection.Close();
                oCommand.Dispose();
            }
            catch (Exception ex)
            {
                string sEx = ex.Message.ToString().Trim();
                return false;
            }
            finally
            {
                oConnection = null;
                oCommand = null;
            }

            return true;
        }

        public DataSet RunSprocDataSet(string sSproc, Hashtable hParms)
        {
            SqlConnection oConnection = new SqlConnection(StringConnection.ToString().Trim());
            SqlCommand oCommand = new SqlCommand(sSproc, oConnection);
            DataSet oDataSet = new System.Data.DataSet();
            SqlDataAdapter oSqlDataAdapter = new System.Data.SqlClient.SqlDataAdapter();
            foreach (DictionaryEntry element in hParms)
            {
                string sKey = (string)element.Key;
                string sValue = (string)element.Value;
                oCommand.Parameters.AddWithValue(sKey, sValue);
            }
            try
            {
                oCommand.CommandType = CommandType.StoredProcedure;
                oCommand.CommandText = sSproc.ToString().Trim();
                oCommand.Connection = oConnection;
                oSqlDataAdapter.SelectCommand = oCommand;
                oSqlDataAdapter.Fill(oDataSet);
                oCommand.Connection.Close();
                oCommand.Dispose();
                oConnection = null;
                oCommand = null;
            }
            catch (Exception ex)
            {
                string sString = ex.Message.ToString().Trim();
                return oDataSet;
            }
            return oDataSet;
        }

        public double GetDouble(string sSQL)
        {
            SqlDataReader oReader = null;
            SqlConnection oConnection;
            SqlCommand oCommand;
            double dOutput = 0;

            try
            {
                oConnection = new SqlConnection(StringConnection.ToString().Trim());
                oCommand = new SqlCommand(sSQL, oConnection);
                oConnection.Open();
                oReader = oCommand.ExecuteReader();

                if (oReader.Read())
                {
                    //dOutput = (oReader.GetValue(0).ToString());
                    dOutput = (double)oReader.GetValue(0);
                }

                oReader.Close();
                oConnection.Close();
            }
            catch (Exception ex)
            {
                String s;
                s = String.Empty;
                s = ex.Message;
                return dOutput;
            }

            return dOutput;
        }
    }
}
