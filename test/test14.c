// Performing multiple bitwise operations using switch case

int main(){
    char operator = '^';
    
    long a = 0x56a, b = 0x44f;
    bool equal = (a==b);
    long x;

    switch (operator)
    {
    case '|':{
        x = a|b;
        break;
    }
    case '&':{
        x = a&b;
        break;
    }
    case '^':{
        x = a^b;
        break;
    }
    case '~':{
        x = ~a;
        break;
    }
    case '<':{
        x = a<b;
        break;
    }
    case '>':{
        x = a>b;
        break;
        continue;
    }
    default: x = a;
    }
    
}
