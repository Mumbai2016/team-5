<?php
	if(isset($_GET['field1']))
	{
		//enter into database
		$field1 = $_GET['field1'];
		echo "hi1";
		$date = date();
		// $id = $_SESSION['mentee_id'];

		$id = 1; 
		$sql = "INSERT INTO `katalyst`.`goals` (`goals_id`, `goal`, `mentee_id`, `status`, `mentor_id`, `created_by`, `edited_by`, `created_at`, `updated_at`) VALUES (NULL, $id, '$field1', '1', '1', CURRENT_TIMESTAMP, '$date', '1', '1');";
	}
?>