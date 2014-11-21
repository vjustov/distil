# Let's try to finish the different types in this exercise so we can move on to actually coding something in the next one.

# So coming back to strings and encoding

# We noticed that we can have letters with tildes and accents, but how does that translate to code?
# We have each character map to a diferent byte value, and that is called a code point.
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

<<0, 1, 2, 3>> # These are a type we are not used to seeing in ruby.

# Giving that the strings are binaries under the mat we might think they are sort of interchangeable.
# That is not true.
String.valid?(<<239, 191, 191>>) # => false

# The string concatenation operation is actually a binary concatenation operator:
<<0, 1>> <> <<2, 3>> #=> <<0, 1, 2, 3>>

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

'hełło' # => [104, 101, 322, 322, 111]
is_list 'hełło' # => true
'hello' # => 'hello'

# You can see that, instead of containing bytes, a char list contains the code points of the characters between the single-quotes (note that it'll only output code points if any of the chars is outside the ASCII range). So while double-quotes represent a string (i.e. a binary), single-quotes represents a char list (i.e. a list). # =>

to_char_list "hełło" # => [104, 101, 322, 322, 111]
to_string 'hełło' # => "hełło"
to_string :hello # => "hello"
to_string 1 # => "1"

# The good parts start now Keywords, maps and dicts

# In Elixir, when we have a list of tuples and the first item of the tuple (i.e. the key) is an atom, we call it a keyword list:
# Elixir supports a special syntax for defining such lists, and underneath they just map to a list of tuples. Since they are simply lists, all operations available to lists, including their performance characteristics, also apply to keyword lists.

list = [{:a, 1}, {:b, 2}] # => [a: 1, b: 2]
list == [a: 1, b: 2] # => true
list[:a] # => 1

list ++ [c: 3] # => [a: 1, b: 2, c: 3]
[a: 0] ++ list # => [a: 0, a: 1, b: 2]

# They keep the keys ordered, as specified by the developer.
# They allow a key to be given more than once.

# In order to manipulate keyword lists, Elixir provides the Keyword module. Remember though keyword lists are simply lists, and as such they provide the same linear performance characteristics as lists
# However this is rarely done in practice since pattern matching on lists require the number of items and their order to match.

# Maps

# These are the ruby hashes
map = %{:a => 1, 2 => :b} # => %{2 => :b, :a => 1}
map[:a] # => 1
map[2] # => :b

# Compared to keyword lists, we can already see two differences:

# Maps allow any value as a key.
# Maps keys do not follow any ordering.

# If you pass duplicate keys when creating a map, the last one wins:
%{1 => 1, 1 => 2} # => %{1 => 2}

# A map matches as long as the given keys exist in the given map. Therefore, an empty map matches all maps.

map = %{:a => 1, 2 => :b} # => %{:a => 1, 2 => :b}
map.a # => 1
%{map | :a => 2} # => %{:a => 2, 2 => :b}
%{map | :c => 3} # => ** (ArgumentError) argument error

# Both access and update syntaxes above require the given keys to exist.
# Manipulating maps is done via the Map module, it provides a very similar API to the Keyword module. This is because both modules implement the Dict behaviour.
# And last but not least Anonymous functions

# Functions are delimited by the keywords fn and end:
# Functions are "first class citizens" in Elixir meaning they can be passed as arguments to other functions just as integers and strings can. Basically the same as a proc or lambda

# Note a dot (.) between the variable and parenthesis is required to invoke an anonymous function.

add_two = fn a -> add.(a, 2) end
add_two.(2) # => 4
