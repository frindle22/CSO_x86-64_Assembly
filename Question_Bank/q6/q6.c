#include <stdio.h>
#include <stdlib.h>

typedef long long ll;

ll gcd(ll m, ll n);

int main(void) {
    ll m, n;
    scanf("%lld %lld", &m, &n);

    ll res = gcd(m, n);

    printf("%lld\n", res);

    return 0;
}
