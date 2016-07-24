<?php include "dbconn.php"; ?>
<?php
if(!empty($_SESSION['LoggedIn']) && !empty($_SESSION['Username']))
{
	 ?>
	 <h1>Member Area</h1>
     <p>Thanks for logging in! You are <b><?=$_SESSION['Username']?></b> and your email address is <b><?=$_SESSION['EmailAddress']?></b>.</p><a href="logout.php">LOGOUT</a>
 z
     <?php
}
elseif(!empty($_POST['username']) && !empty($_POST['password']))
{
		$username = $_POST['username'];
    $password = $_POST['password'];

	$checklogin = ("SELECT * FROM user_detail WHERE username = '".$username."' AND password = '".$password."'");
	$result = $connection->query($checklogin);
    if($result->num_rows == 1)
    {
    	$row =  $result->fetch_assoc();
        $user_id = $row['fkid'];
        $_SESSION['user_id'] = $user_id;
        $_SESSION['LoggedIn'] = 1;
			  $type = $row['type'];
				 $_SESSION['type']= $type ;
				 if($type == "mentor")
				 {
						 echo "<meta http-equiv='refresh' content='2;mentor.php' />";
				 }
				 elseif($type == "mentee") {
					 	 echo "<meta http-equiv='refresh' content='2;mentee.php' />";
				 }



    }
    else
    {
    	echo "<meta http-equiv='refresh' content='2;loginb.php' />";
    }
}
else
{
	?>

	 <div class="navbar navbar-fixed-top">
   <div class="navbar-inner">
     <div class="container"> <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
                     class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span> </a><a class="brand" href="#" target="_blank">Login </a>
       <
       <!--/.nav-collapse -->
     </div>
     <!-- /container -->
   </div>
   <!-- /navbar-inner -->
 </div>
 <!-- /navbar -->
 <div class="main">

	<div class="main-inner">

			<div class="container">

				<div class="row">

					<div class="span12">

						<div class="widget ">

							<div class="widget-header">

	<form method="post" action="login.php" name="loginform" id="loginform">
		<label for="username">Username:</label><input type="text" name="username" id="username" /><br />
		<label for="password">Password:</label><input type="password" name="password" id="password" /><br />
		<input type="submit" name="login" id="login" value="Login" />
	</form>

   <?php
}
?>

</div>
</body>
</html>
