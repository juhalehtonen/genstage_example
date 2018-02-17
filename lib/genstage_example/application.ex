defmodule GenstageExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(GenstageExample.Producer, [0]),
      worker(GenstageExample.ProducerConsumer, []),
      worker(GenstageExample.Consumer, [], id: 1),
      worker(GenstageExample.Consumer, [], id: 2),
      worker(GenstageExample.Consumer, [], id: 3),
      worker(GenstageExample.Consumer, [], id: 4),
      worker(GenstageExample.Consumer, [], id: 5),
      worker(GenstageExample.Consumer, [], id: 6),
      worker(GenstageExample.Consumer, [], id: 7),
      worker(GenstageExample.Consumer, [], id: 8),
      worker(GenstageExample.Consumer, [], id: 9),
      worker(GenstageExample.Consumer, [], id: 10)
    ]

    opts = [strategy: :one_for_one, name: GenstageExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
