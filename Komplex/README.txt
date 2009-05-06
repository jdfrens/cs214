I'm calling these things "komplex numbers" so that I can't possibly trample
on existing implementations.

The C code is here just as a reference and to show that YOU as the programmer
have to know and appreciate and handle the different types of komplex
numbers.

I have tried to make the OO implementations as transliterated as possible.
I'm quite sure I've achieved this, but let me know if something doesn't
quite match.

For the polar-coordinate version, the to-string methods use this format:

  r cis phi

which is an abbreviation of the full trig representation: 

  r (cos phi + i sin phi)
