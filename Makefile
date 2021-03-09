all: bin/lexer bin/parser

bin/parser : src/cparser.py
	rm -rf bin/parser
	cp src/cparser.py bin/parser
	chmod +x bin/parser

bin/lexer : src/clexer.py
	rm -rf bin
	mkdir bin
	cp src/clexer.py bin/lexer
	chmod +x bin/lexer
	

run_test:
	./test.sh
clean:
	rm -rf bin
