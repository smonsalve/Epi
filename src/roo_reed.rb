#!/usr/bin/env ruby

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

xlsx = Roo::Excelx.new("../input/Entradas.xlsx")
hoja1 = xlsx.sheet("input")
# header = hoja1.row(0)
# puts header


(hoja1.first_row..hoja1.last_row).each do |r|
  fila = hoja1.row(r)
  e =  EpiYear.new(fila[0], fila[54])
  (1..52).each { |a| e.semanas << fila[a].to_i }
  #puts e
  years << e
end

# years.each do |y|
#  	puts y
# end

# years.each {|a| puts a.semanas.count}

a = []
years.each do |y|
   a << y.semanas
end

b = Matrix.rows(a)


((0)..(b.column_count-1)).each do |col|
  avrg = b.column(col).to_a.average 
  stdv = b.column(col).to_a.standard_deviation 
  promedio << avrg
  desviacion << stdv
  ic95_superior << avrg + (2.02*(stdv/Math.sqrt(5)))
  ic95_inferior << avrg - (2.02*(stdv/Math.sqrt(5)))
end


#puts ic95_inferior
puts promedio
puts ic95_superior
