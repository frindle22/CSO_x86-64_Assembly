#include <stdio.h>
#include <stdlib.h>

typedef long long ll;

ll maxCornerSum(ll n, ll b, ll* a);

int main(void) {
    ll n, b;
    scanf("%lld %lld", &n, &b);

    ll* a = (ll*)malloc(n * sizeof(ll));

    for (ll i = 0; i < n; i++) {
        scanf("%lld", &a[i]);
    }

    ll res = maxCornerSum(n, b, a);

    printf("%lld\n", res);

    return 0;
}
