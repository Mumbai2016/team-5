
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

	<div class="container">


<?php

$id = $_GET['post_id'];
	require('_con.php');
	$sql = "SELECT u.username, f.feed_id, f.created_by, f.created_at, f.comment FROM katalyst.user_detail u INNER JOIN katalyst.feed_details f ON f.feed_id =".$id;
	// echo  $sql;
	$result = $conn->query($sql);
	if($result == TRUE){
		if(isset($_GET['topic']))
		echo '<h2>'. $_GET["topic"].'</h1>	';
		while($row = $result->fetch_assoc()) {
			// echo $row['feed_id'];
    		//echo "Comment - ".$row["comment"]."<br>posted by - ".$row["username"]." <br>- at date time : ".$row["created_at"];
    		?>
			<div class="row">
				<div class="col-sm-4 col-sm-offset-4">
				<div class="panel panel-default">
				<div class="panel-body">
					Comment: <?=$row['comment'];?><br>
					Posted by: <?=$row['username'];?><br>
					On: <?=$row['created_at'];?><br>
					
						</div>
					</div>
				</div>
				</div>
			<?php
			echo '<br>';
    		echo '<br>';
		} 
	}else {
		echo "error"; 
    }
    session_start();
 	$_SESSION['feed_id']=$id;
	//echo "<form action='comment.php' method='POST'><input type='text' name='text'/><input type='submit' value='Comment'/></form>";		
	?>
	<div class="row">
		<div class="col-sm-4 col-sm-offset-4">
		<form class="navbar-form navbar-left" role="search" action='comment.php' method='POST'>
			  <div class="form-group">
				<input type="text" name="text" class="form-control" placeholder="Comment">
			  </div>
			  <button type="submit" class="btn btn-default">Submit</button>
		</form>
		</div>
	</div>

</div>


<script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
</body>
</html>