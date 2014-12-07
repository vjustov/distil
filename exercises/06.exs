# For this excersise you must make all these tests pass.

ExUnit.start

defmodule Exercise06Test do
  use ExUnit.Case, async: true

  test "It calculates the area of a rectangle" do
    assert Geom.area(:rectangle, 3, 4) = 12
  end
  
  test "It calculates the area of a triangle" do
    assert Geom.area(:triangle, 3, 5) = 7.5
  end
  
  test "It calculates the area of an elipsis" do
    assert Geom.area(:ellipse, 2, 4) = 25.132741228718345
  end

  test "it raises an error with both negative params" do
    assert_raise FunctionClauseError, Geom.area(:rectangle, -3, -4)
  end

  test "it raises an error with one positive and one negative param" do
    assert_raise FunctionClauseError, Geom.area(:rectangle, -3, 4)
  end
end
