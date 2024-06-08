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
