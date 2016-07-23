<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegisterAdmin.aspx.cs" Inherits="RegisterAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container"> <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
                    class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span> </a><a class="brand" href="#" target="_blank">Katalyst </a>
      <div class="nav-collapse">
        <ul class="nav pull-right">
          <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="icon-user"></i> Account <b class="caret"></b></a>
            <ul class="dropdown-menu">
              
              <li><a href="login.aspx">Logout</a></li>
            </ul>
          </li>
        </ul>
       
      </div>
      <!--/.nav-collapse --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /navbar-inner --> 
</div>
<!-- /navbar -->
<div class="subnavbar">
  <div class="subnavbar-inner">
    <div class="container">
      <ul class="mainnav">
        <li><a href="Dashboard.aspx"><i class="icon-dashboard"></i><span>Dashboard</span> </a> </li>
         <li class="dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-gift"></i><span>Admin</span> <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="ViewAdmin.aspx">Add Admin</a></li>
            <li><a href="ViewAdmin.aspx">View Admin</a></li>
            <li><a href="ExcelAdmin.aspx">Excel Add</a></li>
          </ul>
        </li>
        <li class="dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-gift"></i><span>Mentor</span> <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="ViewMentor.aspx">Add Mentor</a></li>
            <li><a href="ViewMentor.aspx">View Mentor</a></li>
            <li><a href="ExcelMentor.aspx">Excel Add</a></li>
          </ul>
        </li>
       
          <li class="dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-gift"></i><span>Mentee</span> <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="ViewMentee.aspx">Add Mentee</a></li>
            <li><a href="ViewMentee.aspx">View Mentee</a></li>
            <li><a href="ExcelMentee.aspx">Excel Add</a></li>
          </ul>
        </li>

          <li><a href="Viewpairs.aspx"><i class="icon-dashboard"></i><span>Create Pairs</span> </a> </li>
           <li><a href="Viewmeeting.aspx"><i class="icon-dashboard"></i><span>View Meetings</span> </a> </li>
        
  <li class="dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i><span>Report</span> <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="meeting.aspx">Meeting</a></li>
            
            <li><a href="feedback.aspx">Feedback</a></li>
            
          </ul>
        </li>

      </ul>
    </div>
    <!-- /container --> 
  </div>
  <!-- /subnavbar-inner --> 
</div>
<div class="main">
	
	<div class="main-inner">

	    <div class="container">
	
	      <div class="row">
	      	
	      	<div class="span12">      		
	      		
	      		<div class="widget ">
	      			
	      			<div class="widget-header">
	      				<i class="icon-user"></i>
	      				<h3>Register Admin</h3>
	  				</div> <!-- /widget-header -->
					
					<div class="widget-content">
					
									<fieldset>
										<p id="erro" runat="server" class="error-details alert"></p>
										
										
                                        <div class="control-group">											
											<label class="control-label" for="firstname">Admin Name</label>
											<div class="controls">
                                            
                                                <asp:TextBox ID="txtname" runat="server" class="span4" style="text-transform:uppercase;"></asp:TextBox>
											</div> <!-- /controls -->				
										</div>
                                        <div class="control-group">											
											<label class="control-label" for="firstname">Email ID</label>
											<div class="controls">
                                            
                                                <asp:TextBox ID="txtemailid" runat="server" class="span5" style="text-transform:uppercase;"></asp:TextBox>
											    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                    ControlToValidate="txtemailid" ErrorMessage="RegularExpressionValidator" 
                                                    ForeColor="Red" SetFocusOnError="True" 
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*Enter Valid Email ID</asp:RegularExpressionValidator>
											</div> <!-- /controls -->				
										</div>
                                        
                                         <div class="control-group">											
											<label class="control-label" for="firstname">Password</label>
											<div class="controls">
                                            
                                                <asp:TextBox ID="txtpasswd" runat="server" class="span3" style="text-transform:uppercase;"></asp:TextBox>
											</div> <!-- /controls -->				
										</div>
                
                                        
                                       
                                        
									
                                       
                                        
                                        <div>
                                            
                                        </div>
                                        
                                       	
										<div class="form-actions">
											
                                            <asp:Button ID="Button1" runat="server" Text="Add Admin" class="btn btn-primary" 
                                                onclick="Button1_Click"/>
                                            
											
										</div> <!-- /form-actions -->
									</fieldset>
								
								
								
								
								
						
						
						
						
					</div> <!-- /widget-content -->
						
				</div> <!-- /widget -->
	      		
		    </div> <!-- /span8 -->
	      	
	      	
	      	
	      	
	      </div> <!-- /row -->
	
	    </div> <!-- /container -->
	    
	</div> <!-- /main-inner -->
    
</div>

    </form>
</body>
</html>
