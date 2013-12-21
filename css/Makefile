LESSC = lessc

all: $(patsubst %.less, %.css, $(wildcard *.less))

%.css: %.less
	$(LESSC) $< > $@
