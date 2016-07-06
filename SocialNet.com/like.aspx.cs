using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class like : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null)
        {
            Response.Redirect("Default.aspx?flag=1");
        }
        if (Request.QueryString["pid"] == null)
            Response.Redirect("Homepage.aspx");
        String pid = Request.QueryString["pid"].ToString();
        String s = Request.QueryString["s"].ToString();
        if (s.Equals("1"))
        {
            DataSet ds = DBAccess.FetchData("select * from likes where pid=" + pid + " and uid=" + Session["uid"]);
            //Response.Write(ds.Tables[0].Rows[0]["lid"].ToString());
            DBAccess.SaveData("update likes set st=1 where lid="+ds.Tables[0].Rows[0]["lid"].ToString());
        }
        else
            DBAccess.SaveData("insert into likes values ( " + pid + ", " + Session["uid"] + ", 1)");
        Response.Redirect(Session["prevPage"].ToString()+"?liked");
    }
}