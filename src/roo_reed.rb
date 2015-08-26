#!/usr/bin/env ruby

# years.each do |y|
#   puts y
# end

# years.each {|a| puts a.semanas.count}

# header = hoja1.row(0)
# puts header

require 'roo'
require_relative 'epi_year'
require 'easystats'
require 'matrix'
require 'easystats'

years = []
promedio = []
desviacion = []
ic95_superior = []
ic95_inferior = []

puts "Leyendo base de datos... "
xlsx = Roo::Excelx.new("../input/Entradas.xlsx")
hoja1 = xlsx.sheet("input")

(hoja1.first_row..hoja1.last_row).each do |r|
  fila = hoja1.row(r)
  e =  EpiYear.new(fila[0], fila[54])
  (1..52).each { |a| e.semanas << fila[a].to_i }
  years << e
end

a = []
years.each do |y|
   a << y.semanas
end

b = Matrix.rows(a)

puts "Calculando datos estadisticos... "
((0)..(b.column_count-1)).each do |col|
  avrg = b.column(col).to_a.average 
  stdv = b.column(col).to_a.standard_deviation 
  promedio << avrg
  desviacion << stdv
  ic95_superior << avrg + (2.02*(stdv/Math.sqrt(5)))
  ic95_inferior << avrg - (2.02*(stdv/Math.sqrt(5)))
end

puts "Promedio de casos"
print promedio
puts "Indice de confianza Superior"
print ic95_inferior
puts "Indice de confianza Inferior"
print ic95_superior
