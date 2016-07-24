<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Admin_Dashboard" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Dashboard</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
        rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/pages/dashboard.css" rel="stylesheet">
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="//www.google.com/jsapi"></script>
    <script type="text/javascript">
        google.load('visualization', '1', { packages: ['corechart'] });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json',
                url: 'Dashboard.aspx/GetData3',
                data: '{}',
                success:
                    function (response) {
                        drawVisualization(response.d);
                    }
            });
        })

        function drawVisualization(dataValues) {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Column Name');
            data.addColumn('number', 'Column Value');
            for (var i = 0; i < dataValues.length; i++) {
                data.addRow([dataValues[i].ColumnName, dataValues[i].Value]);
            }
            new google.visualization.LineChart(document.getElementById('visualization1')).
                draw(data, { title: "Monthly Meetings" });
        }        
    </script>
    

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
            <li><a href="ViewMentee.aspx">Excel Add</a></li>
          </ul>
        </li>

          <li><a href="Viewpairs.aspx"><i class="icon-dashboard"></i><span>Create Pairs</span> </a> </li>
           <li><a href="Showmeet.aspx"><i class="icon-dashboard"></i><span>View Meetings</span> </a> </li>
        
  <li class="dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i><span>Report</span> <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="Viewmeeting.aspx">Meeting</a></li>
            
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
        <div class="span6">
          <div class="widget widget-nopad">
            <div class="widget-header"> <i class="icon-list-alt"></i>
              <h3> Today's Stats</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <div class="widget big-stats-container">
                <div class="widget-content">
                  <h6 class="bigstats"></h6>
                  <div id="big_stats" class="cf">
                    <div class="stat"> <i class="">Admin</i> <span class="value"  id="admin" runat="server">0</span> </div>
                    <!-- .stat -->
                    <div class="stat"> <i class="">Mentor</i> <span class="value" id="mentor" runat="server">0</span> </div>

                    <div class="stat"> <i class="">Mentee</i> <span class="value"  id="mentee" runat="server">0</span> </div>
                    <!-- .stat -->
                    <%--<div class="stat"> <i class="icon-arrow-up"></i> <span class="value" id="trans" runat="server">0</span> </div>--%>
                    <!-- .stat -->
                    
                    <%--<div class="stat"> <i class="icon-bullhorn"></i> <span class="value" id="advice" runat="server">25%</span> </div>--%>
                    <!-- .stat --> 
                  </div>
                </div>
                <!-- /widget-content --> 
                
              </div>
            </div>
          </div>
          
          <div class="widget">
            <div class="widget-header"> <i class="icon-signal"></i>
              <h3>Monthly Meeting Details</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
            <div id="visualization1" height="250" width="538"></div>
              
              <!-- /area-chart --> 
            </div>
            <!-- /widget-content --> 
          </div>

          
          <!-- /widget --> 

          

        </div>
          <div class="span6">
          <div class="widget">
            <div class="widget-header"> <i class="icon-bookmark"></i>
              <h3>Create Class Structure</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <div class="shortcuts"> 
                                <a href="ViewAdmin.aspx" class="shortcut">
                                <i><img src="images/insurance.png"/></i><span class="shortcut-label">Admin</span> </a>
                                
                                <a href="ViewMentor.aspx" class="shortcut">
                                <i class="shortcut-icon icon-signal"></i> <span class="shortcut-label">Mentor</span> </a>
                                <a href="ViewMentee.aspx" class="shortcut">
                                <i><img src="images/fixed.png"/></i><span class="shortcut-label">Mentee</span> </a>
                                <a href="Viewpairs.aspx" class="shortcut">
                                <i><img src="images/mediclaim.png"/></i><span class="shortcut-label">Pairs</span> </a>
                                
                                <a href="view_classroom.aspx" class="shortcut">
                                <i><img src="images/current.png"/></i><span class="shortcut-label">View meeting</span> </a>
                                <a href="view_designation.aspx" class="shortcut">
                                <i><img src="images/fund.png"/></i><span class="shortcut-label">Meeting Report</span> </a>
                                <a href="view_semester.aspx" class="shortcut">
                                <i ><img src="images/expert.png"/></i> <span class="shortcut-label">Feeedback report</span> </a>
                                <a href="choice.aspx" class="shortcut">
                                <i class="shortcut-icon icon-edit"></i><span class="shortcut-label">Login Session</span> </a> 
               </div>
              <!-- /shortcuts --> 
            </div>
            <!-- /widget-content --> 
          </div>
          <!-- /widget -->
          
          
      

        
        <!-- /span6 --> 
      </div>
        <!-- /span6 -->
        <div class="span6">
            <div class="widget">
            <div class="widget-header"> <i class="icon-signal"></i>
              <h3>Mentor's performance Details</h3>
            </div>
            <!-- /widget-header -->
               
            <div class="widget-content">
                 <asp:DropDownList ID="ddlmentor" runat="server" DataTextField="name" DataValueField="mentor_id" AutoPostBack="True" OnSelectedIndexChanged="ddlmentor_SelectedIndexChanged"></asp:DropDownList>
            <asp:Literal ID="lt" runat="server"></asp:Literal>
             <div id="chart_div" height="450" width="538"></div>
              
            </div>
            <!-- /widget-content --> 
          </div>
       


          
        
        </div>
        <!-- /span6 --> 
      </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /main-inner --> 
</div>
<div class="footer">
  <div class="footer-inner">
    <div class="container">
      <div class="row">
        <div class="span12"> &copy; 2015 SUDARSHAN</a>. </div>
        <!-- /span12 --> 
      </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /footer-inner --> 
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
