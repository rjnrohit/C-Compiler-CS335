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
./bin/lexer [-h] [-t] source_code

positional arguments:
  source_code  source code file location

optional arguments:
  -h, --help   show this help message and exit
  -t           not print tokens
```

Run tests from test/
```
chmod +x test.sh
./test.sh
```
