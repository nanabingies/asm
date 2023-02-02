
#include <iostream>

extern "C" bool Cc2_(const int64_t* a, const int64_t* b, int64_t n, int64_t* sum_a, int64_t* sum_b, int64_t* prod_a, int64_t* prod_b);
extern "C" bool trial_(const int64_t * a, int64_t* sum, int64_t n);

int main() {
	const __int32 n = 6;
	int64_t a[n] = { 2,-2,-6,7,12,5 };
	int64_t b[n] = { 3,5,-7,8,4,9 };
	int64_t sum_a, sum_b;
	int64_t prod_a, prod_b;

	printf("\nResults for CallingConvention2\n");
	bool rc = Cc2_(a, b, n, &sum_a, &sum_b, &prod_a, &prod_b);

	if (!rc)
		printf("Invalid return code from Cc2_()\n");
	else {
		for (int i = 0; i < n; i++)
			printf("%7lld %7lld\n", a[i], b[i]);
		printf("\n");
		printf("sum_a: %7lld sum_b: %7lld\n", sum_a, sum_b);
		printf("prod_a: %7lld prod_b: %7lld\n", prod_a, prod_b);
	}

	int64_t sum;
	rc = trial_(a, &sum, n);

	printf("sum : %lld\n", sum);

	return 0;
}