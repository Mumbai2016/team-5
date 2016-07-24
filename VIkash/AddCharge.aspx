<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddCharge.aspx.cs" Inherits="AddCharge" %>

<!DOCTYPE html>
<html>
    <head id="Head1" runat="server">
    <title>LogiKart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
        rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="css/datepicker.css" />

</head>
<body>
<form id="form1" runat="server">
 
<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container"> <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
                    class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span> </a><a class="brand" href="#" target="_blank">LogiKart </a>
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
        <li><a href="ViewZone.aspx"><i class="icon-dashboard"></i><span>Map Zone</span> </a> </li>
        <li class="dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-gift"></i><span>Freight Calculator</span> <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="ViewFreightCalc.aspx">Client</a></li><li><a href="ViewWeight.aspx">Add Weight</a></li>
            <li><a href="ViewPartner.aspx">Logikart</a></li><li><a href="ViewCharges.aspx">Upload Charges</a></li>
          </ul>
        </li>
       
         <li class="dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i><span>Payment</span> <b class="caret"></b></a>

          <ul class="dropdown-menu">
            <li><a href="viewpayment.aspx">View Invoices</a></li>
            <li><a href="Addpayment.aspx">Add Payment</a></li>
          </ul>

        </li>


        

      
  <li class="dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i><span>Report</span> <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="calculateac.aspx">Calculate</a></li>
            
            <li><a href="ViewInvoice.aspx">Get Invoice</a></li>
            
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
	      				<h3>Add New Zone</h3>
	  				</div> <!-- /widget-header -->
					
					<div class="widget-content">
									<fieldset>
										<p id="erro" runat="server" class="error-details alert"></p>
										
                                        <table class="table">
                                            <tr>
                                                <td colspan="2">
                                                    <div class="control-group">											
											<label class="control-label" for="firstname">Enter Tax Name</label>
											<div class="controls">
                                            
                                                <asp:TextBox ID="txttaxname" runat="server" class="span3"></asp:TextBox>
											</div> <!-- /controls -->				
										</div>
                                                </td>
                                            </tr>
                                            <tr><td>
										<div class="control-group">											
											<label class="control-label" for="firstname">Enter Tax Code</label>
											<div class="controls">
                                            
                                                <asp:TextBox ID="txttaxcode" runat="server" class="span3" style="text-transform:uppercase;"></asp:TextBox>
											</div> <!-- /controls -->				
										</div>
										</td><td>
                                        <div class="control-group">											
											<label class="control-label" for="firstname">PinCode</label><div class="controls">
                                            
                                                <asp:TextBox ID="txtpincode" runat="server" class="span3" style="text-transform:uppercase;"></asp:TextBox>
											</div> <!-- /controls -->				
										</div>
                                         </td> </tr>  

                                            
                                            <tr><td>
										<div class="control-group">											
											<label class="control-label" for="firstname">Select Type</label>
											<div class="controls">
                                            
                                                <asp:DropDownList ID="ddltype" runat="server">
                                                    <asp:ListItem>Select Type</asp:ListItem>
                                                    <asp:ListItem Value="0">Percent</asp:ListItem>
                                                    <asp:ListItem Value="1">Amount</asp:ListItem>
                                                </asp:DropDownList>
                                                											</div> <!-- /controls -->				
										</div>
										</td><td>
                                        <div class="control-group">											
											<label class="control-label" for="firstname">Tax Rate</label><div class="controls">
                                            
                                                <asp:TextBox ID="txtrate" runat="server" class="span3"></asp:TextBox>
											</div> <!-- /controls -->				
										</div>
                                         </td> </tr>

                                        </table>
                                         

                                       

                                        <div>
                                            
                                        </div>
                                        
                                       	
										<div class="form-actions">
											
                                            <asp:Button ID="Button1" runat="server" Text="Add Tax Charge" class="btn btn-primary" 
                                                onclick="Button1_Click"/>
                                            
											
										</div> <!-- /form-actions -->
									</fieldset>
						
					</div> <!-- /widget-content -->
						
				</div> <!-- /widget -->
	      		
		    </div> <!-- /span8 -->
	      	
	      	<!--Excel Upload -->

                  <div class="span12">      		
	      		
	      		<div class="widget ">
	      			
	      			<div class="widget-header">
	      				<i class="icon-user"></i>
	      				<h3>Upload Through Excel</h3>
	  				</div> <!-- /widget-header -->
					
					<div class="widget-content">
									<fieldset>
										<p id="P1" runat="server" class="error-details alert"></p>
										
										<div class="control-group">											
											<label class="control-label" for="firstname">Upload File</label>
											<div class="controls">
                                            
                                                <asp:FileUpload ID="flexcel" runat="server" />
											</div> <!-- /controls -->	
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Files/tax.xlsx">Download Format</asp:HyperLink>			
										</div>
										

                                       

										<div class="form-actions">
											
                                            <asp:Button ID="btnupload" runat="server" Text="Upload Weight" class="btn btn-primary" 
                                                onclick="btnupload_Click"/>
                                            
											
										</div> <!-- /form-actions -->
									</fieldset>
						
					</div> <!-- /widget-content -->
						
				</div> <!-- /widget -->
	      		
		    </div>
        <!-- Excell upload end ->
	      	
	      	
	      </div> <!-- /row -->
	
	    </div> <!-- /container -->
	    
	</div> <!-- /main-inner -->
    
</div>



    </form>
</body>


    <!-- javascript for runtime -->
    <script src="js/jquery-1.7.2.min.js"></script> 
<script src="js/excanvas.min.js"></script> 
<script src="js/chart.min.js" type="text/javascript"></script> 
<script src="js/bootstrap.js"></script>
<script language="javascript" type="text/javascript" src="js/full-calendar/fullcalendar.min.js"></script>
 
<script src="js/base.js"></script> 
        <script src="js/bootstrap-datepicker.js"></script>
        <script type="text/javascript">
            // When the document is ready
            function pageLoad() {
                $(document).ready(function () {

                    $('#example1').datepicker({
                        format: "dd-mm-yyyy"
                    });

                    $('#example2').datepicker({
                        format: "dd-mm-yyyy"
                    });

                });
            }
        </script>
</html>