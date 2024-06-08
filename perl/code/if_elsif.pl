$age = 25;  # Change the value of age to see other results

if ($age > 120) {  # If age is greater than 120
    print "Error: the age is unrealistic!\n";
}
elsif ($age < 0) {  # Else if age is less than 0
    print "Error: the age cannot be negative!\n";
}
elsif ($age >= 65) {  # Else if age is greater or equal to 65
    print "Senior Citizen\n";
}
elsif ($age >= 18) {  # Else if age is greater or equal to 18
    print "Adult\n";
}
elsif ($age >= 13) {  # Else if age is greater or equal to 13
    print "Teenager\n";
}
else {  # If none above, then age must be between 0 and 12
    print "Child\n";
}
