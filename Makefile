LANGUAGES = c cpp erlang go java js perl python rust haskell csharp coffeescript lua mojo
LENGTH = 13
TEST_LENGTH ?= 5
OPTIONAL_TEST_LANGUAGES ?= mojo

default: $(LANGUAGES) RUN

$(LANGUAGES): RUN
	$(MAKE) -C $@ LENGTH=$(LENGTH)

RUN:

test:
	OPTIONAL_LANGUAGES="$(OPTIONAL_TEST_LANGUAGES)" bash scripts/test_all_languages.sh $(TEST_LENGTH)

test-lang:
	bash scripts/test_language.sh "$(LANGUAGE)" "$(TEST_LENGTH)"