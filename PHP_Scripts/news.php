<?php
	echo "<form method='POST' action='post.php'><input type='text' name = 'post'><input type='submit'/></form><br><table>";
	require('con.php');
	$sql  = "SELECT n.newsfeed_id, n.topic, m.fname, n.created_at FROM katalyst.newsfeed n INNER JOIN katalyst.mentor m ON n.mentor_id = m.mentor_id ORDER BY n.newsfeed_id DESC LIMIT 20 ";
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
