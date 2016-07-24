<html>
<body>
<?php
include ('dbconn.php');
session_start();
$sql = "SELECT  accept,id_row from mentee_notification_accept where mentor_id = 1 and accept  = 0";
$result = $connection->query($sql);
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $_SESSION["accept"] = $row["accept"];
        echo '
          <form action="mentor_acc.php">
          <input type="hidden" value="'.$row['id_row'].'" id="hide" />
          <input type="submit" value="Yes-'.$row['id_row'].'" name="selected" id="yes" />
          <input type="submit" value="No-'.$row['id_row'].'" id="no" name="selected"/>
          </form>
        ';
    }
} else {
    echo "0 results";
}
$connection->close();

 ?>
