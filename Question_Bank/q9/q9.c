#include <stdio.h>
#include <stdlib.h>

typedef long long ll;

ll missing(ll n, ll* a);

int main(void) {
    ll n;
    scanf("%lld", &n);

    ll* a = (ll*)malloc(n * sizeof(ll));

    for (ll i = 0; i < n; i++) {
        scanf("%lld", &a[i]);
    }

    ll res = missing(n, a);

    printf("%lld\n", res);

    return 0;
}
