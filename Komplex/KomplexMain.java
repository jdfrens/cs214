class KomplexMain {
  public static void reportMagnitude(Komplex komplex) {
    System.out.println("|" + komplex + "| = " + komplex.magnitude());
  }

  public static void main(String[] args) {
    reportMagnitude(new KomplexRI(0.0, 0.0));
    reportMagnitude(new KomplexRI(5.0, 2.0));

    reportMagnitude(new KomplexPR(0.0, 0.0));
    reportMagnitude(new KomplexPR(0.75 * 3.14159, 1.5));    
  }
}