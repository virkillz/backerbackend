# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Backerbackend.Repo.insert!(%Backerbackend.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Backerbackend.Repo
alias Backerbackend.Account.User

  Repo.insert! %User{
    fullname: "Michael Admin",
    username: "administrator",
    password_hash: "$2b$12$8As.fIX4fQsbZuhcIhKr7OU3fqxaaPsfYuFZ/S6fUEDd2HDkzN.Tu",
    avatar: "/images/default.png"
  }