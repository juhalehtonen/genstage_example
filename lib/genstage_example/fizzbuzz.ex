defmodule GenstageExample.FizzBuzz do
  @doc """
  Perform FizzBuzz check against a given integer.
  """
  def do_fizzbuzz(int) do
    which({rem(int, 3), rem(int, 5), int})
  end

  @doc """
  Determine FizzBuzz by pattern matching on the given three-element tuple in the
  form of {divby3?, divby5?, num}.
  """
  def which(fb) do
    case fb do
      {0, 0, _n} -> "FizzBuzz"
      {0, _, _n} -> "Fizz"
      {_, 0, _n} -> "Buzz"
      {_, _, n} -> n
    end
  end

  @doc """
  Is given integer something that should return FizzBuzz?
  """
  def is_fizzbuzz?(int) do
    case do_fizzbuzz(int) do
      "FizzBuzz" -> true
      _ -> false
    end
  end
end
