list = [1, 2, 3]  # Elixir uses square brackets to specify a list of values. Values can be of any type.
tuple = {1, 2, 3}  # A tuple on the other hand stores its values continously on memory.

# We can access a tuple element with the elem/2 function:
elem(tuple, 0) #=> 1

# Due to the recursive nature of the list it's elements have to be acsessed differently.
hd(list) # => 1  # returns the first element of the list and
tl(list) # => [2, 3] # returns the rest of the list.

# Why do we need two representations of the same thing? i dont really know yet.
# but im hoping we will find out soon enough.

# The pin operator
x = 1
# ^x = 2 # Will fail because the value of x is one.
{x, ^x} = {2, 1} # Will match because he will rebind the x, and match the value of x in the context before the assignement.

# In some cases, you don't care about a particular value in a pattern. It is a common practice to bind those values to the underscore, _. For example, if only the head of the list matters to us, we can assign the tail to underscore:
[h | _] = [1, 2, 3]

# Flow control

# Elixir also provides the macros if/2 and unless/2 which are useful when you need to check for just one condition:
if true do
  "This works!"
end

unless true do
  "This will never be seen"
end

# As usual these suport else blocks, but we know how to use those.
# we also have at our disposal the constructs cond and case.
# cond is the equivalent of a bunch of if else chained together and works by running the first one that evaluates to true.
cond do
  2 + 2 == 5 ->
    "This will not be true"
  2 * 2 == 3 ->
    "Nor this"
  1 + 1 == 2 ->
    "But this will"
end

# Case on the other hand works by pattern matching the values to the matching one.
case {1, 2, 3} do
  {4, 5, 6} ->
    "This clause won't match"
  {1, x, 3} ->
    "This clause will match and bind x to 2 in this clause"
  _ ->
    "This clause would match any value"
end

# At this point, we have learned four control structures: case, cond, if and unless, and they were all wrapped in do/end blocks. It happens we could also write if as follows:
if true, do: 1 + 2
if false, do: :this, else: :that # We say the syntax is using keyword lists. We can pass else using this syntax.
# Keyword lists play an important role in the language and are quite common in many functions and macros.
