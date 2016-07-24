<?php
	// print_r($_POST['post']);
include ('_con.php');
$id = $_SESSION['mentor_id'];
$post = $_POST['post'];
$sql = "INSERT INTO `katalyst`.`newsfeed` (`newsfeed_id`, `topic`, `mentor_id`, `created_by`, `edited_by`, `created_at`, `edited_at`) VALUES (NULL, '$post','$id', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);";

		if ($conn->query($sql) == TRUE) {
		    // echo "New record created successfully";
		    header('Location:news.php');
		} else {
		    echo "Error: " . $sql . "<br>" . $conn->error;
		}
?>
