# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Ubax.Repo.insert!(%Ubax.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# mix ecto.reset
# SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = 'ubax_dev';

alias Ubax.{Repo, User, Event}

Repo.insert!(%User{city: "Beijing", company: "CX", gender: "Male"})

Repo.insert!(%User{city: "Shanghai", company: "CX", gender: "Male"})

Repo.insert!(%Event{event: "Working", user_id: 1})

Repo.insert!(%Event{event: "Working", user_id: 2})
