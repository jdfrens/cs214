public class Komplex {
  private double myReal;
  private double myImag;
  
  public Komplex(double real, double imag) {
    myReal = real;
    myImag = imag;
  }
  
  public double magnitude() {
    return Math.sqrt(myReal * myReal + myImag * myImag);
  }
}