using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["flag"] != null)
            {

                if (Request.QueryString["flag"].ToString().Equals("1"))
                {
                    Label3.Text = "Login first ..";
                }
            }

            if (Request.Browser.Cookies)
            {
                if (Request.Cookies["log"] != null)
                {

                    TextBox1.Text = Request.Cookies["log"]["uname"].ToString();
                    TextBox2.Attributes.Add("value", Request.Cookies["log"]["pass"].ToString());
                }
            }
            
                DropDownList4.Items.Add("Day");
                DropDownList5.Items.Add("Month");
                DropDownList6.Items.Add("Year");
                for (int i = 1; i < 32; i++)
                {
                    DropDownList4.Items.Add(i.ToString());
                }
                for (int i = 1; i < 13; i++)
                {
                    DropDownList5.Items.Add(i.ToString());
                }
                for (int i = 1980; i < 2015; i++)
                {
                    DropDownList6.Items.Add(i.ToString());
                }
            
        }
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        if (Request.Browser.Cookies)
        {
            if (CheckBox1.Checked == true)
            {
                Response.Cookies["log"]["uname"] = TextBox1.Text;
                Response.Cookies["log"]["pass"] = TextBox2.Text;
            }
        }
        DataSet ds = DBAccess.FetchData("Select * from [dbo].[user_tb] where Username='" + TextBox1.Text + "' and Password='" + TextBox2.Text + "'");
        if (ds.Tables[0].Rows.Count == 0)
        {

            Label3.Text = "Error......";
        }
        else
        {
            Session["uid"] = ds.Tables[0].Rows[0]["uid"];
            Session["name"] = ds.Tables[0].Rows[0]["Name"];
            Label3.Text = Session["uid"].ToString();
            Response.Redirect("Homepage.aspx");
        }
    }
    protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            string dob = DropDownList4.Text + "/" + DropDownList5.Text + "/" + DropDownList6.Text;
            DBAccess.SaveData("insert into user_tb (Name, Username, Password, Email, Sex, Country, DOB, Phone) values ('"+TextBox3.Text +"', '"+TextBox4.Text +"', '"+TextBox5.Text +"','"+ TextBox7.Text +"', '"+ RadioButtonList1.Text +"', '"+ TextBox9.Text +"', '"+ dob  +"', '"+ TextBox8.Text+"' )   ");
            Response.Redirect("Default.aspx?registeredSuccesfully");
        }
        catch (Exception exx)
        {
            Label4.Text = "Username is already taken";
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        TextBox3.Text = string.Empty;
        TextBox4.Text = string.Empty;
        
        TextBox5.Text = string.Empty;
        TextBox6.Text = string.Empty;
        TextBox7.Text = string.Empty;
        TextBox8.Text = string.Empty; 
        TextBox9.Text = string.Empty;
        DropDownList4.ClearSelection();
        DropDownList5.ClearSelection();
        DropDownList6.ClearSelection();
        RadioButtonList1.ClearSelection();
    }
    protected void TextBox8_TextChanged(object sender, EventArgs e)
    {

    }
    protected void DropDownList6_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
    