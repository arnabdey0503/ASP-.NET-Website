<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Homepage.aspx.cs" Inherits="Homepage" %>
<%@ Import Namespace="System"  %>
<%@ Import Namespace="System.Collections.Generic"  %>
<%@ Import Namespace="System.Linq"  %>
<%@ Import Namespace="System.Web"  %>
<%@ Import Namespace="System.Web.UI"  %>
<%@ Import Namespace="System.Web.UI.WebControls"  %>
<%@ Import Namespace="System.Data"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SocialNet</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
    <style type="text/css">
        .content_bg {
            height: 412px;
        }
        </style>
    </head>
<body>
    
    
<div class="main">
  <div class="main_resize">
    <div class="header">
      <div class="search">
            <form id="form1" runat="server">
            &nbsp;<!--/searchform --><div class="clr">
          <asp:TextBox ID="TextBox3" runat="server" placeholder="Username or email id" Height="21px" Width="135px" BorderStyle="Ridge"></asp:TextBox>
                    &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" Height="21px" ImageUrl="~/images/search.gif" OnClick="ImageButton1_Click" Width="37px" BackColor="#DBDBDB" />
            </div>
        
          
      </div>
      <div class="logo">
        <h1><a href="Homepage.aspx"><span>Social</span>Net<small>.com</small></a>
            </h1><asp:Label ID="Label3" runat="server" Height="19px" Width="144px"></asp:Label>
      </div>
      <div class="clr">       
                
          
               <asp:Image ID="Image1" runat="server" Height="85px" Width="91px" BorderStyle="Groove"  />
              
                  
          
          <br />
          <asp:FileUpload ID="FileUpload1" runat="server"  Height="26px" Width="190px"  ForeColor="#3B3B3B" />
          <asp:Button ID="Button2" runat="server" Text="Change dp" BackColor="#99CCFF" BorderStyle="Outset" OnClick="Button2_Click1" />

           
      </div>
        
      <div class="menu_nav">
        <ul>
          <li class="active">        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Homepage.aspx">Home</asp:HyperLink></li>
          <li>       <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/memoryLane.aspx">Memory Lane</asp:HyperLink></li>
          <li>
              <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/friends.aspx">Friends</asp:HyperLink></li>
           <li><a href="Messages.aspx">Messages</a></li>
            <li><asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">Logout</asp:LinkButton></li>
            
            
        </ul>
        <div class="clr"></div>
      </div>
      <div class="hbg">
          <asp:Image ID="Image2" runat="server" Height="362px"  Width="834px" style="margin-top: 0px" />
        </div>
    </div>
    <div class="content">
      <div class="content_bg">
        <div class="mainbar">
            <asp:FileUpload ID="FileUpload2" runat="server" Width="190px" />
            <asp:Button ID="Button3" runat="server" BackColor="#99CCFF" BorderStyle="Outset" OnClick="Button3_Click" Text="Upload Cover Picture" />
          <div class="article">
              <div style="overflow: scroll; height: 1000px;">
            <h2><% Response.Write(Session["name"].ToString()); %></h2>
              
       &nbsp;<asp:TextBox ID="TextBox1" runat="server" Height="60px" placeholder="What's in your mind?" TextMode="MultiLine" Width="278px" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
              &nbsp;<asp:Button ID="Button1" runat="server" Text="Post" OnClick="Button1_Click" />

              <br />
&nbsp;&nbsp;&nbsp;
              <br />
&nbsp;<asp:FileUpload ID="FileUpload3" runat="server" Height="16px"  Width="183px" />
              <br />
