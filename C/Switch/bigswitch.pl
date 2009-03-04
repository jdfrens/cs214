#!/usr/bin/perl -s

$cases = 2000;
print "#include <stdio.h>\n";
print "#include \"mytime.h\"\n";
print "#include \"dontignore.h\"\n";

print "float SwitchFunction (int val) {\n";
print "  switch (val) {\n";
for ($i = 0; $i < $cases; $i++) {
    print "  case $i: return $i.$i;\n";
}
print "  default: return $cases.$cases;\n";
print "  }\n";
print "}\n";

print "float MultibranchFunction (int val) {\n";
print "  if (val == 0)\n";
print "    return 0.0;\n";
for ($i = 1; $i < $cases; $i++) {
    print "  else if (val == $i)\n";
    print "    return $i.$i;\n";
}
print "  else\n";
print "    return $cases.$cases;\n";
print "}\n";

$iters = 50000000;
print "int main (int argc, char* argv[]) {\n";

print "  register int c, i, incr;\n";
print "  register double start, end;\n";
print "  if (argc != 2) return -1;\n";
print "  float values[$cases];\n";
print "  incr = atoi(argv[1]);\n";

print "  for (c = 0; c <= $cases; c += incr) {\n";
print "    start = mytime();\n";
print "    for (i = 0; i < $iters; i++) {\n";
print "      values[c] = SwitchFunction(c);\n";
print "    }\n";
print "    end = mytime();\n";
print "    dontIgnoreMe(values);\n";
print "    printf (\"switch function on %d: %f\\n\", c, end - start);\n";
print "  }\n";

print "  for (c = 0; c <= $cases; c += incr) {\n";
print "    start = mytime();\n";
print "    for (i = 0; i < $iters; i++) {\n";
print "      values[c] = MultibranchFunction(c);\n";
print "    }\n";
print "    end = mytime();\n";
print "    dontIgnoreMe(values);\n";
print "    printf (\"multibranch function on %d: %f\\n\", c, end - start);\n";
print "  }\n";

print "}\n";


