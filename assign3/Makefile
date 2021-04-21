all: bin/lexer bin/parser

bin/parser : src/cparser.py src/structure.py src/typecheck.py bin/lexer src/utils.py
	rm -rf bin/parser
	cp src/cparser.py bin/parser
	cp src/cparser.py bin/cparser.py
	cp src/structure.py bin/structure.py
	cp src/typecheck.py bin/typecheck.py
	cp src/utils.py bin/utils.py
	chmod +x bin/parser

bin/lexer : src/clexer.py
	rm -rf bin
	mkdir bin
	cp src/clexer.py bin/lexer
	cp src/clexer.py bin/clexer.py
	chmod +x bin/lexer
	

run_test:
	./test.sh
clean:
	rm -rf bin
