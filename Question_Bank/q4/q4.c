#include <stdio.h>
#include <stdlib.h>

typedef long long ll;

ll palindrome(ll n);

int main(void) {
    ll n;
    scanf("%lld", &n);

    ll res = palindrome(n);

    printf("%s\n", ((res == 1) ? "True" : "False"));

    return 0;
}
