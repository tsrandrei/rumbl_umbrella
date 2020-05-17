defmodule Rumbl.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Rumbl.Repo,
      # Start a worker by calling: Rumbl.Worker.start_link(arg)
      # {Rumbl.Worker, arg}
      # {Rumbl.ResetDB, []}
      # worker(Rumbl.Periodically, [])
    ]

    opts = [strategy: :one_for_one, name: Rumbl.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
