class EpiYear

  attr_accessor :year, :semanas, :poblacion

  def initialize(year,poblacion)
    @year = year
    @semanas = []
    @poblacion = poblacion
  end

  def readSemanas
  end

  def defined?
    @poblacion.size >1 ? true : false
  end

  def to_s
    "#{@year} con población #{@poblacion}\n" + @semanas.to_s
  end

end

e = EpiYear.new("2005",2456)
puts e.to_s