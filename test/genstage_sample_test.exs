defmodule GenstageExampleTest do
  use ExUnit.Case
  doctest GenstageSample

  test "greets the world" do
    assert GenstageSample.hello() == :world
  end
end
