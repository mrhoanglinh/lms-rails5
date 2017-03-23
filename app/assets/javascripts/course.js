var ready = function() {
	$(".btn-enrollment").click(function() {
		alert('btn clicked')
		console.log(this.getAttribute("data-id"))

		var courseId = this.getAttribute("data-id");

		$.ajax({
			url: 'courses/' + courseId + '/enroll',
			dataType: 'script', // or script
			method: 'post', // or put , delete , get
			data: { course_id: courseId},
			success: function(data) {
				console.log('successfull');
				console.log(data)
				//alert("Thank you for your enrollment! Plz wait")
			},
			error: function(error) {
				console.log(error.responseText)
				//alert(error.responseText)
			}
		})
	})
};

$(document).on("turbolinks:load", ready);