&nbsp;<asp:TextBox ID="TextBox2" placeholder="About the picture.." runat="server" Height="16px" Width="174px" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
              &nbsp;
              <asp:LinkButton ID="LinkButton4" runat="server" BackColor="#99CCFF" BorderStyle="None" Font-Bold="False" Font-Italic="False" ForeColor="#3F3F3F" OnClick="LinkButton4_Click">Add Picture</asp:LinkButton>
                  <br />
              &nbsp;<%DataSet ds = DBAccess.FetchData("select distinct u.uPic ,u.Name ,p.post_id,p.uid,p.uid_sender,p.type,p.pic,p.msg,p.dateTime from friend as f INNER JOIN user_tb as u on ((f.uid =" + Session["uid"] + " and f.fuid_sender=u.uid and f.state='yes' or f.fuid_sender=" + Session["uid"] + " and f.uid=u.uid and f.state='yes') or u.uid=" + Session["uid"] + "  ) INNER JOIN posts as p on u.uid = p.uid order  by  p.dateTime desc");
                      for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                      {
                          DataSet ds3 = DBAccess.FetchData("select * from user_tb where uid =" + ds.Tables[0].Rows[i]["uid_sender"].ToString());
                          DataSet ds4 = DBAccess.FetchData("select * from user_tb where uid =" + ds.Tables[0].Rows[i]["uid"].ToString());
                          String url = ds4.Tables[0].Rows[0]["uPic"].ToString();
                          String name = ds4.Tables[0].Rows[0]["Name"].ToString();
                           DataSet ds2 = DBAccess.FetchData("select * from likes where pid=" + ds.Tables[0].Rows[i]["post_id"].ToString() + " and uid = " + Session["uid"]);
                           HyperLink4.NavigateUrl = "like.aspx?pid=" + ds.Tables[0].Rows[i]["post_id"].ToString()+"&s=0";
                           HyperLink5.NavigateUrl = "unlike.aspx?pid=" + ds.Tables[0].Rows[i]["post_id"].ToString()+"&s=0";
                           HyperLink7.NavigateUrl = "viewLikes.aspx?pid=" + ds.Tables[0].Rows[i]["post_id"].ToString();
                           HyperLink8.NavigateUrl = "viewComments.aspx?pid=" + ds.Tables[0].Rows[i]["post_id"].ToString(); 
                          Session["prevPage"] = "Homepage.aspx";
                          if (ds2.Tables[0].Rows.Count != 0)
                          {
                               HyperLink4.NavigateUrl = "like.aspx?pid=" + ds.Tables[0].Rows[i]["post_id"].ToString()+"&s=1";
                               HyperLink5.NavigateUrl = "unlike.aspx?pid=" + ds.Tables[0].Rows[i]["post_id"].ToString()+"&s=1";
                               if (ds2.Tables[0].Rows[0]["st"].ToString().Equals("1"))
                               {
                                   HyperLink5.Visible = true;
                                   HyperLink4.Visible = false;
                               }
                           }
                          if(! ds.Tables[0].Rows[i]["uid"].ToString().Equals(ds.Tables[0].Rows[i]["uid_sender"].ToString())){
                              Image3.ImageUrl=ds3.Tables[0].Rows[0]["uPic"].ToString();
                               name = ds3.Tables[0].Rows[0]["Name"].ToString() + " to "+name;
                          } 
                              else{       
                          %><% Image3.ImageUrl = url;} %><h2> <asp:Image ID="Image3" runat="server" Height="45px" Width="40px" />
                  
                         <%=name %></h2>
                  <h4> <%=ds.Tables[0].Rows[i]["dateTime"] %></h4>

                  <br /> 
                     <% if(ds.Tables[0].Rows[i]["type"].ToString().Equals("status")){ 
                                  Image4.Visible=false;
                            %>
                            <h3><%=ds.Tables[0].Rows[i]["msg"].ToString() %></h3>
                           <% }  //end of if  %>
                               <% if (ds.Tables[0].Rows[i]["type"].ToString().Equals("image"))
                                  {        
                                  Image4.ImageUrl=ds.Tables[0].Rows[i]["pic"].ToString();
                                %>
                                       &nbsp;<asp:Image ID="Image4" runat="server" Height="156px" Width="294px" /><br />
                <h3> <%= ds.Tables[0].Rows[i]["msg"].ToString() %>  </h3>              
              
                 <% }//end of else %>
                  
                  
                  <br />
                   <asp:HyperLink ID="HyperLink4" runat="server" ImageUrl="~/images/like.jpg" ImageWidth="35px" ></asp:HyperLink>
                  <asp:HyperLink ID="HyperLink5" runat="server" ImageUrl="~/images/unlike.jpg" ImageWidth="35px" Visible="False">HyperLink</asp:HyperLink>
                  
                  <% if (TextBox4.Text == null) HyperLink6.NavigateUrl = "";
                     else
                     {
                         //Session["comment"] = TextBox4.Text;
                         HyperLink6.NavigateUrl = "comment.aspx?pid=" + ds.Tables[0].Rows[i]["post_id"].ToString() + "&com=" + TextBox4.Text;
                     }
                      %>
                  
                   &nbsp;&nbsp;
                  <asp:TextBox ID="TextBox4" runat="server" placeholder="Comment here.." Height="24px" Width="146px" AutoPostBack="True" ></asp:TextBox>
                  <asp:HyperLink ID="HyperLink6" runat="server" ImageUrl="~/images/comment.jpg" ImageWidth="24px" Visible="true"></asp:HyperLink>
                  
                  
                  
                   <br />
                  
                  
                  
                   &nbsp;<asp:HyperLink ID="HyperLink7" runat="server">view likes</asp:HyperLink>
                  
                  
                  
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:HyperLink ID="HyperLink8" runat="server">view comments..</asp:HyperLink>
                  
                  
                  
                   <br /><br />  
                <% HyperLink5.Visible = false;
                   HyperLink4.Visible = true;
                   //TextBox4.Text = string.Empty;
                   //HyperLink6.Visible = false;
                      }//end of for loop
                  %>
                  </div>
