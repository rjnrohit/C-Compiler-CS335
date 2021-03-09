# C-Compiler-CS335
Course Project , C-compiler implemented in Python , CS335, IIT Kanpur
<br>
<!-- [Milestone1 Report (Latex)](https://github.com/RohitRanjangit/C-Compiler-CS335/blob/main/Documentation/CS335_Project_Milestone1.pdf) -->
[Milestone1 Report](reports/CS335_Project_Milestone1.pdf)

environment-setup:

**Choose your default version to python3**
```
#upgrade to latest version of pip
python3 -m pip install --upgrade pip
sudo apt-get install graphviz graphviz-dev
pip install -U -r requirements.txt
```


build: 
```
make
```

usage:
```

./bin/lexer [-h] [-t] source_code               //to run lexer
./bin/parser source_code [-o] file              //to generate AST
positional arguments:
  source_code  source code file location

optional arguments:
  -h, --help   show this help message and exit
  -t           not print tokens
  -o           to specify the name of dot script, default name is 'ast.dot'
```

Run tests from test/
```
chmod +x test.sh
./test.sh
```
