
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


<form action="appoint.php">
<div class="container" style="padding:150px 0px 0px 0px;">
<div class="row" >
<div class="col-sm-4 col-sm-offset-4">
<div class="panel panel-default">
 <div class="panel-heading">
    <h3 class="panel-title">Meet date</h3>
  </div>
  <div class="panel-body">
Date: <input  type="date" class="form-control" id="example1" name="text"><br>
Time: <input type="time" id="time1" class="form-control" name="timeset"   min="10:00:00" max="18:00:00"><br>
  <button type="submit" class="btn btn-default">Submit</button>
</form>
</div>
</div>
</div>
</div>
</div>



</div>


<script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<?php
include ('dbconn.php');
session_start();
$sql = "SELECT mentor_id from mentor where mentor_id = ".$_SESSION['mentor_id'];
$result = $connection->query($sql);

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "id: " . $row["mentor_id"];
    }
} else {
    echo "0 results";
}
$connection->close();
?>

</body>
</html>