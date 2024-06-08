# Initialize an array of numbers
@numbers = (1, 2, 3, 4, 5);

# For loop: Print each number squared
print "For loop:\n";
for (my $i = 0; $i < @numbers; $i++) {
    print "$numbers[$i] squared is " . ($numbers[$i] ** 2) . "\n";
}

# Foreach loop: Print each number cubed
print "\nForeach loop:\n";
foreach my $num (@numbers) {
    print "$num cubed is " . ($num ** 3) . "\n";
}

# While loop: Print the sum of the numbers
print "\nWhile loop:\n";
my $sum = 0;
my $index = 0;
while ($index < @numbers) {
    $sum += $numbers[$index];
    $index++;
}
print "Sum of numbers is $sum\n";

# Do-while loop: Print each number doubled
print "\nDo-while loop:\n";
my $index2 = 0;
do {
    print "$numbers[$index2] doubled is " . ($numbers[$index2] * 2) . "\n";
    $index2++;
} while ($index2 < @numbers);

# Until loop: Print each number halved
print "\nUntil loop:\n";
my $index3 = 0;
until ($index3 >= @numbers) {
    print "$numbers[$index3] halved is " . ($numbers[$index3] / 2) . "\n";
    $index3++;
}
