#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
/* Demo program for OpenMP: computes trapezoidal approximation to an
integral*/
const double pi = 3.141592653589793238462643383079;
int main(int argc, char** argv) {
 /* Variables */
 double a = 0.0, b = pi; /* limits of integration */;
 int n = 1048576; /* number of subdivisions = 2^20 */
 double h = (b - a) / n; /* width of subdivision */
 double integral; /* accumulates answer */
 long threadct = 1; /* number of threads to use */
 int i; /* loop control */
 double f(double x);
 /* parse command-line arg for number of threads */
 if (argc > 1)
 threadct = strtol(argv[1], NULL, 10);
#ifdef _OPENMP
 printf("OMP defined, threadct = %ld\n", threadct);
#else
 printf("OMP not defined\n");
#endif

 integral = (f(a) + f(b))/2.0; /* initialize the variable integral */
 
 #pragma omp parallel for private(i) shared (a, n, h, integral)
 for(i = 1; i < n; i++) {
 integral += f(a+i*h);
 }

 integral = integral * h;
 printf("With n = %d trapezoids, our estimate ", n);
 printf("of the integral from %g to %g is %g\n", a, b, integral);
}
double f(double x) {
 return sin(x);
}