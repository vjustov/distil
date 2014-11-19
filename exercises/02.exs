# Now lets talk about basic types.

# atoms
:atom
:"molecule"
:'peroxide'

# Integers
1
809_562_9834      # Underscores are used to style numbers but dont have any meaning.
0x1F              # Hexagesimal
0o777             # Octal
0b1010            # Binary

# Floats
3.14
1.0e-10           # Exponent

# So strings:
"Hi"

"""
Oh, la la!
Comment ça-va, mon cherie?
"""

'Hello'
# Actually this isn't a string this represents a char list, and it seems that they might give me a lot of headaches later.
# Remember the concat function that we used in the last exercise? well turns out that function only works strings and not for charlists.
# so this errors out:
# 'Hello' <> 'world!' # and this doesn't:
'Hello' ++ 'world!'

byte_size("hellö")      # => 6
String.length("hellö")  # => 5
# wait what? yes all strings are encoded in utf8. that causes that the character "ö" takes 2 bytes to be represented.
# lastly we have string interpolation:
"that string's length was: #{String.length("hellö")}"

# in the previous excersice we saw the = operator and thought that it was an assignement operator;
# actually it is not.

x = "this ain't true"
"this ain't true" = x
# as you can see it returns something this is because it is making an assertion that
# the string is the same as the value of the variable. but why didnt that happen at the first try you may ask?
# it sees that the x variable is unbound, so it binds it and then makes the assertion. this only works when the variable is on the right side of the operator, so this would fail:
# 13 = y

# Because of that we can use this operator to match against all types of data
# {a,2,b} = {1,3,4} # This will error out because we are specifing that we want to match against a tuple that has 2 as the second element

# Also variables in Elixir can be rebound:
x = 1
x = 2

# Although there are some cases when you just want to match against the value of x:
^x = 2



