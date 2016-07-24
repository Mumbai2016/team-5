<html>
<body>
<?php
include ('dbconn.php');
session_start();
$sql = "SELECT  accept from mentee_notification_accept where mentor_id = 1";
$result = $connection->query($sql);
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo  $row["accept"];
        $_SESSION["accept"] = $row["accept"];
        echo '
          <form action="mentor_acc.php">
          <input type="submit" value="Yes" name="selected" id="yes" />
          <input type="submit" value="No" id="no" name="selected"/>
          </form>
        ';
    }
} else {
    echo "0 results";
}
$connection->close();

 ?>
