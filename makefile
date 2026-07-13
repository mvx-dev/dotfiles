all:
	stow --verbose --target=$$HOME --restow */
	rm ~/.local/bin/tmpl
	ln -s $PWD/tmpl ~/.local/bin/tmpl
delete:
	stow --verbose --target=$$HOME --delete */
	rm ~/.local/bin/tmpl
