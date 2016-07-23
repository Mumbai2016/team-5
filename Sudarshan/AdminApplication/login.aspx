<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600' rel='stylesheet' type='text/css'>
<link href="css/loginstyle.css" rel="stylesheet" type="text/css" media="all" />
 <link href="../css/style.css" rel="stylesheet" type="text/css" media="all" />
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>
<body>
    <form id="form1" runat="server">
    
  
    <div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container"> <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
                    class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span> </a><a class="brand" href="index.aspx" target="_blank">Katalyst</a>
      
      
    </div>
    </div>
    </div>

		<div class="member-login" style="float:left;text-align:center;margin-left:60%;">
			<!----------star form----------->
				
	
					<div class="formtitle">Admin Login</div>
					<div class="input">
						<input type="text" placeholder="User Name" id="ulogin" runat="server"/> 
						
					</div>
					<div class="input">
						<input type="password"  placeholder="Password" id="plogin" runat="server"/>
						
					</div>
					<div class="buttons">
                        <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Forget Password ? </asp:LinkButton>
						<%--<a href="#">Forgot password?</a>--%>
            <asp:Button ID="Button2" runat="server" Text="Login" class="bluebutton" 
                            onclick="Button2_Click"/>
						<%--<input class="bluebutton" type="submit" value="Login" />--%>
                        <div class="clear">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                        </div>
						<div class="clear"> </div>
					</div>
		
				
				<!----------end form----------->
		</div>
		<!----------end member-login----------->
		
    </form>
</body>
</html>
