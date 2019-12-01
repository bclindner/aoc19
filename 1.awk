#!/usr/bin/awk -f
BEGIN { sum = 0 }
function fuel(amt) {
  f = int(amt / 3) - 2
  sum += (f < 0 ? 0 : f + fuel(f))
}
{ fuel($1) }
END {
  print sum
}
