

<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Scrum</title>
    <!-- BOOTSTRAP CORE STYLE CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME CSS -->
    <link href="assets/css/font-awesome.min.css" rel="stylesheet" />
     <!-- FLEXSLIDER CSS -->
    <link href="assets/css/flexslider.css" rel="stylesheet" />
    <!-- CUSTOM STYLE CSS -->
    <link href="assets/css/style.css" rel="stylesheet" />    
  <!-- Google Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,700,300" rel="stylesheet" type="text/css" />
</head>
<body >
<script type="text/javascript">

function AddSubTask() {
    $("#formsubtasks").append('<br><div style="height:auto;" ><input type="text" style="border-radius:5px;height:30px; width:200px; color:black" placeholder="SubTask name" name="subtasks[]" size="10" id="add"/><select name="subtasksselect[]" style="border-radius:5px;height:30px;background-color:#F0F0F0 "; ><option value="select">State</option><option value="Icebox">Icebox</option><option value="Emergency">Emergency</option><option value="In_Progress">In Progress</option><option value="Testing">Testing</option><option value="complete">Complete</option></select><br><input type="text" style="border-radius:5px;height:100px; width:300px; color:black" placeholder="Add a description of the SubTask here" name="subdescription[]" size="10" id="add"/><a class="btn btn-default" class="js-open-modal"  onclick="$(this).prev().remove();$(this).prev().remove();$(this).remove();" id="remove_task">Remove</a></div>');
}
</script>
</body>
</html>
<?php
 	// set goals
	// feedback form
	// rate
	echo ('<div>
	<form method="POST" action="" id="">
	<a  href="#" class="btn btn-default" class="js-open-modal" onclick="AddSubTask()">Add SubTasks</a>
	<input type="submit" class="btn btn-default" class="js-open-modals" name="submitsubtasks" onclick=AddSubTask()/></form>
	</div>
    <!--  Jquery Core Script -->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!--  Core Bootstrap Script -->
    <script src="assets/js/bootstrap.js"></script>
    <!--  Flexslider Scripts --> 
         <script src="assets/js/jquery.flexslider.js"></script>
     <!--  Scrolling Reveal Script -->
    <script src="assets/js/scrollReveal.js"></script>
    <!--  Scroll Scripts --> 
    <script src="assets/js/jquery.easing.min.js"></script>
    <!--  Custom Scripts --> 
         <script src="assets/js/custom.js"></script>');

?>
