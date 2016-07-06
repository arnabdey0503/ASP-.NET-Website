using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class viewComments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null)
        {
            Response.Redirect("Default.aspx?flag=1");
        }
        if (Request.QueryString["pid"] == null)
            Response.Redirect("Homepage.aspx");
        DataSet ds = DBAccess.FetchData("select * from user_tb where uid = " + Session["uid"].ToString() + "");
        Image1.ImageUrl = ds.Tables[0].Rows[0]["uPic"].ToString();
        Image2.ImageUrl = ds.Tables[0].Rows[0]["uCov"].ToString();
    }
        protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect(Session["prevPage"].ToString());
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Session["uid"] = null;
        Session["tmpid"] = null;
        Session.Abandon();
        Response.Redirect("Default.aspx");
    }
}