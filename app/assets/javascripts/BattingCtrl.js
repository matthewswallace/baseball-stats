
$(document).ready(function()
{
	var nextCount = 0;

	function getMostImproved()
	{
		$.ajax(
		{
				url:"/most_improved",
				success:function(data)
				{	var ba1 = data.ba1;
					var ba2 = data.ba2;
					var html = "<h1>Most imporved batting average : <span style='color:#ff0000;'>" + data.user.playerId + "</span></h1>" + 
								"<h2>From 2009 - 2010: <span style='color:#eeeeee'>" + ((ba2.AB / ba2.H) - (ba1.AB / ba1.H)) + "</span></h2>";
					$('#main_content').html(html)
					$('#bn_next').show();
					//$('#main_content').slideDown();
					$('#main_content').fadeIn();
				}
			}
		);
	}

	function getSluggingPercentage()
	{
		$.ajax(
		{
				url:"/slugging_percentage",
				success:function(data)
				{	
					var list = "";

					for (var i = data.players.length - 1; i >= 0; i--) {
						var player = data.players[i]
						list += ("<tr><td>" + player.playerID +"</td><td>" + player.slugging + "</td></tr>");
					};
					var html = "<h1>Oakland A's Slugging Average from 2009 - 2010</h1>" +
								"<table>"+
									"<tr><th>Player</th><th>Slugging Av</th></tr>"+
									list+
								"</table>";

					$('#main_content').html(html)
					$('#bn_next').show();
					//$('#main_content').slideDown();
					$('#main_content').fadeIn();
				}
			}
		);
	}

	function getTopFive()
	{
		$.ajax(
		{
				url:"/top_imporved",
				success:function(data)
				{	
					var list = "";

					for (var i = 0; i < 5; i++) 
					{
						var user = data.top_five[i].user;
						var points_imporved = data.top_five[i].points_imporved;

						list += ("<tr><td>" + user.playerId +"</td></tr>");
					}
					var html = "<h1>Top 5 players from 2011 - 2012</h1>" +
								"<table>"+
									"<tr><th>Player</th><th>Imporoved By</th></tr>"+
									list+
								"</table>";
								
					$('#main_content').html(html)
					$('#bn_next').show();
					//$('#main_content').slideDown();
					$('#main_content').fadeIn();
				}
			}
		);
	}

	function tripleCrown()
	{
		$.ajax(
		{
				url:"/trip_crown_winner",
				success:function(data)
				{	
					var list = "";

					
					var html = "<h1>Triple Crown Winner's between 2011 - 2012</h1>" +
								"<h2>" + data.winner + "</h2>";
								
					$('#main_content').html(html)
					$('#bn_next').show();
					//$('#main_content').slideDown();
					$('#main_content').fadeIn();
				}
			}
		);
	}

	function showData(count)
	{
		//$('#main_content').slideUp();
		$('#main_content').fadeOut(0);
		switch(count)
		{
			case 0:
				getMostImproved();
				break;
			case 1:
				getSluggingPercentage();
				break;
			case 2:
				getTopFive();
				break;
			case 3:
				tripleCrown();
				break;
		}
	}

	$('#bn_next').click(function()
	{ 
		$(this).hide();
		nextCount ++;
		if(nextCount > 3)	
			nextCount = 0;

		showData(nextCount);
	});

	//$('#main_content').slideUp(0);
	$('#main_content').fadeOut(0);

	getMostImproved();
});
