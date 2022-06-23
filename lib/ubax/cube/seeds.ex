defmodule Ubax.Cube.Seeds do
  alias Ubax.{Event, Repo}

  def run() do
    Repo.insert!(%Event{event: "working", user_id: 1})
    Repo.insert!(%Event{event: "talking", user_id: 2})
    :ok
  end

  def clear() do
    :ok
  end
end
