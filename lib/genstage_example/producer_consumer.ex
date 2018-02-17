defmodule GenstageExample.ProducerConsumer do
  use GenStage

  @moduledoc """
  Will receive items from producer and check if they should return FizzBuzz.
  """

  require Integer

  def start_link do
    GenStage.start_link(__MODULE__, :state_doesnt_matter, name: __MODULE__)
  end

  def init(state) do
    {:producer_consumer, state, subscribe_to: [GenstageExample.Producer]}
  end

  def handle_events(events, _from, state) do
    numbers =
      events
      |> Enum.filter(&GenstageExample.FizzBuzz.is_fizzbuzz?/1)

    {:noreply, numbers, state}
  end
end
