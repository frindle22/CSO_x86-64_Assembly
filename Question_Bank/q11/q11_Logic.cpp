#include <bits/stdc++.h>
using namespace std;

typedef long long ll;

void solve(void) {
    int n;
    cin >> n;
    string s;
    cin >> s;

    vector<int> people(n);

    ll total = 0;

    for (int i = 0; i < n; i++) {
        if (s[i] == 'L') {
            people[i] = i;
        }
        else {
            people[i] = n - 1 - i;
        }
        total += people[i];
    }

    sort(people.begin(), people.end());

    for (int i = 0; i < n; i++) {
        if (people[i] < n / 2) {
            total += (n - 1 - 2 * people[i]);
        }
        people[i] = total;
    }

    for (int i = 0; i < n; i++) {
        cout << people[i] << " ";
    }
    
    cout << "\n";
}

int main(void) {
    int t;
    cin >> t;

    while (t--) {
        solve();
    }

    return 0;
}
