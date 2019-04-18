
$( document ).ready( function()
{
	$( "#profiles-search" ).on( "keyup", profileSearch );
} );

// Hides elements that don't match the user's search string.
function profileSearch()
{
	let searchString = $.trim( $( "#profiles-search" ).val().toLowerCase() );

	if ( searchString != "" )
	{
		$( ".company-profile" ).each( function()
		{
			let name = $( this ).find( ".profile-name" ).text().toLowerCase();
			let parent = $( this ).parent();

			if ( name.indexOf( searchString ) === -1 )
				$( parent ).hide();
			else
				$( parent ).show();
		} );
	} else
		$( ".profile-container" ).show();
}
