.PHONY: all install update link audit clean

all: install

install:
	@echo "=> Setting up Dotfiles..."
	@./dotfile_admin/scripts/link.sh
	@./dotfile_admin/scripts/packages.sh
	@./dotfile_admin/scripts/asdf.sh
	@./dotfile_admin/scripts/npm.sh
	@./dotfile_admin/scripts/misc.sh
	@./dotfile_admin/scripts/osx.sh
	@echo "=> Installation Complete!"

update:
	@./dotfile_admin/scripts/update.sh

link:
	@./dotfile_admin/scripts/link.sh

audit:
	@./dotfile_admin/scripts/audit.sh

clean:
	@./dotfile_admin/scripts/uninstall.sh