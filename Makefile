

SRC := ./src
BIN := ./bin



# all: bin/lexer bin/parser

# /parser : src/cparser.py src/structure.py src/typecheck.py bin/lexer src/utils.py src/threeaddr.py
# 	rm -rf bin/parser
# 	cp src/cparser.py bin/parser
# 	cp src/cparser.py bin/cparser.py
# 	cp src/structure.py bin/structure.py
# 	cp src/typecheck.py bin/typecheck.py
# 	cp src/threeaddr.py bin/threeaddr.py
# 	cp src/utils.py bin/utils.py
# 	chmod +x bin/parser


COMPILER := kurkure 
SRC := ./src
SRCS := $(wildcard $(SRC)/*.py) 
MAIN = main.py
.PHONY: all run clean

all: $(SRC)/$(COMPILER)

$(SRC)/$(COMPILER) : $(SRCS)
	cp $(SRC)/$(MAIN) $(SRC)/$(COMPILER)
	
run_test:
	./test.sh
clean:
	rm -rf $(SRC)/$(COMPILER)
