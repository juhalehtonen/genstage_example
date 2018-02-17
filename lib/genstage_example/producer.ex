defmodule GenstageExample.Producer do
  use GenStage

  @moduledoc """
  Will emit items starting from 0
  """

  def start_link(initial \\ 0) do
    GenStage.start_link(__MODULE__, initial, name: __MODULE__)
  end

  def init(counter), do: {:producer, counter}

  @doc """
  If the state is 3 and we ask for 2 items, we will emit the items 3 and 4,
  and set the state to 5.
  """
  def handle_demand(demand, state) do
    events = Enum.to_list(state..(state + demand - 1))
    {:noreply, events, state + demand}
  end
end
