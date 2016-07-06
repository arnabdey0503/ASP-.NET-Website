using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Search_send_msg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null)
        {
            Response.Redirect("Default.aspx?flag=1");
        }
        DataSet ds = DBAccess.FetchData("select * from user_tb where uid = " + Session["uid"].ToString() + "");
        Image1.ImageUrl = ds.Tables[0].Rows[0]["uPic"].ToString();
        Image2.ImageUrl = ds.Tables[0].Rows[0]["uCov"].ToString();
    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        Session["tmpid"] = GridView1.SelectedValue.ToString();
        DataSet ds = DBAccess.FetchData("select * from user_tb where uid = " + Session["tmpid"].ToString() + "");
        Session["tmpname"] = (ds.Tables[0].Rows.Count == 0) ? "Bhoot" : ds.Tables[0].Rows[0]["Name"].ToString();
        if (Session["tmpid"].ToString().Equals(Session["uid"].ToString()))
            Response.Redirect("Homepage.aspx");
        else
            Response.Redirect("message.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Session["uid"] = null;
        Session["tmpid"] = null;
        Session.Abandon();
        Response.Redirect("Default.aspx");
    }
}