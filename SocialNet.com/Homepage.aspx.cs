using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Homepage : System.Web.UI.Page
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
        //Image3.Visible = false;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string im_ext, im_name, im_path;
        im_ext = System.IO.Path.GetExtension(FileUpload1.FileName.ToString());
        if (im_ext == ".jpg" || im_ext == ".jpeg" || im_ext == ".JPG" || im_ext == ".JPEG" || im_ext == ".png" || im_ext == ".PNG")
        {
            DataSet ds = DBAccess.FetchData("select * from user_tb where uid = " + Session["uid"].ToString() + "");
            im_name = ds.Tables[0].Rows[0]["Username"] + Session["uid"].ToString() + im_ext;

            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/images/") + im_name);
            im_path = "~/images/" + im_name;
            DBAccess.SaveData("update user_tb set uPic ='" + im_path + "' where uid=" + Session["uid"].ToString() + "");
            Response.Redirect("Homepage.aspx?dp=updated");
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
    protected void Button2_Click1(object sender, EventArgs e)
    {
        string im_ext, im_name, im_path;
        im_ext = System.IO.Path.GetExtension(FileUpload1.FileName.ToString());
        if (im_ext == ".jpg" || im_ext == ".jpeg" || im_ext == ".JPG" || im_ext == ".JPEG")
        {
            DataSet ds = DBAccess.FetchData("select * from user_tb where uid = " + Session["uid"].ToString() + "");
            im_name = ds.Tables[0].Rows[0]["Username"] + Session["uid"].ToString() + im_ext;
            // Image3.Visible = false;
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/images/") + im_name);
            im_path = "~/images/" + im_name;
            //Image1.ImageUrl = im_path;
            DBAccess.SaveData("update user_tb set uPic ='" + im_path + "' where uid=" + Session["uid"].ToString() + "");
            Response.Redirect("Homepage.aspx?dp=updated");
        }
        else
        {
            Label3.Text = "Not an image...";
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int i = DBAccess.SaveData("insert into posts ( uid, uid_sender, msg) values ( " + Session["uid"] + "," + Session["uid"] + ",'" + TextBox1.Text + "')");
        if (i > 0)
        {
            Response.Redirect("Homepage.aspx?post=successful");
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string ext, name, path;
        ext = System.IO.Path.GetExtension(FileUpload2.FileName.ToString());
        if (ext == ".jpg" || ext == ".jpeg" || ext == ".JPG" || ext == ".JPEG")
        {
            DataSet ds = DBAccess.FetchData("select * from user_tb where uid = " + Session["uid"].ToString() + "");
            name = "cov" + ds.Tables[0].Rows[0]["Username"] + Session["uid"].ToString() + ext;

            FileUpload2.PostedFile.SaveAs(Server.MapPath("~/images/") + name);
            path = "~/images/" + name;
            DBAccess.SaveData("update user_tb set uCov ='" + path + "' where uid=" + Session["uid"].ToString() + "");
            Response.Redirect("Homepage.aspx?cover=updated");
        }
        else
        {
            Label3.Text = "Not an image...";
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
            name = Session["name"].ToString() + pid + ext;

            FileUpload3.PostedFile.SaveAs(Server.MapPath("~/pics/") + name);
            path = "~/pics/" + name;
            String txt = TextBox2.Text;
            DBAccess.SaveData("insert into posts ( uid, uid_sender, type, pic, msg) values ( " + Session["uid"] + "," + Session["uid"] + ",'image','" + path + "','" + txt + "')");
            Response.Redirect("Homepage.aspx?picture=updated");
        }
        else
        {
            Label3.Text = "Not an image...";
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (TextBox3.Text != "")
        {
            String txt = TextBox3.Text;
            Response.Redirect("SearchResults.aspx?search=" + txt);
        }
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }

    
}