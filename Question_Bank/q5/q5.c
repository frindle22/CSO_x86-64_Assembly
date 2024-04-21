#include <stdio.h>
#include <stdlib.h>

typedef long long ll;

void arrange(ll n, ll* res);

int main(void) {
    ll n;
    scanf("%lld", &n);

    ll* res = (ll*)malloc(n * sizeof(ll));

    for (ll i = 0; i < n; i++) {
        scanf("%lld", &res[i]);
    }

    arrange(n, res);

    for (ll i = 0; i < n; i++) {
        printf("%lld ", res[i]);
    }

    printf("\n");

    return 0;
}
