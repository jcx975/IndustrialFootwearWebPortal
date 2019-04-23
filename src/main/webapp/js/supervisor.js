$( document ).ready( function()
{
	$( "#edit-button" ).on( "click", editProfile );
} );

function editProfile()
{
	$( "#delete-button" ).remove();
	$( "#edit-button" ).remove();
	$( "#top-buttons" ).append( "<button type='button' id='cancel-button' class='btn btn-danger mr-2'>Cancel</button>" );
	$( "#top-buttons" ).append( "<button type='button' id='save-button' class='btn btn-success mr-2'>Save Profile</button>" );
	$( "#cancel-button" ).on( "click", function() { window.location.reload( false ) } );
	$( "#save-button" ).on( "click", function() { $( "#profile-form" ).submit() } );
	$( "#edit-form" ).show();
}