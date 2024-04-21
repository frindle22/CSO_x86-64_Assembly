#include <stdio.h>
#include <stdlib.h>

typedef long long ll;

void line(ll n, ll* a, ll* res);

int main(void) {
    ll n;
    scanf("%lld", &n);

    ll* a = (ll*)malloc(n * sizeof(ll));

    for (ll i = 0; i < n; i++) {
        scanf("%lld", &a[i]);
    }

    ll* res = (ll*)malloc(n * sizeof(ll));

    line(n, a, res);

    for (int i = 0; i < n; i++) {
        printf("%lld ", res[i]);
    }

    printf("\n");

    return 0;
}
