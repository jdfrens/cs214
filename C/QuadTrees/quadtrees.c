#include <stdlib.h>
#include "quadtrees.h"

struct quadnode one;

int main(int argc, char** argv) {
  struct quadnode two;
  struct quadnode *three;
  struct quadnode *four;
  struct quadnode *matrix;

  one.quadtype = SCALAR;
  one.scalar = 1.0;

  two.quadtype = SCALAR;
  two.scalar = 2.0;

  three = (struct quadnode*) malloc(sizeof(struct quadnode));
  three->quadtype = SCALAR;
  three->scalar = 3.0;

  four = (struct quadnode*) malloc(sizeof(struct quadnode));
  four->quadtype = SCALAR;
  four->scalar = 4.0;

  matrix = (struct quadnode*) malloc(sizeof(struct quadnode));
  matrix->quadtype = QUAD;
  matrix->nw = &one;
  matrix->ne = &two;
  matrix->sw = three;
  matrix->se = four;

  free(three);
  free(four);
  free(matrix);
}
