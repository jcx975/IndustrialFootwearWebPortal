
$(document).ready( function()
{
	$( "#profiles-search" ).on( "keyup", profileSearch );

	for ( let i = 0; i < 1001; i++ )
	{
		$( "#profiles-list" ).append( newCompanyProfile( "Test " + i ) );
	}
} );

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
				$( parent ).hide()
			else
				$( parent ).show();
		} );
	} else
		$( ".profile-container" ).show();
}

function newCompanyProfile( company_name )
{
	let profbox = document.createElement( "div" );
	let profile = document.createElement( "div" );

	$( profbox ).addClass( "col-md-6 mb-5 profile-container" );
	$( profile ).addClass( "company-profile" );
	$( profile ).append( "<p class='profile-name'>" + company_name + "</p>" );
	$( profile ).append( "<p>Brief information about company \"" + company_name + ".\"</p>" );
	$( profile ).append( "<button type='button' class='btn btn-primary'>View Details</button>")

	$( profbox ).append( profile );

	return profbox;
}