<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
        .auto-style1 {
            width: 167px;
        }
        .auto-style2 {
            width: 238px;
        }
        .auto-style3 {
            width: 167px;
            height: 27px;
        }
        .auto-style4 {
            width: 238px;
            height: 27px;
        }
        .auto-style5 {
            height: 27px;
        }
    </style>
    </head>
<body>
    
    
    <form id="form1" runat="server">
    
    
<div class="main">
  <div class="main_resize">
    <div class="header">
      <div class="search">
            
          <asp:TextBox ID="TextBox1" placeholder="Enter Username" runat="server"></asp:TextBox>
          <asp:TextBox ID="TextBox2" placeholder="Enter Password" runat="server" TextMode="Password"></asp:TextBox>
          <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Login" CausesValidation="False" />
          <br />
          <asp:CheckBox ID="CheckBox1" runat="server" Text="Remember Me" />
            
      </div>
      <div class="logo">
        <h1><a href="#"><span>Social</span>Net<small>.com</small></a>
            </h1><asp:Label ID="Label3" runat="server" Height="19px" Width="144px"></asp:Label>
      </div>
      <div class="clr"></div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="index.html">Home</a></li>
          <li><a href="support.html">Support</a></li>
          <li><a href="about.html">About Us</a></li>
          <li><a href="blog.html">Blog</a></li>
          <li><a href="contact.html">Contact Us</a></li>
        </ul>
        <div class="clr"></div>
      </div>
      <div class="hbg"><img src="images/header_images.jpg" width="923" height="291" alt="" /></div>
    </div>
    <div class="content">
      <div class="content_bg">
        <div class="mainbar">
          
          <div class="article">
            <h2><span>Register Yourself</span> </h2>
            
<br />
              <table style="width:97%;">
                  <tr>
                      <td class="auto-style1">&nbsp;Name :</td>
                      <td class="auto-style2">
                          <asp:TextBox ID="TextBox3" runat="server" Height="17px" Width="185px"></asp:TextBox>
                      </td>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="Required*"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                      <td class="auto-style3">Username: </td>
                      <td class="auto-style4">
                          <asp:TextBox ID="TextBox4" runat="server" Height="17px" Width="185px"></asp:TextBox>
                      </td>
                      <td class="auto-style5">
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox4" ErrorMessage="Required*"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                      <td class="auto-style1">Password :</td>
                      <td class="auto-style2">
                          <asp:TextBox ID="TextBox5" runat="server" Height="17px" Width="185px" TextMode="Password"></asp:TextBox>
                      </td>
                      <td>
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox5" ErrorMessage="Min. length is 6" ValidationExpression="\w{6,30}"></asp:RegularExpressionValidator>
                          <br />
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox5" ErrorMessage="Required*"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                      <td class="auto-style1">Re-enter Password :</td>
                      <td class="auto-style2">
                          <asp:TextBox ID="TextBox6" runat="server" Height="17px" Width="185px" TextMode="Password"></asp:TextBox>
                      </td>
                      <td>
                          <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox5" ControlToValidate="TextBox6" ErrorMessage="Password mismatch"></asp:CompareValidator>
                      </td>
                  </tr>
                  <tr>
                      <td class="auto-style1">Email-Id</td>
                      <td class="auto-style2">
                          <asp:TextBox ID="TextBox7" runat="server" Height="17px" Width="185px"></asp:TextBox>
                      </td>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox7" ErrorMessage="Required*"></asp:RequiredFieldValidator>
                          <br />
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox7" ErrorMessage="Not a valid email id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                      </td>
                  </tr>
                  <tr>
                      <td class="auto-style1">Sex :</td>
                      <td class="auto-style2">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="21px" RepeatDirection="Horizontal" Width="243px">
                        <asp:ListItem>M</asp:ListItem>
                        <asp:ListItem>F</asp:ListItem>
                        <asp:ListItem>O</asp:ListItem>
                    </asp:RadioButtonList>
                      </td>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="RadioButtonList1" ErrorMessage="Required*"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                      <td class="auto-style1">DOB :</td>
                      <td class="auto-style2">
                          <asp:DropDownList ID="DropDownList4" runat="server" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged">
                          </asp:DropDownList>
                          <asp:DropDownList ID="DropDownList5" runat="server">
                          </asp:DropDownList>
                          <asp:DropDownList ID="DropDownList6" runat="server" OnSelectedIndexChanged="DropDownList6_SelectedIndexChanged">
                          </asp:DropDownList>
                      </td>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DropDownList4" EnableTheming="False" ErrorMessage="Enter day   "></asp:RequiredFieldValidator>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="DropDownList5" ErrorMessage=" month   "></asp:RequiredFieldValidator>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="DropDownList6" ErrorMessage=" year "></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                      <td class="auto-style3">Phone :</td>
                      <td class="auto-style4">
                          <asp:TextBox ID="TextBox8" runat="server" Height="17px" Width="185px" OnTextChanged="TextBox8_TextChanged"></asp:TextBox>
                      </td>
                      <td class="auto-style5">
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox8" ErrorMessage="Not a phn no." ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
                      </td>
                  </tr>
                  <tr>
                      <td class="auto-style1">Country</td>
                      <td class="auto-style2">
                          <asp:TextBox ID="TextBox9" runat="server" Height="17px" Width="185px"></asp:TextBox>
                      </td>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox9" ErrorMessage="Required*"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                      <td class="auto-style1">&nbsp;</td>
                      <td class="auto-style2">
                          <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Submit" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <asp:Button ID="Button3" runat="server" CausesValidation="False" OnClick="Button3_Click" Text="Reset" />
                      </td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td class="auto-style1">&nbsp;</td>
                      <td class="auto-style2">
                          <asp:Label ID="Label4" runat="server"></asp:Label>
                      </td>
                      <td>&nbsp;</td>
                  </tr>
              </table>
        
              
           
            
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
        <p>A social network for all.      Anyone can pitch in with their ideas and enthusiasm and cherish the company of their friends and beloved ones through this platform.&nbsp;  
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
