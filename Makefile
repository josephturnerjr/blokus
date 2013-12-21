PYTHON = ./env/bin/python

build: js css
	
run: build
	tmux new-session -d -s blokus 'python -m SimpleHTTPServer'
	tmux splitw -h -t blokus 'cd css; ~/bin/lesswatch'
	tmux splitw -v -t blokus 'cd js; watch make'
	tmux attach

js:
	make -C js 
	
css:
	make -C css

debug:
	$(PYTHON) runserver.py

db:
	$(PYTHON) create_db.py

test:
	python -m unittest discover tests/

dummy:

.PHONY: env dummy dashboard build js css
