function Komplex(real, imag) {
  this.real = real;
  this.imag = imag;
}

Komplex.prototype = {
  magnitude:
    function() {
      return Math.sqrt(this.real * this.real + this.imag * this.imag);
    }
}