#!/usr/bin/env ruby

require 'roo'
require_relative 'epi_year'

xlsx = Roo::Excelx.new("../input/Entradas.xlsx")
# xlsx.each_row_streaming do |row|
#   puts row.inspect # Array of Excelx::Cell objects
# end


#puts xlsx.info
#puts xlsx.sheets
#puts xlsx.sheet("2009").row(1) 
# row = []

hoja1 = xlsx.sheet("input")

header = hoja1.row(1)
# (..hoja1.last_column).each do |i|
#   row = Hash[[header,hoja1.row(i)].transpose]
# end


# hoja1.each(year: 'year', total: 'Total', poblacion: 'poblacion') do |hash|
#   e =  EpiYear.new(hash[:year], hash[:poblacion])
#   puts e
# end

# hoja1.each_row(year: 'year', total: 'Total', poblacion: 'poblacion') do |hash|


#   puts e
# end

(hoja1.first_row..hoja1.last_row).each do |r|
  fila = hoja1.row(r)
  e =  EpiYear.new(fila[1], fila[54])
  (1..52).each { |a| e.semanas << fila[a].to_i }
  puts e
end



#puts header
# puts row