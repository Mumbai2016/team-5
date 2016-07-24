<?php
include ('dbconn.php');
session_start();
$selected = $_GET["selected"];
$option= $selected;
$pos = stripos($option,"-");
$value = substr($option,0,$pos);
$row_num = substr($option,$pos+1);
echo $row_num ." ".$value;
if($value == "Yes")
{
$sql = "update mentee_notification_accept set accept = 1 where id_row = ".$row_num;
if($result = $connection->query($sql))
{
        echo 'done';
      }
} else {
    echo "No";
}
$connection->close();
 ?>
