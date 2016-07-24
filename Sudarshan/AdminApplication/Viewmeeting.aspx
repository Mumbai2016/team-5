<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Viewmeeting.aspx.cs" Inherits="Viewmeeting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Create Customer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
        rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/pages/dashboard.css" rel="stylesheet">

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
	      				<h3>Recent Meetings to be Conduct</h3>
	  				</div> <!-- /widget-header -->
                          
                           
					<div class="widget-content">
						
<!-- search control -->
                                        <fieldset>
                                        
                                          <div class="control-group">											
											<label class="control-label" for="radiobtns">Select Criteria to get Meetings</label>
											
                                            <div class="controls">
                                                <table width="100%" class="table">
                                                    <tr>
                                                        <td>Select Month
                                                            <asp:DropDownList ID="ddlmonth" runat="server">
                                                                <asp:ListItem>Select Month</asp:ListItem>
                                                                <asp:ListItem Value="1">januray</asp:ListItem>
                                                                <asp:ListItem Value="2">February</asp:ListItem>
                                                                <asp:ListItem Value="3">march</asp:ListItem>
                                                                <asp:ListItem Value="4">April</asp:ListItem>
                                                                <asp:ListItem Value="5">may</asp:ListItem>
                                                                <asp:ListItem>June</asp:ListItem>
                                                                <asp:ListItem>July</asp:ListItem>
                                                                <asp:ListItem>August</asp:ListItem>
                                                                <asp:ListItem>September</asp:ListItem>
                                                                <asp:ListItem>October</asp:ListItem>
                                                                <asp:ListItem>November</asp:ListItem>
                                                                <asp:ListItem>December</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>Select Year
                                                             <asp:DropDownList ID="ddlyear" runat="server"></asp:DropDownList>
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            
                                                <asp:Button ID="btnsearch" runat="server" Text="Search" class="btn btn-primary" 
                                                       onclick="btnsearch_Click"/>
                                                
                                                        </td>
                                                    </tr>
                                                </table>
                                                  
                                                    
                                                
                                              </div>	<!-- /controls -->
                                              <label class="control-label" for="radiobtns" id="warning" runat="server" style="color:Red;font-style:bold;"></label>
										</div> <!-- /control-group -->
                                        
                                        </fieldset>

                    </div>

                    <asp:GridView ID="gvcust" runat="server" 
                CssClass="table table-striped table-bordered" AutoGenerateColumns="False" EmptyDataText="No meetings found">
                <Columns>
                    <asp:BoundField DataField="name" HeaderText="Mentee Name" />
                    <asp:BoundField DataField="emailid" HeaderText="Mentor name" />
                 <asp:BoundField DataField="mobileno" HeaderText="Date" />
                    <asp:BoundField DataField="organization" HeaderText="Time" />
                    <asp:BoundField DataField="organization" HeaderText="Location" />
                     
                </Columns>
                
            </asp:GridView>
                   
                    </div>
                                         </div> <!-- /span8 -->
	      	
	      </div> <!-- /row -->
            
                 
            
	    </div> <!-- /container -->
	    
	</div> <!-- /main-inner -->
    
</div>



    </form>



    <!-- javascript for runtime -->
    <script src="js/jquery-1.7.2.min.js"></script> 
<script src="js/excanvas.min.js"></script> 
<script src="js/chart.min.js" type="text/javascript"></script> 
<script src="js/bootstrap.js"></script>
<script language="javascript" type="text/javascript" src="js/full-calendar/fullcalendar.min.js"></script>
 
<script src="js/base.js"></script> 
</body>
</html>
