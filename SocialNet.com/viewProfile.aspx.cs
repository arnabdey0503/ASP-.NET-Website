using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class viewProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null)
        {
            Response.Redirect("Default.aspx?flag=1");
        }
        if(Session["tmpid"] == null ){
            Response.Redirect("Homepage.aspx");
        }
        DataSet ds = DBAccess.FetchData("select * from user_tb where uid = " + Session["tmpid"].ToString() + "");
        Image1.ImageUrl = ds.Tables[0].Rows[0]["uPic"].ToString();
        Image2.ImageUrl = ds.Tables[0].Rows[0]["uCov"].ToString();
        //Image3.Visible = false;
        DataSet ds2 = DBAccess.FetchData("select * from friend where (uid = " + Session["tmpid"].ToString() + " and fuid_sender = " + Session["uid"].ToString() + ") or (uid = " + Session["uid"].ToString() + " and fuid_sender = " + Session["tmpid"].ToString() + ")");
        if (ds2.Tables[0].Rows.Count != 0)
        {
            if (!ds2.Tables[0].Rows[0]["state"].ToString().Equals("no"))
            {
                Button2.Visible = false;
            }
        }
            
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int i=DBAccess.SaveData("insert into posts ( uid, uid_sender, msg) values ( " + Session["tmpid"] + "," + Session["uid"] + ",'" + TextBox1.Text + "')");
        if (i > 0)
        {
            Response.Redirect("viewProfile.aspx?post=successful");
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (TextBox3.Text != "")
        {
            String txt = TextBox3.Text;
            Response.Redirect("SearchResults.aspx?search="+txt);
        }
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        string ext, name, path;
        name = "t";
        ext = System.IO.Path.GetExtension(FileUpload3.FileName.ToString());
        if (ext == ".jpg" || ext == ".jpeg" || ext == ".JPG" || ext == ".JPEG")
        {
            DataSet ds = DBAccess.FetchData("select * from posts where post_id= ( select MAX(post_id) from posts)");
            String pid = (ds.Tables[0].Rows.Count == 0 ? "0" : ds.Tables[0].Rows[0]["post_id"].ToString());
            name = Session["name"].ToString()+"To"+Session["tmpname"] + pid + ext;

            FileUpload3.PostedFile.SaveAs(Server.MapPath("~/pics/") + name);
            path = "~/pics/" + name;
            String txt = TextBox2.Text;
            DBAccess.SaveData("insert into posts ( uid, uid_sender, type, pic, msg) values ( " + Session["tmpid"] + "," + Session["uid"] + ",'image','" + path + "','" + txt + "')");
            Response.Redirect("viewProfile.aspx?picture=updated");
        }
        else
        {
            Label3.Text = "Not an image...";
        }
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Session["uid"] = null;
        Session["tmpid"] = null;
        Session.Abandon();
        Response.Redirect("Default.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        DataSet ds = DBAccess.FetchData("select * from friend where (uid = " + Session["tmpid"].ToString() + " and fuid_sender = " + Session["uid"].ToString() + ") or (uid = " + Session["uid"].ToString() + " and fuid_sender = " + Session["tmpid"].ToString() + ")");
        if (ds.Tables[0].Rows.Count != 0)
        {
            String fid = ds.Tables[0].Rows[0]["fId"].ToString();
            DBAccess.SaveData("update friend set uid ="+Session["tmpid"]+" , fuid_sender="+Session["uid"]+" where fId="+fid );
            if (ds.Tables[0].Rows[0]["state"].ToString().Equals("no"))
            {

                DBAccess.SaveData("update friend set state = 'stalled' where fId = '" + fid + "'");
            }
        }
        else
        {
            DBAccess.SaveData("insert into friend (uid, fuid_sender) values( " + Session["tmpid"] + " ," + Session["uid"] + ")");
        }
    
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        
        Response.Redirect("message.aspx");
    }
}