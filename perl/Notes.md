# Perl
## Syntax
```Perl
print "I'm Batman";
```
```Perl
printf("%s", "I'm Batman");
```
* Every statement in Perl ends with `;` for last statement in a block, the `;` is optional
```
# this is a single line comment
print "Hello World";   # This line prints Hello World
```

```Perl
=POD
this
is a 
multiline 
comment
=cut
```

```Perl
$string = "This is a string.";   # stores string
$int = 5;     # stores an integer
$float = 5.7;    # stores a floating point type value
$char = 'a';    # stores character type value

print $string, "\n";
print "An integer type: ", $int, "\n";
print "A float type: ", $float, "\n";
print "A character type: ", $char, "\n";

print "Hello World!\n";    # \n inserts a new line
print "Hello\tWorld!\n";    # \t adds a tab space 
print "\"Double quotes\"\n";  # use \ to add double quotes
print '\'Single quotes\'';  # use \ to add single quotes

$negative = -3; # negative
$zero = 0; # zero (can also be false, if used as a Boolean
$positive = 123; # positive decimal
$zeroPos = 0123; #0 prefix is used to sepcify octal - octal value = 83 decimal
$hex = 0xAB; #0x prefix is used to specify hexadecimal - hexadecimal value = 171 decimal
$bin = 0b1010; # 0b prefix is used to specify binary - binary value = 10 decimal
print $negative," " ,$zero," " , $positive," " , $zeroPos," " , $hex," " , $bin;

```

* Perl variables need not be declared before adding a value to it.
* Variable Variables : Using Perl, we can access data through dynamic variable names. The name of a variable can be stored in another variable, allowing it to be accessed dynamically.

```Perl
$language = "perl"; # language has value "perl"
$$language = "Larry Wall"; # perl has value "Larry Wall"

print "\$language:\t"; 
print $language; # prints perl
print "\n";

print "\${\$language}:\t";   # using \ as $ is special character
print ${$language}; # prints Larry Wall
print "\n";

print "\$\$language:\t"; 
print $$language; # prints Larry Wall
print "\n";

print "\$perl:\t\t"; 
print $perl; # prints Larry Wall
print "\n";


```

* Space Ship Operator (<=>): The <=> operator is used for numerical comparison in Perl, returning -1, 0, or 1 if the left argument is less than, equal to, or greater than the right argument, respectively.

* cmp Operator: The cmp operator is used for string comparison in Perl, returning -1, 0, or 1 if the left string is less than, equal to, or greater than the right string, respectively.

* For loop: Iterates through the array and prints each number squared.
* Foreach loop: Iterates through the array and prints each number cubed.
* While loop: Calculates and prints the sum of the numbers in the array.
* Do-while loop: Iterates through the array and prints each number doubled.
* The until loop is similar to the while loop, but it continues until the condition becomes true.

* Pass by reference

```Perl
sub swap{ #parameters num1 and num2 passed using pass by value method 

  $temp = $_[0];   #creating a variable temp and setting equal to $_[0]
  $_[0] = $_[1];  #setting the value of $_[0] equal to $_[1]
  $_[1] = $temp;  #setting the value of $_[1] equal to temp which is equal to $_[0]
}

$num1 = 4;
$num2 = 5;

# Have a careful look at this function call
print "num1 is: $num1\n";
print "num2 is: $num2\n";
print "\nAfter swapping\n\n";

swap($num1,$num2);
print "num1 is: $num1\n";
print "num2 is: $num2";
```

* Pass by value
``` Perl
sub swap{ #parameters num1 and num2 passed using pass by value method 
  my $a = @_[0];
  my $b = @_[1];
  
  my $temp = $a;   #creating a variable temp and setting equal to arg2
  $a = @_[1];  #setting the value of arg2 equal to arg1
  $b = $temp;  #setting the value of arg1 equal to temp which is equal to arg2
}

$num1 = 4;
$num2 = 5;

# Have a careful look at this function call
print "num1 is: $num1\n";
print "num2 is: $num2\n";
print "\nAfter swapping\n\n";


swap($num1,$num2);
print "num1 is: $num1\n";
print "num2 is: $num2";
```
* The default usage of the sort() subroutine is to sort the array of strings. If we use it with numbers, then the numbers will be treated as strings.
* Packages are the blueprints of objects. A package is a user-defined data type, which includes local methods/subroutines and local variables.
