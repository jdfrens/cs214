function KomplexRI(real, imag) {
  this.real = real;
  this.imag = imag;
}

KomplexRI.prototype = {
  magnitude:
    function() {
      return Math.sqrt(this.real * this.real + this.imag * this.imag);
    },
  toString:
    function() {
      return this.real + "+" + this.imag + "i";
    }
}

function KomplexPR(phi, r) {
  this.phi = phi;
  this.r = r;
}

KomplexPR.prototype = {
  magnitude:
    function() {
      return this.r;
    },
  toString:
    function() {
      return this.r + " cis " + this.phi;
    }
}

function reportMagnitude(komplex) {
  print("|" + komplex.toString() + "| = " + komplex.magnitude());
}

reportMagnitude(new KomplexRI(0.0, 0.0));
reportMagnitude(new KomplexRI(5.0, 2.0));

reportMagnitude(new KomplexPR(0.0, 0.0));
reportMagnitude(new KomplexPR(0.75 * 3.14159, 1.5));
