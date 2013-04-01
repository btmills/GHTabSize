# GHTabSize

I like four spaces. You might like two. GitHub uses eight. GHTabSize is a Chrome extension that changes the `tab-size` property based on your preferences. It has a setting for each syntax mode; you can use two spaces for CoffeeScript and four for C, and they won't conflict.

## Installation

1. `git clone https://github.com/btmills/GHTabSize.git`
2. Open chrome://extensions. 
3. Click "Load unpacked extension...".
4. Select the directory containing the cloned copy of the repository.
5. Open [some code](src/ghtabsize.coffee) on GitHub (you may have to refresh the page), and change the indent size!

## Known issues

- It only runs on page load. Clicking on a file from a directory listing doesn't reload the page, so right know you have to hit refresh. This will be fixed soon.
- There really needs to be a settings page. Working on it.

## License

The MIT License. See LICENSE for full text.
