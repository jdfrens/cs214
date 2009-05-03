public class KomplexPR implements Komplex {
  private double myPhi;
  private double myR;
  
  public KomplexPR(double phi, double r) {
    myPhi = phi;
    myR = r;
  }
  
  public double magnitude() {
    return myR;
  }
  
  public String toString() {
    return myR + " cis " + myPhi;
  }
}