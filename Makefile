all: bin/lexer bin/parser

bin/parser : src/cparser.py src/visualize.py bin/lexer
	rm -rf bin/parser
	cp src/cparser.py bin/parser
	cp src/cparser.py bin/cparser.py
	cp src/visualize.py bin/visualize.py
	cp src/dump_csv.py bin/dump_csv.py
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
