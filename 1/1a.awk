#!/usr/bin/awk -f
BEGIN { sum = 0 }
function fuel(amt) {
  f = int(amt / 3) - 2
  sum += f
}
{ fuel($1) }
END {
  print sum
}
