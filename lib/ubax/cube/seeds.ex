defmodule Ubax.Cube.Seeds do
  alias Ubax.{Event, Repo}

  def run() do
    Repo.insert!(%Event{name: "working", user_id: 1})
    Repo.insert!(%Event{name: "talking", user_id: 2})
    :ok
  end

  def clear() do
    :ok
  end
end
