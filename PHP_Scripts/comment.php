<?php
// print_r($_GET);
require('con.php');

session_start();
$id = $_SESSION['feed_id'];
// echo $id;
$comment = $_POST['text'];
$sql= "INSERT INTO `katalyst`.`feed_details` (`feed_details_id`, `feed_id`, `comment`, `commented_by`, `created_at`, `edited_at`, `created_by`, `edited_by`) VALUES (NULL, '$id', '$comment', '', CURRENT_TIMESTAMP, '0000-00-00 00:00:00', '', '');";

	if ($conn->query($sql) == TRUE) {
		
		    // echo "New record created successfully
		$str = "Location:viewcomments.php?post_id=".$id;
		// print_r($_GET);
		header($str);
		} else {
		    echo "Error: " . $sql . "<br>" . $conn->error;
		}
?>
