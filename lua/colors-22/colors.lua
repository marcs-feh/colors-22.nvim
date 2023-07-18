C = {
	regular = {
		-- Main colors
		bg        = '#1d2021',
		bg_alt    = '#303536',
		bg_br     = '#434a4c',
		bg_br_alt = '#606a6c',
		fg        = '#f4e5bf',
		fg_alt    = '#eed89f',
		fg_br     = '#fcf8ee',
		fg_br_alt = '#f9f1dc',

		-- Highlights
		type         = '#81aece',
		type_alt     = '#7ec9b1',
		reserved     = '#cda2e3',
		reserved_alt = '#af91d5',
		id           = '#ebe3cb',
		id_alt       = '#e6b995',
		literal      = '#c4dc9b',
		literal_alt  = '#8ac87d',
		func         = '#ecdc8b',
		func_alt     = '#ecdc8b',
		str          = '#cd9169',
		str_alt      = '#cdaf69',

		-- Diagnostic
		error = '#d83e33',
		warn  = '#f2ba41',
		hint  = '#cda1ac',
		info  = '#c8889f',
	},
	term = {
		-- Main colors
		bg        = nil,
		bg_alt    = 'black',
		bg_br     = nil,
		bg_br_alt = nil,
		fg        = nil,
		fg_alt    = 'white',
		fg_br     = 'white',
		fg_br_alt = 'white',

		-- Highlights
		type         = 'blue',
		type_alt     = 'cyan',
		reserved     = 'yellow',
		reserved_alt = 'yellow',
		id           = 'white',
		id_alt       = 'white',
		literal      = 'white',
		literal_alt  = 'white',
		func         = 'white',
		func_alt     = 'white',
		str          = 'green',
		str_alt      = 'green',

		-- Diagnostic
		error = 'red',
		warn  = 'yellow',
		hint  = 'magenta',
		info  = 'magenta',
	},
}

return C
