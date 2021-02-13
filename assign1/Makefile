all: bin/lexer

bin/lexer : src/clexer.py
	rm -rf bin
	mkdir bin
	cp src/clexer.py bin/lexer
	chmod +x bin/lexer
	
run_test:
	./test.sh
clean:
	rm -rf bin
