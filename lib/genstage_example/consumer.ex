defmodule GenstageExample.Consumer do
  use GenStage

  @moduledoc """
  Receive events from producer_consumer and print them to the terminal.
  """

  def start_link do
    GenStage.start_link(__MODULE__, :state_doesnt_matter)
  end

  def init(state) do
    {:consumer, state, subscribe_to: [GenstageExample.ProducerConsumer]}
  end

  def handle_events(events, _from, state) do
    for event <- events do
      IO.inspect({self(), event})
    end

    # As a consumer we never emit events
    {:noreply, [], state}
  end
end
