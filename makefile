all:
	stow --verbose --target=$$HOME --restow */
	ln -sf $$PWD/tmpl ~/.local/bin/tmpl
delete:
	stow --verbose --target=$$HOME --delete */
	rm ~/.local/bin/tmpl
