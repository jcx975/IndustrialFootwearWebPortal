
var information = {
	name: "Test Company",
	state: "MN",
	city: "Winona",
	email: "cool@example.com",
	comment: ""
};

$( document ).ready( function()
{
	$( "#company-name-header" ).text( information.name );
	$( "#companyName" ).val( information.name );
	$( "#state" ).val( information.state );
	$( "#city" ).val( information.city );
	$( "#email" ).val( information.email );
	$( "#comment" ).text( information.comment );

	$( "#currentCompanyName" ).text( "Name: " + information.name );
	$( "#currentState" ).text( "State: " + information.state );
	$( "#currentCity" ).text( "City: " + information.city );
	$( "#currentEmail" ).html( "Email: <a href='mailto: " + information.email + "'>" + information.email );
} );