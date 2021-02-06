all:
	rm -rf bin
	mkdir bin
	cp src/clexer.py bin/clexer
	chmod +x bin/clexer

test:
	./test.sh
clean:
	rm -rf bin