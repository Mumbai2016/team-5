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
//$meet_date= $_SERVER['REQUEST_TIME'];
//$meet_time= $_SERVER['REQUEST_TIME'];

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

?>

<html>
<body>

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

</body>
</html>