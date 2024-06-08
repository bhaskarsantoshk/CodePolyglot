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

@fruits = ('Grapes', 'Apple', 'Banana' );

print "@fruits"; # Grapes Apple Banana

@integers = ( 0 .. 9);   # print from 0 to 9
@alphabets = (A .. Z);  # print form A to Z (Upper case)

print "@integers\n";
print "@alphabets";

@alphabets = (A .. F);

print "Original: @alphabets \n";
push (@alphabets, 'G');   # add G to the last index array

print "Pushing G in the array: @alphabets\n";

pop (@alphabets);   # removing last element of array

print "Removing last element from array: @alphabets\n";
pop (@alphabets);   # removing last element of array

print "Removing last element from array: @alphabets\n\n";

@alphabets = (a .. f);

print "Original: @alphabets \n";
shift (@alphabets);   # removing first element of the array

print "Removing first element from an array: @alphabets\n";

unshift (@alphabets, 'a');   # adding last element of the array

print "Adding first element to an array: @alphabets";

@fruits = ("Orange", "Grapefruit", "Lemon");#initializing associative array
print "Length of fruits array is " . scalar(@fruits);

@fruits = ("Orange", "Grapefruit", "Lemon");#initializing associative array
print "Maximum index of fruits array is " . $#fruits . "\n";

print $fruits[1];  # accessing first index of fruits array


 #Returns maximum value from Array passed as parameter
  sub Find_Maximum {

  my @list = @_;

  $max = $list[0];

  for ($i = 1; $i <= $#list; $i++) { #iterate over all the array elements

    if ($list[$i] > $max) {                 #check if current element is greater than the already 
      #stored max value
      $max = $list[$i];                     # if yes then update the max value to current element
    }
  }
  return $max;                           #return the maximum value
}#end of Find_Maximum()

@array = (15, 6, 3, 21, 19, 4);
print Find_Maximum (@array);

@myArray = (2, 3);
print("Original: @myArray\n\n");

unshift(@myArray, 0, 1);
print("After adding 0 and 1: @myArray");

=POD
OP:
Original: 2 3

After adding 0 and 1: 0 1 2 3
=cut

@array = (1, 2, 3);
print("Original: @array\n\n");

push(@array, 4); # Pushing 4 at the end of $array
push(@array, 5); # Pushing 5 at the end of $array
print("After adding 4 and 5 at the end: @array"); 


@myArray = (0, 1, 2, 3);
print("Original: @myArray\n\n");

shift(@myArray);
print("After removing 0 from the array: @myArray");

=POD
Original: 0 1 2 3

After removing 0 from the array: 1 2 3
=cut

@myArray = (0, 1, 2, 3);
print("Original: @myArray\n\n");

pop(@myArray); # removing 3 from the end of $array
print("Removing 3 from the end of the array: @myArray"); 


@myArray = (0, 1, 2, 3);
print "@myArray \n";
undef $myArray[1];

print("After removing 1st element from the array: @myArray");

=POD
0 1 2 3 
After removing 1st element from the array: 0  2 3
=cut

#defining and array
@fruits = ('Rasberry', 'Orange', 'Apricot','Banana', 'Apple','Olive' );

@fruits = sort(@fruits); #applying the sort function
print("@fruits"); #printing the sorted array

@numbers = (13, 9, 22, 27, 1, 3, -4, 10);
print "Original: @numbers\n\n";

@sorted_numbers = sort { $a <=> $b } @numbers;

print "After sorting: @sorted_numbers";

