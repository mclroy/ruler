#!/bin/sh

inch=254 # tenths of a millimeter
div=64
precision=7 # the number of decimal places

for l in $(seq 0 $div)
do
  (( p = 10 ** precision, x = p * l / div, a = x / p, b = x - a * p ))
  (( mm = x * inch / 10, z = mm / p, u = mm - z * p )) # in millimeters
  printf '%0*i/%0*i: %1i.%0*i %02i.%0*i ' ${#div} $l ${#div} ${div} $a $precision $b $z $precision $u
  for (( k = 2 ** (i=0); k <= div; k = 2 ** ++i ))
  do
    (( l % k )) && break || printf '-' # length markings
  done
  echo
done
