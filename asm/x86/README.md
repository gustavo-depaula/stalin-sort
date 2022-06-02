x86-64 implementation of Stalin sort in `stalin.asm`

Example in `test.asm`. Compile and run with:
```
nasm -felf64 test.asm
ld -melf_x86_64 -o test test.o
chmod +x test
./test
```
