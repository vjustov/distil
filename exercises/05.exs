# For the rest of the exercises we are gonna use tests to explore the different concepts of elixir and functional programming.
# So here we will introduce ExUnit the testing librery of elixir.

# I dont really get why but we must start ExUnit.
# This would normally go into a helper class because it is common of every test file in our project.
ExUnit.start

# Create a new test module (test case) and use [`ExUnit.Case`](ExUnit.Case.html).
defmodule AssertionTest do
  # By passing `async: true`, Ex unit runs the tests cases
  # concurrently with other test cases.
  use ExUnit.Case, async: true

  # A tag can be set for all tests in a module by setting @moduletag:
  @moduletag :external

  setup do # Works as a before block, sort of.
    {:ok, [pid: 1]}
  end

  # ExUnit uses the `test` macro instead the it that we have seen on ruby.
  test "the truth" do
    assert true == :true
  end

  @tag cd: "false"
  test "reads utf-8 fixtures" do
    refute true == false
  end

  # Now its your turn, make sure these tests pass
  test "It knows how to sum" do
    assert 2+1 = 4
  end

  test "It knows how to make phrases" do
    refute "Hello" <> "World" != "Hello World"
  end
end
