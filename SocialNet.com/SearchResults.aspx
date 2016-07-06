<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchResults.aspx.cs" Inherits="SearchResults" %>

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
            height: 436px;
        }
        .auto-style1 {
            height: 216px;
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
          <asp:FileUpload ID="FileUpload1" runat="server" Height="26px" Width="190px"  ForeColor="#3B3B3B" />
          <asp:Button ID="Button2" runat="server" Text="Change dp" BackColor="#99CCFF" BorderStyle="Outset" OnClick="Button2_Click1" />

           
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
            <asp:FileUpload ID="FileUpload2" runat="server" Width="190px" />
            <asp:Button ID="Button3" runat="server" BackColor="#99CCFF" BorderStyle="Outset" OnClick="Button3_Click" Text="Upload Cover Picture" />
          <div class="article">
            <h2><% Response.Write(Session["name"].ToString()); %></h2>
              
       &nbsp;<asp:TextBox ID="TextBox1" runat="server" Height="60px" placeholder="What's in your mind?" TextMode="MultiLine" Width="278px"></asp:TextBox>
              &nbsp;<asp:Button ID="Button1" runat="server" Text="Post" OnClick="Button1_Click" />

              <br />
&nbsp;&nbsp;&nbsp;
              <br />
&nbsp;<asp:FileUpload ID="FileUpload3" runat="server" Height="16px"  Width="183px" />
              <br />
&nbsp;<asp:TextBox ID="TextBox2" placeholder="About the picture.." runat="server" Height="16px" Width="174px"></asp:TextBox>
              &nbsp;
              <asp:LinkButton ID="LinkButton4" runat="server" BackColor="#99CCFF" BorderStyle="None" Font-Bold="False" Font-Italic="False" ForeColor="#3F3F3F" OnClick="LinkButton4_Click">Add Picture</asp:LinkButton>
              <br />
&nbsp;<br />
              <div class="auto-style1" style="overflow: scroll">
                  <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="uid" DataSourceID="SqlDataSource1" PageSize="3" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" CellPadding="4" ForeColor="#333333" GridLines="None">
                      <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                  <Columns>
                      <asp:CommandField ShowSelectButton="True" SelectText="View Profile" />
                      <asp:TemplateField HeaderText="uPic" SortExpression="uPic">
                          <EditItemTemplate>
                              <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("uPic") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Image ID="Image3" runat="server" Height="69px" ImageUrl='<%# Eval("uPic") %>' Width="74px" />
                          </ItemTemplate>
                      </asp:TemplateField>
                      <asp:BoundField DataField="uid" HeaderText="uid" InsertVisible="False" ReadOnly="True" SortExpression="uid" Visible="False" />
                      <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                      <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" Visible="False" />
                      <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" Visible="False" />
                      <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                      <asp:BoundField DataField="Sex" HeaderText="Sex" SortExpression="Sex" />
                      <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                      <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                      <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                      <asp:BoundField DataField="uCov" HeaderText="uCov" SortExpression="uCov" Visible="False" />
                  </Columns>
                      <EditRowStyle BackColor="#999999" />
                      <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                      <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                      <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                      <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                      <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                      <SortedAscendingCellStyle BackColor="#E9E7E2" />
                      <SortedAscendingHeaderStyle BackColor="#506C8C" />
                      <SortedDescendingCellStyle BackColor="#FFFDF8" />
                      <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
              </asp:GridView>
              </div>
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con1 %>" SelectCommand="SELECT * FROM [user_tb] WHERE (([Email] = @Email) OR ([Name] LIKE '%' + @Name + '%'))">
                  <SelectParameters>
                      <asp:QueryStringParameter Name="Email" QueryStringField="search" Type="String" />
                      <asp:QueryStringParameter Name="Name" QueryStringField="search" Type="String" />
                  </SelectParameters>
              </asp:SqlDataSource>
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
