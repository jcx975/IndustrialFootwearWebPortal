
var companyNames = [];

$( document ).ready( function()
{
	$( "#profiles-search" ).on( "keyup", profileSearch );
	
	// // Generate random company names for testing purposes.
	// // In the future this won't be done in JavaScript, we'll be reading
	// // from the database server-side.
	// for ( let i = 0; i < 1001; i++ )
	// {
	// 	let length = Math.floor( Math.random() * 10 ) + 1
	//
	// 	companyNames[ i ] = generateName( length );
	// }
	//
	// // Sort company names alphabetically
	// companyNames.sort();
	//
	// createProfileElements( companyNames );
} );

// Create a random string of letters of a certain length to simulate
// company names.
function generateName( length )
{
	let text = "";
	let letters = "abcdefghijklmnopqrstuvwxyz";

	for ( let i = 0; i < length; i++ )
	{
		let random_letter = letters.charAt( Math.floor( Math.random() * letters.length ) );

		if ( i === 0 )
			random_letter = random_letter.toUpperCase();

		text += random_letter;
	}

	return text;
}

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
				$( parent ).hide()
			else
				$( parent ).show();
		} );
	} else
		$( ".profile-container" ).show();
}

// Creates a new company profile page element. This will be done server-
// side and not in JavaScript.
function createProfileElements( company_names )
{
	for ( let i = 0; i < company_names.length; i++ )
	{
		let company_name = company_names[ i ];
		let profbox = document.createElement( "div" );
		let profile = document.createElement( "div" );

		$( profbox ).addClass( "col-md-6 mb-5 profile-container" );
		$( profile ).addClass( "company-profile" );
		$( profile ).append( "<p class='profile-name'>" + company_name + "</p>" );
		$( profile ).append( "<p>Brief information about company \"" + company_name + ".\"</p>" );
		$( profile ).append( "<button type='button' class='btn btn-primary'>View Details</button>")

		$( profbox ).append( profile );

		$( "#profiles-list" ).append( profbox );
	}
}