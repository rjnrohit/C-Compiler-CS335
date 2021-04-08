// Check if a number is palindrome

int main() {
    long reversedN = 0, remainder, originalN;
    
    long n = 123454321;
    originalN = n;

    // reversed integer is stored in reversedN
    while (n != 0) {
        remainder = n % 10;
        reversedN = reversedN * 10 + remainder;
        n /= 10;
    }

    int is_palindrome;
    // palindrome if orignalN and reversedN are equal
    if (originalN == reversedN)
        is_palindrome = 1;
    else
        is_palindrome = 0;

    return 0;
}
