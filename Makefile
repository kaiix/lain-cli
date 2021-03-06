PACKAGE_NAME = einplus_lain_cli
VERSION = $(shell cat lain_cli/__init__.py | ag -o "(?<=').+(?=')")

test: clean
	- cd tests && py.test

clean:
	- find . -iname "*__pycache__" | xargs rm -rf
	- find . -iname "*.pyc" | xargs rm -rf
	- rm -rf dist build lain_cli.egg-info

overwrite-package:
	devpi login root --password=$(PYPI_ROOT_PASSWORD)
	devpi remove $(PACKAGE_NAME)==$(VERSION) || true
	devpi upload
