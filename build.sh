rm -f *.o
rm -f main

$CLANG -g -O2 -fsanitize-coverage=trace-pc-guard -flto -c internal_module.c -o internal_module.o
$CLANG -g -O2 -fsanitize-coverage=trace-pc-guard -c main.c -o main.o
$CLANG -O2 -flto cov-runtime.c internal_module.o main.o -o main
