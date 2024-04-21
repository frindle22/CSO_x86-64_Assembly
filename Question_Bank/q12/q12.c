#include <stdio.h>
#include <stdlib.h>

typedef long long ll;

ll special(ll n);

int main(void) {
    ll n;
    scanf("%lld", &n);

    ll res = special(n);

    printf("%s\n", ((res == 1) ? "TRUE" : "FALSE"));

    return 0;
}
