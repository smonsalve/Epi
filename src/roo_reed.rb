#!/usr/bin/env ruby

require 'roo'
require_relative 'epi_year'
require 'easystats'

xlsx = Roo::Excelx.new("../input/Entradas.xlsx")
hoja1 = xlsx.sheet("input")
# header = hoja1.row(0)
# puts header
years = []

(hoja1.first_row..hoja1.last_row).each do |r|
  fila = hoja1.row(r)
  e =  EpiYear.new(fila[0], fila[54])
  (1..52).each { |a| e.semanas << fila[a].to_i }
  puts e
  years << e
end

# years.each do |y|
#  	puts y
# end
