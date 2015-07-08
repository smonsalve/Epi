#!/usr/bin/env ruby
require 'matrix'
require 'easystats'


b = Matrix.rows(
[[5,	5,	5],
[4,	1,	6],
[7,	3,	1],
[12,	14,	17],
[4,	11,	6]])

puts b.column(0).to_a.average
puts b.column(0).to_a.standard_deviation

avrg = b.column(0).to_a.average
stdv = b.column(0).to_a.standard_deviation

ic95_superior = avrg + (2.02*(stdv/Math.sqrt(5)))
ic95_inferior = avrg - (2.02*(stdv/Math.sqrt(5)))

puts (ic95_inferior.to_s + " " + ic95_superior.to_s)