
<html>

<script src="jquery-1.12.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style type="text/css">
* {
  .border-radius(0) !important;
}

#field {
    margin-bottom:20px;
}
</style>

<script type="text/javascript">
	$(document).ready(function(){
    var next = 1;
    $(".add-more").click(function(e){
        e.preventDefault();
        var addto = "#field" + next;
        var addRemove = "#field" + (next);
        next = next + 1;
        var newIn = '<input autocomplete="off" class="input form-control" id="field' + next + '" name="field' + next + '" type="text">';
        var newInput = $(newIn);
        var removeBtn = '<button id="remove' + (next - 1) + '" class="btn btn-danger remove-me" >-</button></div><div id="field">';
        var removeButton = $(removeBtn);
        $(addto).after(newInput);
        $(addRemove).after(removeButton);
        $("#field" + next).attr('data-source',$(addto).attr('data-source'));
        $("#count").val(next);  
        
            $('.remove-me').click(function(e){
                e.preventDefault();
                var fieldNum = this.id.charAt(this.id.length-1);
                var fieldID = "#field" + fieldNum;
                $(this).remove();
                $(fieldID).remove();
            });
    });    
});

</script>

	<div class="container">
		<div class="row">
			<input type="hidden" name="count" value="1" />
	        <div class="control-group" id="fields">
	            <label class="control-label" for="field1">Mentee Form</label>
	            <div class="controls" id="profs"> 
	                <form class="input-append" action="menteesubmit.php" method="GET">
	                    <div id="field"><input autocomplete="off" class="input" id="field1" name="field1" type="text" placeholder="Type your goal here" data-items="8"/><button id="b1" class="btn add-more" type="button">Add Goals</button></div>
                        <input type="submit"/>
	                </form>
	            <br>
	            </div>
	        </div>
		</div>
	</div>