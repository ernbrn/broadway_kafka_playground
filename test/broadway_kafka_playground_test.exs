defmodule BroadwayKafkaPlaygroundTest do
  use ExUnit.Case
  doctest BroadwayKafkaPlayground

  test "greets the world" do
    assert BroadwayKafkaPlayground.hello() == :world
  end
end
