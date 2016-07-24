<?php
	if(isset($_GET['field1']))
	{
		require('_con.php');
		//enter into database
		extract($_GET);
		// $field1 = $_GET['field1'];
		// echo "hi1";
		$date = date();
		// $id = $_SESSION['mentee_id'];

		$count = substr_count($_SERVER['REQUEST_URI'], '=');

		$id = 1; 
		while($count>0){
			$str = 'field'.($count);
			$str = $_GET[$str];
			$sql = "INSERT INTO `katalyst`.`goals` (`goals_id`, `goal`, `mentee_id`, `status`, `mentor_id`, `created_by`, `edited_by`, `created_at`, `updated_at`) VALUES (NULL, '$str', '$id', '1', '1', '1','1',CURRENT_TIMESTAMP, '$date');";

		if ($conn->query($sql) == TRUE) {
		    // echo "New record created successfully";
		    header('Location:mentee.php');
		} else {
		    echo "Error: " . $sql . "<br>" . $conn->error;
		}
		$count=$count-1;
		// echo $str;
		}
	}

?>