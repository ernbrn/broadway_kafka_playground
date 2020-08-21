defmodule BroadwayKafkaPlayground.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: BroadwayKafkaPlayground.Worker.start_link(arg)
      {BroadwayKafkaPlayground.MyBroadway, []},
      {BroadwayKafkaPlayground.MyBroadwayAlso, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BroadwayKafkaPlayground.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
