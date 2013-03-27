# Given a type string, get the match syntax name
nameFromType = (type) ->
	names =
		c: 'C/C++/C#'
		css: 'CSS'
		coffeescript: 'CoffeeScript'
		javascript: 'JavaScript'
		json: 'JSON'
		less: 'LESS'
		makefile: 'Makefile'
		'objective-c': 'Objective-C'
		ruby: 'Ruby'
		text: 'Plain Text'
	names[type] || type


# Given a .file DOM node, find out what type of code it contains
filetype = (file) ->
	str = file.children('div').get(1).className
	match = str.match(/type-([_a-zA-Z0-9-]+)/)
	if match.length > 1 then match[1] else false


menu = (type) ->
	$('<div>')
	.addClass('select-menu')
	.addClass('js-menu-container')
	.addClass('js-select-menu')
	.addClass('js-period-container')
	.css('line-height', '33px')
	.css('float', 'right')
	.css('margin-right', '8px')
	.append(
		$('<span>')
		.addClass('minibutton')
		.addClass('select-menu-button')
		.addClass('js-menu-target')
		.append(
			$('<i>')
			.text('indent size:')
		).append(
			$('<span>')
			.addClass('js-select-button')
			.text(' 4')
		)
	).append(
		$('<div>')
		.addClass('select-menu-modal-holder')
		.addClass('js-menu-content')
		.addClass('js-navigation-container')
		.css('line-height', '1.4')
		.append(
			$('<div>')
			.addClass('select-menu-modal')
			.append(
				$('<div>')
				.addClass('select-menu-header')
				.append(
					$('<span>')
					.addClass('select-menu-title')
					.text("Select Indentation Size (#{nameFromType type})")
				).append(
					$('<span>')
					.addClass('mini-icon')
					.addClass('mini-icon-remove-close')
					.addClass('js-menu-close')
				)
			).append(
				$('<div>')
				.addClass('select-menu-list')
				.append((
					$('<div>')
					.addClass('select-menu-item')
					.addClass('js-navigation-item')
					.addClass('js-navigation-target')
					.append(
						$('<input>')
						.attr(
							id: "tabsize_#{indent}"
							name: 'tabsize'
							type: 'radio'
						).val(indent)
					).append(
						$('<span>')
						.addClass('select-menu-item-icon')
						.addClass('mini-icon')
						.addClass('mini-icon-confirm')
					).append(
						$('<div>')
						.addClass('select-menu-item-text')
						.addClass('js-select-button-text')
						.text(indent)
					) for indent in [2, 4, 8])
				)
			)
		)
	)


load = (files) ->
	for file in ($ file for file in files)
		type = filetype file
		continue unless type
		chooser = menu type
		chooser.find('.select-menu-item').on('mouseenter', (event) ->
			$(this).addClass 'navigation-focus'
		).on('mouseleave', (event) ->
			$(this).removeClass 'navigation-focus'
		)

		chooser.appendTo file.find '.meta'

load $ '#files .file'
