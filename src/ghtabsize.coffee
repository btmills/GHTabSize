typeNames =
	c: 'C/C++/C#'
	css: 'CSS'
	coffeescript: 'CoffeeScript'
	javascript: 'JavaScript'
	json: 'JSON'
	less: 'LESS'
	'objective-c': 'Objective-C'
	text: 'Plain Text'

filetype = (file) ->
	el = file.children('div')
	console.dir el
	el.get(1).className.match(/type-([_a-zA-Z0-9-]+)/)[1]

files = $ '#files .file'
for file in files
	file = $ file
	type = filetype file
	chooser = $ """
	<div class="select-menu js-menu-container js-select-menu js-period-container"
		style="line-height: 33px; float: right; margin-right: 8px;">
		<span class="minibutton select-menu-button js-menu-target">
			<i>Tab size:</i>
			<span class="js-select-button"> 4</span>
		</span>
		<div class="select-menu-modal-holder js-menu-content js-navigation-container"
			style="line-height: 1.4">
			<div class="select-menu-modal">
				<div class="select-menu-header">
					<span class="select-menu-title">Tab size (#{typeNames[type] || type})</span>
					<span class="mini-icon mini-icon-remove-close js-menu-close"></span>
				</div>
				<div class="select-menu-list">
					<div class="select-menu-item js-navigation-item js-navigation-target">
						<input id="tabsize_2" name="tabsize" type="radio" value="2" />
						<span class="select-menu-item-icon mini-icon mini-icon-confirm"></span>
						<div class="select-menu-item-text js-select-button-text">2</div>
					</div>
					<div class="select-menu-item js-navigation-item js-navigation-target selected">
						<input id="tabsize_4" name="tabsize" type="radio" value="4" />
						<span class="select-menu-item-icon mini-icon mini-icon-confirm"></span>
						<div class="select-menu-item-text js-select-button-text">4</div>
					</div>
					<div class="select-menu-item js-navigation-item js-navigation-target">
						<input id="tabsize_8" name="tabsize" type="radio" value="8" />
						<span class="select-menu-item-icon mini-icon mini-icon-confirm"></span>
						<div class="select-menu-item-text js-select-button-text">8</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	"""
	chooser.find('.select-menu-item').on('mouseenter', (event) ->
		$(this).addClass 'navigation-focus'
	).on('mouseleave', (event) ->
		$(this).removeClass 'navigation-focus'
	)

	chooser.appendTo file.find '.meta'
