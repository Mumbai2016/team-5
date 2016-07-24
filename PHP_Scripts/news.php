<?php
	
	require('con.php');
	$sql  = "SELECT n.newsfeed_id, n.topic, m.fname, n.created_at FROM katalyst.newsfeed n INNER JOIN katalyst.mentor m ON n.mentor_id = m.mentor_id ORDER BY n.newsfeed_id DESC LIMIT 20;";
	$result = $conn->query($sql);
	if($result == TRUE){
		if ($result->num_rows > 0) {
    		while($row = $result->fetch_assoc()) {
        		echo "<a href='viewcomments.php?post_id=".$row["newsfeed_id"]."&topic=" . $row["topic"] . "'</a>".$row["topic"]."<br>posted by  - ". $row["fname"] ." - at date time : " . $row["created_at"]; 
        		echo '<br>';
        		echo '<br>';

    		}
		} else {
  
    	}
	}
	else
		die(mysql_error());
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
<div class="row">
<div class="col-sm-4 col-sm-offset-4">
<form class="form-inline" action="post.php" method="POST">
  <div class="form-group">
    <label for="exampleInputName2"></label>
    <input type="text" name="post" class="form-control" id="exampleInputName2" placeholder="Topic">
  </div>
  <button type="submit" class="btn btn-default">Submit</button>
</form>
</div>
</div>


<div class="row">
<div class="col-sm-4 col-sm-offset-4">

<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">Panel title</h3>
  </div>
  <div class="panel-body">
    Panel content
  </div>
</div>
</div>
</div>


</div>


<script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
</body>
</html>
