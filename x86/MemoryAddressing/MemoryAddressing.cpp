
#include <iostream>

extern "C" int NumFibVals_;
extern "C" int MemoryAddressing_(int i, int* v1, int* v2, int* v3, int* v4);
extern "C" void trial_(int i, int* res);

int main() {
	/*for (int i = -1; i < NumFibVals_ + 1; i++) {
		int v1 = -1, v2 = -1, v3 = -1, v4 = -1;
		int rc = MemoryAddressing_(i, &v1, &v2, &v3, &v4);

		printf("i: %2d\trc: %2d - ", i, rc);
		printf("v1: %5d\tv2: %5d\tv3: %5d\tv4: %5d\n\n", v1, v2, v3, v4);
	}*/

	for (int i = 0; i < 5; i++) {
		int res;
		trial_(i, &res);
		printf("res: %d\n", res);
	}

	return 0;
}