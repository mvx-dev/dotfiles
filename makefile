all:
	stow --verbose --target=$$HOME --restow */ --ignore=.jpg
delete:
	stow --verbose --target=$$HOME --delete */
