using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class comment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null)
        {
            Response.Redirect("Default.aspx?flag=1");
        }
        if (Request.QueryString["pid"] == null || Request.QueryString["com"] == "")
            Response.Redirect("Homepage.aspx");
        String pid = Request.QueryString["pid"].ToString();
        String msg = Request.QueryString["com"].ToString();
        DBAccess.SaveData("insert into comments (pid,uid,comment) values( " + pid + ", " + Session["uid"] + ", '" + msg + "')");
        Response.Redirect(Session["prevPage"].ToString()+"?comment=successful");
    }
}