<html>
<head>
</head>
<body>
  <form action="appoint.php">
         <input  type="date" id="example1" name="text">
         <input type="time" id="time1" name="timeset"   min="10:00:00" max="18:00:00">
         <input type="submit" value="Submit" />
   </form>
<?php
include ('dbconn.php');
session_start();
$sql = "SELECT mentor_id from mentor where mentor_id=1";
$result = $connection->query($sql);

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "id: " . $row["mentor_id"];
        $_SESSION["mentor_id"] = $row["mentor_id"];
    }
} else {
    echo "0 results";
}
$connection->close();
?>
<!--<script src="js/bootstrap-datepicker.js"></script>
<script type="text/javascript">
    function pageLoad() {
        $(document).ready(function () {

            $('#example1').datepicker({
                format: "dd-mm-yyyy"
            });

            $('#example2').datepicker({
                format: "dd-mm-yyyy"
            });

        });
    }
</script>-->
</body>
