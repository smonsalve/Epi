require 'roo'

xlsx = Roo::Excelx.new("./Entradas.xlsx")
# xlsx.each_row_streaming do |row|
#   puts row.inspect # Array of Excelx::Cell objects
# end


#puts xlsx.info
#puts xlsx.sheets
#puts xlsx.sheet("2009").row(1) 
row = []
hoja1 = xlsx.sheet("input")
header = hoja1.row(1)
(2..hoja1.last_column).each do |i|
	row = Hash[[header,hoja1.row(i)].transpose]
end

puts row