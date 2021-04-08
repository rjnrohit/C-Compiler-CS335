// Check if a number is palindrome

int main() {
    int n, reversedN = 0, remainder, originalN;
    
    scanf("%d", &n);
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
