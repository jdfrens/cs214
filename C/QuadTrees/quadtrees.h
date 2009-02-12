struct quadnode {
  int quadtype;
  double scalar;
  struct quadnode *nw, *ne, *sw, *se;
};

#define SCALAR 0
#define QUAD   1
