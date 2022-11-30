LANGUAGES = c cpp erlang go java js perl python rust haskell
LENGTH = 13

default: $(LANGUAGES) RUN

$(LANGUAGES): RUN
	$(MAKE) -C $@ LENGTH=$(LENGTH)

RUN: