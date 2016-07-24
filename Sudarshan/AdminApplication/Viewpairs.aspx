<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Viewpairs.aspx.cs" Inherits="Viewpairs" %>

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
           <li><a href="Showmeet.aspx"><i class="icon-dashboard"></i><span>View Meetings</span> </a> </li>
        
  <li class="dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i><span>Report</span> <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="Viewmeeting.aspx">Meeting</a></li>
            
            <li><a href="performance.aspx">performance</a></li>
            
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
	      				<h3>Mentor Details</h3>
	  				</div> <!-- /widget-header -->
                          
                           
					<div class="widget-content">
						
<!-- search control -->
                                        <fieldset>
                                        
                                          <div class="control-group">											
											<label class="control-label" for="radiobtns">Enter initials of Mentor name</label>
											
                                            <div class="controls">
                                               <div class="control-label">
                                                  
                                                   <asp:TextBox ID="txtsearch" runat="server" class="span3"></asp:TextBox>
                                                  
                                                </div>
                                                <asp:Button ID="btnsearch" runat="server" Text="Search" class="btn" 
                                                       onclick="btnsearch_Click"/>
                                                
                                              </div>	<!-- /controls -->
                                              <label class="control-label" for="radiobtns" id="warning" runat="server" style="color:Red;font-style:bold;"></label>
										</div> <!-- /control-group -->
                                        
                                        </fieldset>

                    </div>

                    <asp:GridView ID="gvcust" runat="server" 
                CssClass="table table-striped table-bordered" AutoGenerateColumns="False" EmptyDataText="No Mentor found">
                <Columns>
                    <asp:BoundField DataField="name" HeaderText="Name" />
                    <asp:BoundField DataField="email" HeaderText="Email" />
                 <asp:BoundField DataField="mob" HeaderText="Mobile" />
                   <asp:BoundField DataField="assigned" HeaderText="Assign Mentee" />
                   <asp:TemplateField HeaderText="Assign">
                        <ItemTemplate>
                            <asp:Button ID="Button2" runat="server" Text="Assign" 
                                class="btn btn-small btn-success" CommandArgument='<%# Eval("mentor_id") %>' onclick="Button2_Click" 
                                />
                        </ItemTemplate>
                    </asp:TemplateField>
                     
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


