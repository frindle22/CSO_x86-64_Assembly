#include <stdio.h>
#include <stdlib.h>

typedef long long ll;

ll operations(ll m, ll n, ll s);

int main(void) {
    ll m, n, s;
    scanf("%lld %lld %lld", &m, &n, &s);

    ll res = operations(m, n, s);

    printf("%lld\n", res);

    return 0;
}
