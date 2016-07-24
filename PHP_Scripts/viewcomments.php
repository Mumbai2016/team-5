<?php

$id = $_GET['post_id'];
	require('con.php');
	$sql = "SELECT u.username, f.feed_id, f.created_by, f.created_at, f.comment FROM katalyst.user_detail u INNER JOIN katalyst.feed_details f ON f.feed_id =".$id;
	// echo  $sql;
	$result = $conn->query($sql);
	if($result == TRUE){
		echo '<h2>'. $_GET["topic"].'</h1>	';
		while($row = $result->fetch_assoc()) {
			// echo $row['feed_id'];
    		echo "Comment - ".$row["comment"]."<br>posted by - ".$row["username"]." <br>- at date time : ".$row["created_at"];
    		echo '<br>';
    		echo '<br>';
		} 
	}else {
		echo "error"; 
    }
    session_start();
 	$_SESSION['feed_id']=$id;
	echo "<form action='comment.php' method='POST'><input type='text' name='text'/><input type='submit' value='Comment'/></form>";
?>