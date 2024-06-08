$str = q^A string with \^\^ delimiter ^;
$str1 = q{A string with q delimiter };
$str2 = 'A string with \'\' delimiter';
$str3 = "A string with \"\" delimiter";
$str4 = qq{A string with qq delimiter };


print $str , "\n";
print $str1 , "\n";
print $str2 , "\n";
print $str3 , "\n";
print $str4 , "\n";

$foo = 'hello world';
$foo2 = 'HELLO WORLD';

print uc($foo), "\n"; # convert string to upper case
print lc($foo2), "\n"; # convert string to lower case

$my_str = '!lrep gninraeL';
 
# Display reversed string
$print = reverse($my_str);
print $print;

$str = "The occurence of hay is hay at position:";

print $str . index($str, "hay")."\n"; 

$foo = "Hello world";

@arr = split("",$foo);
print $arr[6]; # returns w
print "\n";

print substr($foo, 6, 5); # returns 'world'

=POD
perl strings.pl
A string with ^^ delimiter 
A string with q delimiter 
A string with '' delimiter
A string with "" delimiter
A string with qq delimiter 
HELLO WORLD
hello world
Learning perl!The occurence of hay is hay at position:17
w
world%                           
=cut
