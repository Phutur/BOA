BUILD = ocamlbuild -use-ocamlfind -plugin-tags 'package(eliom.ocamlbuild)'
SERVER = app/server
CLIENT = app/client
RUN = ocsigenserver -v -c

clean : clean_emacs_temp
	ocamlbuild -clean
	rm -rf public/boa.js

clean_emacs_temp :
	rm -rf *~
	rm -rf */*~

clean_log :
	rm -rf log/*

run : build
	$(RUN) config/server.xml

build :
	$(BUILD) $(SERVER)/boa.cma $(SERVER)/boa.cmxs $(CLIENT)/boa.js
	ln -sf ../_build/$(CLIENT)/boa.js public/boa.js

.PHONY: clean build
