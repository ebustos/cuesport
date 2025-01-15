.PHONY: all reload compile clean

all: compile

compile: rebar3
	./rebar3 get-deps
	./rebar3 compile

reload: compile
	zsh -c './reload.erl $$(foreach f (src/*.erl); basename $$f .erl; end)'

rebar3:
	wget -c https://github.com/erlang/rebar3/releases/latest/download/rebar3
	chmod +x $@

clean: rebar3
	./rebar3 clean
