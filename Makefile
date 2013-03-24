ghtabsize:
	coffee -bc -o lib src/ghtabsize.coffee

watch:
	coffee -bcw -o lib src/ghtabsize.coffee

clean:
	rm src/ghtabsize.js
