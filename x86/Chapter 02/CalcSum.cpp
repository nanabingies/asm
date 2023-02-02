#include <iostream>

extern "C" int CalcSum_(int a, int b, int c);

extern "C" int IntegerMulDiv_(int a, int b, int* prod, int* quo, int* rem);

int main(int argc, char* argv[]) {
	int a = 17, b = 11, c = 14;
	int sum = CalcSum_(a, b, c);

	printf("a : %d\n", a);
	printf("b : %d\n", b);
	printf("c : %d\n", c);
	printf("sum : %d\n", sum);

	printf("Integer multiplication\n");

	a = 21, b = 9;
	int prod = 0, quo = 0, rem = 0;
	int rc;

	rc = IntegerMulDiv_(a, b, &prod, &quo, &rem);
	printf(" Input1 - a: %4d b: %4d\n", a, b);
	printf("Output1 - rc: %4d prod: %4d\n", rc, prod);
	printf(" quo: %4d rem: %4d\n\n", quo, rem);

	a = -29;
	prod = quo = rem = 0;
	rc = IntegerMulDiv_(a, b, &prod, &quo, &rem);
	printf(" Input2 - a: %4d b: %4d\n", a, b);
	printf("Output2 - rc: %4d prod: %4d\n", rc, prod);
	printf(" quo: %4d rem: %4d\n\n", quo, rem);

	b = 0;
	prod = quo = rem = 0;
	rc = IntegerMulDiv_(a, b, &prod, &quo, &rem); 
	printf(" Input3 - a: %4d b: %4d\n", a, b);
	printf("Output3 - rc: %4d prod: %4d\n", rc, prod);
	printf(" quo: %4d rem: %4d\n\n", quo, rem);

	return 0;
}