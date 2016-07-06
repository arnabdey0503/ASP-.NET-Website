<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewLikes.aspx.cs" Inherits="viewLikes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
            height: 436px;
        }
        .auto-style1 {
            height: 289px;
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
                    &nbsp;</div>
        
          
      </div>
      <div class="logo">
        <h1><a href="Homepage.aspx"><span>Social</span>Net<small>.com</small></a>
            </h1><asp:Label ID="Label3" runat="server" Height="19px" Width="144px"></asp:Label>
      </div>
      <div class="clr">       
                
          
               <asp:Image ID="Image1" runat="server" Height="85px" Width="91px" BorderStyle="Groove"  />
              
                  
          
          <br />

           
      </div>
        
      <div class="menu_nav">
        <ul>
          <li class="active">
              <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Homepage.aspx">Home</asp:HyperLink></li>
          <li>
              <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/memoryLane.aspx">Memory Lane</asp:HyperLink></li>
          <li><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/friends.aspx">Friends</asp:HyperLink></li>
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
          <div class="article">
            <h2><% Response.Write(Session["name"].ToString()); %></h2>
              
       &nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp;
              <br />
&nbsp;<br />
&nbsp;&nbsp;
              &nbsp;<br />
                <div style="overflow: scroll; height: 800px;">
                      <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="uid" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                      <AlternatingRowStyle BackColor="White" />
                      <Columns>
                          <asp:BoundField DataField="uid" HeaderText="uid" InsertVisible="False" ReadOnly="True" SortExpression="uid" Visible="False" />
                          <asp:BoundField DataField="Name" SortExpression="Name" />
                          <asp:TemplateField SortExpression="uPic">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("uPic") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Image ID="Image3" runat="server" Height="32px" ImageUrl='<%# Eval("uPic") %>' Width="41px" />
                              </ItemTemplate>
                          </asp:TemplateField>
                      </Columns>
                      <EditRowStyle BackColor="#2461BF" />
                      <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                      <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                      <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                      <RowStyle BackColor="#EFF3FB" />
                      <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                      <SortedAscendingCellStyle BackColor="#F5F7FB" />
                      <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                      <SortedDescendingCellStyle BackColor="#E9EBEF" />
                      <SortedDescendingHeaderStyle BackColor="#4870BE" />
                  </asp:GridView>
                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con1 %>" SelectCommand="SELECT user_tb.uid, user_tb.Name, user_tb.uPic FROM likes INNER JOIN user_tb ON likes.pid = @pid AND likes.st = 1 AND likes.uid = user_tb.uid">
                      <SelectParameters>
                          <asp:QueryStringParameter Name="pid" QueryStringField="pid" />
                      </SelectParameters>
                  </asp:SqlDataSource>
                  <br />
                  <asp:Button ID="Button1" runat="server" BackColor="#99CCFF" BorderStyle="Outset" OnClick="Button1_Click" Text="Return" />
              </div>
              &nbsp;<% //String qur = Request.QueryString["search"]; String cmd = "SELECT Name, Username, Email, Sex, uPic, Phone, DOB, Country FROM user_tb where Username=" + qur + " or Email=" + qur; %><br />
              <br />
              <br />
              <br />
              <br />
              <br />
              <br />
              <br />
              <br />
              
          </div>
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
