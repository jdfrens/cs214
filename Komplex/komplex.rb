class KomplexRI
  def initialize(real, imag)
    @real = real
    @imag = imag
  end
  
  def magnitude
    return Math.sqrt(@real * @real + @imag * @imag)
  end
  
  def to_s
    "#{@real}+#{@imag}i"
  end
end

class KomplexPR
  def initialize(phi, r)
    @phi = phi
    @r = r
  end
  
  def magnitude
    @r
  end
  
  def to_s
    "#{@r} cis #{@phi}"
  end
end

def reportMagnitude(komplex)
  puts "|#{komplex}| = #{komplex.magnitude}"
end

reportMagnitude KomplexRI.new(0.0, 0.0)
reportMagnitude KomplexRI.new(5.0, 2.0)

reportMagnitude KomplexPR.new(0.0, 0.0)
reportMagnitude KomplexPR.new(0.75 * 3.14159, 1.5)
