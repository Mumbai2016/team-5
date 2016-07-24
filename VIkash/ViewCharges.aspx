<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewCharges.aspx.cs" Inherits="ViewCharges" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
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
<link href="css/pages/dashboard.css" rel="stylesheet">

</head>
<body>
 <form id="form1" runat="server" class="form-horizontal">


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
	      				<h3>Weight for Courier</h3>
	  				</div> <!-- /widget-header -->
					
					<div class="widget-content">
						
<!-- search control -->
                                        <fieldset>
                                          <div class="control-group">
                                               <div class="controls">
                                                                <div class="input-append">
                                                                    Enter PinCode No : 
                                                                    <asp:TextBox ID="txtsearch" runat="server" class="span3 m-wrap"></asp:TextBox>

                                                                    
                                                   <asp:Button ID="btnsearch" runat="server" Text="Search" class="btn" 
                                                       onclick="btnsearch_Click"/>
                                                   &nbsp;&nbsp;&nbsp;&nbsp;
                                                
                                                <asp:Button ID="btnadd" runat="server" Text="Create" class="btn" 
                                                    onclick="btnadd_Click"/>
                                             
                                           
                                                                </div>
                                                          </div>
                                            								
											
											
                                              
										</div> <!-- /control-group -->
                                        
                                        </fieldset>

                    </div>
                    </div>
                                         </div> <!-- /span8 -->
	      	
	      </div> <!-- /row -->
        <asp:GridView ID="gvcust" runat="server" 
                CssClass="table table-striped table-bordered" AutoGenerateColumns="False" AllowPaging="true"
    OnPageIndexChanging="OnPageIndexChanging" PageSize="10">
                <Columns>
                    <asp:BoundField DataField="pincode" HeaderText="Pincode" />
                    <asp:BoundField DataField="tax_name" HeaderText="Tax" />
                    <asp:BoundField DataField="tax_rate" HeaderText="Rate" />
                    
                    <asp:TemplateField HeaderText="View">
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" Text="View/Update Charges" 
                                class="btn btn-small btn-success" CommandArgument='<%# Eval("rowid") %>' onclick="Button1_Click" 
                                />
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                </Columns>
                
            </asp:GridView>
                
        
        </div> <!-- /container -->
	    
	</div> <!-- /main-inner -->
    
</div> <!-- /main -->

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
