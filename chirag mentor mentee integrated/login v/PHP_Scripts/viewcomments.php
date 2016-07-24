<?php

$id = $_GET['post_id'];
// echo $id;

	require('con.php');
	$sql = "SELECT u.username, f.created_by, f.created_at, f.feed_details, f.comment FROM katalyst.user_detail u INNER JOIN katalyst.feed_details f ON f.feed_details_id =".$id;
	$result = $conn->query($sql);
	if($result == TRUE){
		if ($result->num_rows > 0) {
    		while($row = $result->fetch_assoc()) {
        		echo "Comment ".$row["comment"]."posted by - ".$row["username"]." - at date time : ".$row["created_at"];
        		echo '<br>';
        		echo '<br>';
    		}
		} else {
			echo "error";
  
    	}
	}
	else echo "error";
	echo "<a href='comment.php?id=""'><input type='submit' value='Comment'/></form>";

	
?>