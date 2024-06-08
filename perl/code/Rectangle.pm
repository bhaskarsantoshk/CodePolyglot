package Rectangle;   # class name

# Constructor method to create a new Rectangle object
sub new {
    my $class = shift;  # First argument is the class name
    my $self = {
        _width => shift,  # Second argument is the width of the rectangle
        _height => shift, # Third argument is the height of the rectangle
    };

    # Print all the values just for clarification
    print "Width is $self->{_width}\n";
    print "Height is $self->{_height}\n";
    
    # Bless the hash reference to turn it into an object of the class
    bless $self, $class;
    
    # Return the newly created object
    return $self;
}

# Method to calculate the area of the rectangle
sub area {
    my ($self) = @_;  # The first argument is the object itself
    return $self->{_width} * $self->{_height};  # Calculate and return the area
}

1;  # End the package definition

# Create a new Rectangle object with width 4 and height 5
$object = new Rectangle(4, 5);

# Print the area of the rectangle using the area method
print "Area of Rectangle: " . $object->area();
