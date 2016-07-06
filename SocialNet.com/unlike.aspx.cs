using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class unlike : System.Web.UI.Page
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
        //Response.Write(pid + "    " + s);
        
         DBAccess.SaveData("update likes set st=0 where pid=" + pid + " and uid = " + Session["uid"]);

         Response.Redirect(Session["prevPage"].ToString()+"?unliked");
    }
}