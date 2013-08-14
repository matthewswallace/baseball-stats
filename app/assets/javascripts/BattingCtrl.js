
$(document).ready(function()
{
	$.ajax(
		{
			url:"/most_improved",
			success:function(data){alert(data);}
		}
	);
});
