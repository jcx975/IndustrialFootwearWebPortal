
$( document ).ready( function()
{
	$( "#edit-button" ).on( "click", editCompany );
	$( "#supervisorSearch" ).on( "keyup", supervisorSearch );
	$( "#programSearch" ).on( "keyup", programSearch );
} );

function editCompany()
{
	$( "#delete-button" ).remove();
	$( "#edit-button" ).remove();
	$( "#top-buttons" ).append( "<button type='button' id='cancel-button' class='btn btn-danger mr-2'>Cancel</button>" );
	$( "#top-buttons" ).append( "<button type='button' id='save-button' class='btn btn-success mr-2'>Save Profile</button>" );
	$( "#cancel-button" ).on( "click", function() { window.location.reload( false ) } );
	$( "#save-button" ).on( "click", function() { $( "#company-form" ).submit() } );
	$( "#edit-form" ).show();
}

function supervisorSearch()
{
	let searchString = $.trim( $( "#supervisorSearch" ).val().toLowerCase() );

	if ( searchString != "" )
	{
		$( ".supervisor-container" ).each( function()
		{
			let name = $( this ).find( ".profile-name" ).text().toLowerCase();
			
			if ( name.indexOf( searchString ) === -1 )
				$( this ).hide();
			else
				$( this ).show();
		} );
	} else
		$( ".supervisor-container" ).show();
}

function programSearch()
{
	let searchString = $.trim( $( "#programSearch" ).val().toLowerCase() );

	if ( searchString != "" )
	{
		$( ".program-container" ).each( function()
		{
			let name = $( this ).find( ".profile-name" ).text().toLowerCase();

			if ( name.indexOf( searchString ) === -1 )
				$( this ).hide();
			else
				$( this ).show();
		} );
	} else
		$( ".program-container" ).show();
}