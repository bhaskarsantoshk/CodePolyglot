@intarray = (1, 2, 3); # An array of integers
print "@intarray \n";

@floatarray = (1.123, 2.356, 19.76); # An array of floats
print "@floatarray \n";

@chararray = ('a', 'b','c'); # An array of characters
print "@chararray \n";

@mixed = (1, 2, 3, 'a', 'b', 'c'); #contains both characters and numbers
print "@mixed";

=POD
output:

1 2 3 
1.123 2.356 19.76 
a b c 
1 2 3 a b c%   

=cut
