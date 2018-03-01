# INTRODUCTION
This is a PHP extension which computes float matrix products.

It supports OpenBLAS sgemm and cuBLAS sgemm function.

To Enable OpenBLAS support, you have to specify its library path.

To Enable cuBLAS support, CUDA development environment required.

Some other functions like sum, scale, transpose, etc... included.

(But, they are not utilize OpenBLAS nor cuBLAS.)

# INSTALL

Clone this repository to your computer.

PHP development environment required.

```shell
$ cd PHPMatrix
$ phpize

# for simple matrix multiplication
$ ./configure

# to enable OpenBLAS support
$ ./configure --with-openblas=/PATH/TO/OpenBLAS # ex.) /opt/OpenBLAS

# to enable cuBLAS support
$ ./configure --enable-cublas
$ ./build_cublas_support_lib.sh # to build CUDA code.

$ make
$ make install # if needed
```

# Running sample code
```shell
# specify the extension file explicitly unless installed globally.
$ php -d extension=./modules/matrix.so sample.php
```
# LICENSE
This software is released under the MIT License, see LICENSE.txt.

