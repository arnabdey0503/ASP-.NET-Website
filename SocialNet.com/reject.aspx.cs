using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class reject : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null)
        {
            Response.Redirect("Default.aspx?flag=1");
        }
        if (Request.QueryString["fid"] == null)
            Response.Redirect("Homepage.aspx");
        String id = Request.QueryString["fid"].ToString();
        DBAccess.SaveData("update friend set state='no' where fId=" + id);
        Response.Redirect("friends.aspx?request=rejected");
    }
}