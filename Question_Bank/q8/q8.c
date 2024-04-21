#include <stdio.h>
#include <stdlib.h>

typedef long long ll;

void wave(ll n, ll* a);

int main(void) {
    ll n;
    scanf("%lld", &n);

    ll* a = (ll*)malloc(n * sizeof(ll));

    for (ll i = 0; i < n; i++) {
        scanf("%lld", &a[i]);
    }

    wave(n, a);

    for (ll i = 0; i < n; i++) {
        printf("%lld ", a[i]);
    }

    printf("\n");

    return 0;
}
