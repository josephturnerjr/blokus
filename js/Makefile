#SRCS = main.coffee sharing.coffee
#all:
#	coffee -c $(SRCS)
#
COFFEEC = coffee

all: $(patsubst %.coffee, %.js, $(wildcard *.coffee))

watch:
	coffee -w -c $(SRCS)

%.js: %.coffee
	$(COFFEEC) -c $<
