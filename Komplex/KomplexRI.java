public class KomplexRI implements Komplex {
  private double myReal;
  private double myImag;
  
  public KomplexRI(double real, double imag) {
    myReal = real;
    myImag = imag;
  }
  
  public double magnitude() {
    return Math.sqrt(myReal * myReal + myImag * myImag);
  }
  
  public String toString() {
    return myReal + "+" + myImag + "i";
  }
}