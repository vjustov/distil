# Let's try to finish the different tipes in this ecercise so we can move on to diactually codingo something in the next one.

# Coming back to strings and encoding
# Since we have code points like ł assigned to the number 322, we actually need more than one byte to represent it.
string = "hełło"
byte_size string      # => 7 
String.length string  # => 5

# You can see the code point value of a character by prepending ? to it.
?a # => 97 
?ł # => 322

# You can also use String.codepoints/1 to split a string in its code points:
String.codepoints("hełło") # => ["h", "e", "ł", "ł", "o"]

# Binaries

<<0, 1, 2, 3>> # These are a type we are not used to seing in ruby.

#Giving that the strings are binaries under the mat we ight think they are sort of interchangeable.
String.valid?(<<239, 191, 191>>) # => false

# The string concatenation operation is actually a binary concatenation operator:

<<255>> # => <<255>>
<<256>> # truncated # => <<0>>
<<256 :: size(16)>> # use 16 bits (2 bytes) to store the number # => <<1, 0>>
<<256 :: utf8>> # the number is a code point # => "Ā"
<<256 :: utf8, 0>> # => <<196, 128, 0>>

<<1 :: size(1)>> # => <<1::size(1)>>
<<2 :: size(1)>> # truncated # => <<0::size(1)>>
is_binary(<< 1 :: size(1)>>) # => false
is_bitstring(<< 1 :: size(1)>>) # => true
bit_size(<< 1 :: size(1)>>) # => 1

<<0, 1, x :: binary>> = <<0, 1, 2, 3>>
x # => <<2, 3>>

"he" <> rest = "hello"
rest # => "llo"

# Char lists

# A char list is nothing more than a list of characters:

'hełło'         # => [104, 101, 322, 322, 111]
is_list 'hełło' # => true
'hello'         # => 'hello'

# You can see that, instead of containing bytes, a char list contains the code points of the characters between single-quotes (note that iex will only output code points if any of the chars is outside the ASCII range). So while double-quotes represent a string (i.e. a binary), single-quotes represents a char list (i.e. a list).

# In practice, char lists are used mostly when interfacing with Erlang, in particular old libraries that do not accept binaries as arguments. You can convert a char list to a string and back by using the to_string/1 and to_char_list/1 functions:

to_char_list "hełło" # => [104, 101, 322, 322, 111]
to_string 'hełło'    # => "hełło"
to_string :hello     # => "hello"
to_string 1          # => "1"
# Note that those functions are polymorphic. They not only convert char lists to strings, but also integers to strings, atoms to strings, and so on.

# The good parts start now Keywords, maps and dicts

# And last but not least Anonymous functions

# Functions are delimited by the keywords fn and end:
# Functions are "first class citizens" in Elixir meaning they can be passed as arguments to other functions just as integers and strings can. Basically the same as a proc or lambda

# Note a dot (.) between the variable and parenthesis is required to invoke an anonymous function.

add_two = fn a -> add.(a, 2) end
add_two.(2) # => 4

