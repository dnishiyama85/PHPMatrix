dnl $Id$
dnl config.m4 for extension matrix

dnl Comments in this file start with the string 'dnl'.
dnl Remove where necessary. This file will not work
dnl without editing.

dnl If your extension references something external, use with:

PHP_ARG_WITH(matrix, for matrix support,
Make sure that the comment is aligned:
[  --with-matrix             Include matrix support])

dnl Otherwise use enable:

dnl PHP_ARG_ENABLE(matrix, whether to enable matrix support,
dnl Make sure that the comment is aligned:
dnl [  --enable-matrix           Enable matrix support])

if test "$PHP_MATRIX" != "no"; then
  dnl Write more examples of tests here...

  dnl # --with-matrix -> check with-path
  dnl SEARCH_PATH="/usr/local /usr"     # you might want to change this
  dnl SEARCH_FOR="/include/matrix.h"  # you most likely want to change this
  dnl if test -r $PHP_MATRIX/$SEARCH_FOR; then # path given as parameter
  dnl   MATRIX_DIR=$PHP_MATRIX
  dnl else # search default path list
  dnl   AC_MSG_CHECKING([for matrix files in default path])
  dnl   for i in $SEARCH_PATH ; do
  dnl     if test -r $i/$SEARCH_FOR; then
  dnl       MATRIX_DIR=$i
  dnl       AC_MSG_RESULT(found in $i)
  dnl     fi
  dnl   done
  dnl fi
  dnl
  dnl if test -z "$MATRIX_DIR"; then
  dnl   AC_MSG_RESULT([not found])
  dnl   AC_MSG_ERROR([Please reinstall the matrix distribution])
  dnl fi

  dnl # --with-matrix -> add include path
  dnl PHP_ADD_INCLUDE($MATRIX_DIR/include)

  dnl # --with-matrix -> check for lib and symbol presence
  dnl LIBNAME=matrix # you may want to change this
  dnl LIBSYMBOL=matrix # you most likely want to change this 

  dnl PHP_CHECK_LIBRARY($LIBNAME,$LIBSYMBOL,
  dnl [
  dnl   PHP_ADD_LIBRARY_WITH_PATH($LIBNAME, $MATRIX_DIR/$PHP_LIBDIR, MATRIX_SHARED_LIBADD)
  dnl   AC_DEFINE(HAVE_MATRIXLIB,1,[ ])
  dnl ],[
  dnl   AC_MSG_ERROR([wrong matrix lib version or lib not found])
  dnl ],[
  dnl   -L$MATRIX_DIR/$PHP_LIBDIR -lm
  dnl ])
  dnl
  dnl PHP_SUBST(MATRIX_SHARED_LIBADD)

  PHP_NEW_EXTENSION(matrix, matrix.c, $ext_shared,, -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1)
fi
