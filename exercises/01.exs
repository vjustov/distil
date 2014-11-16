salute = "Hello world!"

IO.puts salute
name = IO.gets "Helloo.. erm, Whats your name again? "

# IO.puts "Hello " + name
# Aha! you thought this was ruby. Well it isn't so that won't work.
# As can see by uncommenting this line, this throws an ArithmeticError "bad argument in arithmetic expression."
# This is due to the fact that + is a purely mathematical operation and just accepts integers and real numbers.

IO.puts "Hello " <>  name
# The string concatenation function is: <>/2
# Whats that weid notation you may say? it simply saying "#{function_name}/#{parameters.length}"

