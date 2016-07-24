<?php
$ndate = $_GET["text"];
include('dbconn.php');
session_start();
$mentor_id = $_SESSION["mentor_id"];
$meet_time = $_GET["timeset"];
echo $ndate;
$sql = "INSERT INTO mentee_notification_accept (mentor_id, mentee_id, meet_date,meet_time,meet_place) VALUES ($mentor_id,1,'$ndate','$meet_time','lowerparel')";

if (mysqli_query($connection, $sql)) {
    header('Location: loginb.php');
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($connection);
}
?>