&nbsp;</div>
        </div>
        <div class="sidebar">
          <div class="gadget">
            <h2 class="star"><span>Our Sponsors</span> </h2>
            <div class="clr"></div>
            <ul class="sb_menu">
              <li class="active">Red FM 98.3</li>
              <li>Gaana</li>
              <li>Paytm</li>
              <li>WeChat</li>
              <li>Go Ibibo</li>
              <li>Airlines International</li>
            </ul>
          </div>
          
          <div class="gadget">
            <h2 class="star"><span>Quote of the day</span></h2>
            <div class="testi">
              <p><span class="q"><img src="images/qoute_1.gif" width="20" height="15" alt="" /></span> We can let circumstances rule us, or we can take charge and rule our lives from within. <span class="q"><img src="images/qoute_2.gif" width="20" height="15" alt="" /></span></p>
                <p class="title">&nbsp;</p>
                <p class="title"><strong>Earl Nightingale</strong></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="fbg">
    <div class="fbg_resize">
        <div class="col c1">
            <h2><span>Founders</h2>
        <a href="#"><img src="images/ad.jpg" width="58" height="58" alt="" /></a> <a href="#"><img src="images/pic_2.jpg" width="58" height="58" alt="" /></a> <a href="#"><img src="images/pic_3.jpg" width="58" height="58" alt="" /></a> <a href="#"><img src="images/pic_4.jpg" width="58" height="58" alt="" /></a> <a href="#"><img src="images/pic_5.jpg" width="58" height="58" alt="" /></a> <a href="#"><img src="images/pic_6.jpg" width="58" height="58" alt="" /></a> </div>
      <div class="col c2">
        <h2>Objective</h2>
        <p>A social network for all.
          Anyone can pitch in with their ideas and enthusiasm and cherish the company of their friends and beloved ones through this platform.&nbsp;  
           Lets spread the message of love and fraternity and make this world a better place to live in </p>
      </div>
      <div class="col c3">
        <h2><span>About</span></h2>
          <span>
        <p>This site celebrates how our friends inspire us , support us , and help us discover the world when we connect. People use SocialNet to stay connected with friends and family , to discover what's going on in the world, and to share and express what matters to them .</p>
          </span>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer_resize">
    <p class="lf">&copy; Copyright <a href="#">SocialNet.com</a>.</p>
    <p class="rf">&nbsp;</p>
    <div class="clr"></div>
  </div>
</div>
<div class="footer">
</div>
<div align=center></div>
    </form>
</body>
</html>
