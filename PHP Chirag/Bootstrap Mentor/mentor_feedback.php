<?php
require "conn.php";
if(isset($_GET['feedback'])&&isset($_GET['rate'])&&isset($_GET['meet_date'])&&isset($_GET['minutes'])&&isset($_GET['interact'])&&isset($_GET['fruitful'])&&isset($_GET['interest'])&&isset($_GET['comfort']))
{

$meet_date=$_GET['meet_date'];
//echo "$date";

$_SESSION['mentor_id']=1;


$minutes= $_GET['minutes'];
$interact= $_GET['interact'];
$fruitful= $_GET['fruitful'];
$interest= $_GET['interest'];
$comfort= $_GET['comfort'];


$mentor_id=$_SESSION['mentor_id'];
$query="SELECT * from assign_mentor_mentee where mentor_id='$mentor_id'";
$run_query= mysqli_query($con,$query);

$row=mysqli_fetch_assoc($run_query);
$mentee_id=$row['mentee_id'];

//echo  $mentee_id."  ";
$meet_date= $_GET['meet_date'];
$meet_time= $_SERVER['REQUEST_TIME'];

//echo $meet_date." ".$meet_time;
//$query2="INSERT INTO `meeting`(`mentor_id`, `mentee_id`, `meet_time`, `status`, `meet_date`, `created_by`, `edited_by`, `created_at`, `edited_at`) VALUES ('$mentor_id','$mentee_id',now(),1,now(),'chirag','chirag',now(),now())";
//$run_query2= mysqli_query($con,$query2);

$query3="select * from `meeting` where `mentor_id`='$mentor_id' and `mentee_id`='$mentee_id' and meet_date='$meet_date'";
$run_query3=mysqli_query($con,$query3);
while($row2=mysqli_fetch_assoc($run_query3))
{
    $meeting_id=$row2['meeting_id'];
}
//echo "$meeting_id ";
//echo "$mentor_id ";
//echo "$mentee_id ";

$feedback=$_GET['feedback'];
$rate=$_GET['rate'];
if(isset($meeting_id))
{
//$query4="INSERT INTO `mentor_feedback`(`meeting_id`, `feedback`, `created_by`, `edited_by`, `created_at`, `updated_at`, `rate`, `minutes`, `interact`, `fruitful`, `interest`, `comfort`) VALUES ($meeting_id,$feedback,'$mentor_id','$mentee_id',now(),now(),'$rate','$minutes','$interact','$fruitful','$interest','$comfort')";
$query4="INSERT INTO `mentor_feedback`( `meeting_id`, `feedback`, `created_by`, `edited_by`, `created_at`, `updated_at`, `rate`, `minutes`, `interact`, `fruitful`, `interest`, `comfort`) VALUES ('$meeting_id','$feedback','$mentor_id','$mentor_id',now(),now(),'$rate','$minutes','$interact','$fruitful','$interest','$comfort')";

if($run_query4=mysqli_query($con,$query4))
echo "Inserted";
}
else
echo "Details incorrect.";
}
else
echo "Details not set";


/*
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="styles.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
</head>
<body>


<div class="container-fluid " >

<!-- Navbar section -->
<nav class="navbar navbar-default ">
  <div class="container-fluid">
    <div class="navbar-header ">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.html">Mentor</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="aboutus.html">About Us</a></li>
        <li><a href="donate.php">Donate</a></li>
        <li><a href="contactus.php">Contact Us</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<!---Navbar section ends-->


    <form action="mentor_feedback.php" action="GET">
        <table>
        <tr>
        <td>
        Date:
        </td>
        <td>
        <input type="date" name="meet_date"></input>
        </td>
        </tr>
        <tr>
        <td>
        Rate the quality of meetings:</td>
         <td>
         <select name="rate">
                <option value=""></option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
              </select><br>
         </td>
         </tr>


        <tr>
        <td>
        Was the mentee able to interact well?:</td>
         <td>
         <select name="interact">
                <option value=""></option>
                <option value="y">Yes</option>
                <option value="n">No</option>
                </select><br>
         </td>
         </tr>
         <tr>
             <td>
             Was the session fruitful?:</td>
              <td>
              <select name="fruitful">
                     <option value=""></option>
                     <option value="y">Yes</option>
                     <option value="n">No</option>
                     </select><br>
              </td>
              </tr>

              <tr>
          <td>
          Did the mentee take active interest?:</td>
           <td>
           <select name="interest">
                  <option value=""></option>
                  <option value="y">Yes</option>
                  <option value="n">No</option>
                  </select><br>
           </td>
           </tr>
           <tr>
                   <td>
                   Was the mentee comfortable to interact:</td>
                    <td>
                    <select name="comfort">
                           <option value=""></option>
                           <option value="y">Yes</option>
                           <option value="n">No</option>
                           </select><br>
                    </td>
                    </tr>


           <tr>
              <td>Additional feedback:</td>
              <td><textarea rows="3" cols="40" name="feedback"></textarea></td>
          </tr>
          <tr>
                <td>Minutes of meeting:</td>
                <td><textarea rows="3" cols="40" name="minutes"></textarea></td>
            </tr>
        </table>
        <input type="submit"></input>
    </form>

</div>


<script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
</body>
</html>
*/