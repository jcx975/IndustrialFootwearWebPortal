
$( document ).ready( function()
{
	$( "#edit-button" ).on( "click", editProfile );
} );

function editProfile()
{
	$( "#edit-button" ).remove();
	$( "#top-buttons" ).append( "<button type='button' id='cancel-button' class='btn btn-danger'>Cancel</button>" );
	$( "#top-buttons" ).append( "<button type='button' id='save-button' class='btn btn-success'>Save Profile</button>" );
	$( "#cancel-button" ).on( "click", function() { window.location.reload( false ) } );
	$( "#save-button" ).on( "click", function() { $( "#profile-form" ).submit() } );
	$( "#edit-form" ).show();
}