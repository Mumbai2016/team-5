<?php
$date = $_GET["text"];
include('dbconn.php');
session_start();
$mentor_id = $_SESSION["mentor_id"];
$sql = "INSERT INTO mentee_notification_accept (mentor_id, mentee_id, meet_date,meet_place) VALUES ($mentor_id,1, $date,'lowerparel')";

if (mysqli_query($connection, $sql)) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($connection);
}

?>
