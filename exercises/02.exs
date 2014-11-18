# In the previous excersice we saw the = operator and thought that it was an assignement operator;
# actually it is not.

x = "This ain't true"
"This ain't true" = x
# As you can see it returns something this is because it is making an assertion that 
# the string is the same as the value of the variable. But why didnt that happen at the first try you may ask?
# it sees that the x variable is unbound, so it binds it and then makes the assertion. this only works when the variable is on the right side of the operator, so this would fail:
# 13 = y

# Because of that we can use this operator to match against all types of data
{a,2,b} = {1,3,4} # This will error out because we are specifing that we want to match against a tuple that has 2 as the second element

# Now lets talk about basic types.

# atoms
:atom
:"molecule"
:'peroxide'

# Integers
1 
809_562_9834
0x1F

# So strings:
"Hi"

"""
Oh, la la!
Comment ça-va, mon cherie?
"""

'Hello'
# Actually this isn't a string this represent a char list.
# And it seems that they might give me a lot of headaches later.
# Remember the concat function that we used in the last exercise? well turns out that function only works strings and not for charlists.
# so thid errors out:
# 'Hello' <> 'world!' # and this doesn't:
'Hello' ++ 'world!'

# Wait what? yes all strings are encoded in utf8


