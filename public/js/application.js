$(document).ready(function(){
	$.modal($('#modal1'), 
		{ overlayClose: true }
	);

	$(document).on('click', '.close',function(){
		$(this).parent('#modal1').hide();
		$(this).parent('#modal2').hide();
	});

	$('.inst_next_btn').click(function(){
		$('#modal1').hide();
		$('#modal2').show();
	});

	$(".form-inline").submit(function(e) {
	    // $('.score downvoted').show()
	    // $('.score unvoted').hide()
	    $.ajax({
	           method: "POST",
	           url: '/urls',
	           data: $(".form-inline").serialize(), // serializes the form's elements.
	           success: function(data)
	           {

	           	$('#url_table tr:first').after(data)

	           }
	    });
	    
    	e.preventDefault(); // avoid to execute the actual submit of the form.
	});

    $('.counter').counterUp({
        delay: 50,
        time: 5000
    });
});



