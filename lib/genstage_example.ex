defmodule GenstageExample do
  @moduledoc """
  So what is GenStage? From the official documentation, it is a
  “specification and computational flow for Elixir”, but what does that mean?

  What it means is that GenStage provides a way for us to define a pipeline of
  work to be carried out by independent steps (or stages) in separate processes.

  In a sample flow of [A] -> [B] -> [C]:
  A is the producer
  B is the producer-consumer
  C is the consumer

  The GenStage specification recognizes three roles:

  :producer — A source. Producers wait for demand from consumers and respond with the requested events.
  :producer_consumer — Both a source and a sink. Producer-consumers can respond to demand from other consumers as well as request events from producers.
  :consumer — A sink. A consumer requests and receives data from producers.

  Notice that our producers wait for demand? With GenStage our consumers send
  demand upstream and process the data from our producer. This facilitates a
  mechanism known as back-pressure. Back-pressure puts the onus on the producer
  to not over-pressure when consumers are busy.
  """
end
