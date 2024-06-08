no warnings 'experimental::smartmatch';

use feature 'switch';

$fruit = "apple";  # Change the value of fruit to see other results

given ($fruit) {
    when ("apple") { print "This is an apple.\n"; }
    when ("banana") { print "This is a banana.\n"; }
    when ("orange") { print "This is an orange.\n"; }
    when ("grape") { print "This is a grape.\n"; }
    default { print "Unknown fruit.\n"; }
}
