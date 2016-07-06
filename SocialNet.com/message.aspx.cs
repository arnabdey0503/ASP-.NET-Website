using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class message : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null)
        {
            Response.Redirect("Default.aspx?flag=1");
        }
        if (Session["tmpid"] == null)
        {
            Response.Redirect("Homepage.aspx");
        }
        DataSet ds = DBAccess.FetchData("select * from user_tb where uid = " + Session["tmpid"].ToString() + "");
        Image1.ImageUrl = ds.Tables[0].Rows[0]["uPic"].ToString();
        Image2.ImageUrl = ds.Tables[0].Rows[0]["uCov"].ToString();
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Session["uid"] = null;
        Session["tmpid"] = null;
        Session.Abandon();
        Response.Redirect("Default.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["uid"] == null)
        {
            Response.Redirect("Default.aspx?flag=1");
        }
        if (Session["tmpid"] == null)
            Response.Redirect("Homepage.aspx");
        
        DBAccess.SaveData("insert into msg (id_to, id_from, msg) values("+Session["tmpid"] +", "+ Session["uid"]+", '"+ TextBox1.Text +"')");
        Response.Redirect("Messages.aspx?msg=sent");
    }
}