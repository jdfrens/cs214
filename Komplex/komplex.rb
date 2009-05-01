class Komplex
  def initialize(real, imag)
    @real = real
    @imag = imag
  end
  
  def magnitude
    return Math.sqrt(@real * @real + @imag * @imag)
  end
end
