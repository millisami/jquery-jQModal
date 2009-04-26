jQuery.ajaxSetup({
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
});

jQuery.fn.submitWithAjax = function() {
    this.submit(function() {
        $.post($(this).attr("action"), $(this).serialize(), null, "script");
        return false;
    })
};

//Setup AJAX event handlers
var parent_div_of_item; // init var to reference blog post container, used for ajax
// re-inserting edited posts
$(".post_div .edit").livequery('click',function(){
		parent_div_of_item = $(this).parent();
		$.get($(this).attr('href'),function(data){
// displays modal window - note css centering
			$.blockUI({message: $("#modal_window").html(data), css: {width:"400px",
				margin:"-200px 0 0 -200px", left:"50%", padding: "4px 4px 4px 15px", textAlign: "left"}});
		});
		return false;
	});
// cancel/closing modal is very simple
	$("#modal_window .close").livequery('click',function(){
		$.unblockUI();
	});

    //Handling ajax form submission
    var parent_div_of_form;
	$('#post_edit_form').livequery('submit',function(){
		parent_div_of_form = $(this).parent();
		$.post($(this).attr("action"), $(this).serialize(), null, "script");
		return false;
	});
    
    //json error messages parsing and displaying
function error_messages(response_text){
    
    var json = eval(response_text);
    var error_text = "";
    var len = json.length;
    for (var x = 0; x <len; x++)
    {
        error_text += "<li>" + json[x][0] + ": " + json[x][1] +"</li>";
    }
    if (len> 0){
        error_text = "<ul>" + error_text + "</ul>";
    }
    return error_text;
}