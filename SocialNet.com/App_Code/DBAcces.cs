using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
/// <summary>
/// Summary description for DBAccess
/// </summary>
public class DBAccess
{
    public static int SaveData(string qur)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con1"].ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand(qur, con);
        int i= cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }
    public static DataSet FetchData(string qur)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con1"].ToString());
        SqlDataAdapter da = new SqlDataAdapter(qur, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }
}