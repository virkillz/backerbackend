defmodule BackerbackendWeb.BackerController do
  use BackerbackendWeb, :controller

  alias Backerbackend.Account
  alias Backerbackend.Account.Backer

  def index(conn, _params) do
    backer = Account.list_backer()
    render(conn, "index.html", backer: backer)
  end

  def new(conn, _params) do
    changeset = Account.change_backer(%Backer{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"backer" => backer_params}) do

    password = backer_params["password"]
    repassword = backer_params["repassword"]

    if password == "" do
      conn 
      |> put_flash(:error, "Password cannot be empty")
      |> redirect(to: backer_path(conn, :new))
    else
      if password != repassword do
        conn 
          |> put_flash(:error, "Password not match")
          |> redirect(to: backer_path(conn, :new))
      else
        case Account.create_backer(backer_params) do
          {:ok, backer} ->
            conn
            |> put_flash(:info, "Backer created successfully.")
            |> redirect(to: backer_path(conn, :show, backer))
          {:error, %Ecto.Changeset{} = changeset} ->
            render(conn, "new.html", changeset: changeset)
        end
      end
    end
  end

  def show(conn, %{"id" => id}) do
    backer = Account.get_backer!(id)
    render(conn, "show.html", backer: backer)
  end

  def edit(conn, %{"id" => id}) do
    backer = Account.get_backer!(id)
    changeset = Account.change_backer(backer)
    render(conn, "edit.html", backer: backer, changeset: changeset)
  end

  def update(conn, %{"id" => id, "backer" => backer_params}) do
    backer = Account.get_backer!(id)

    case Account.update_backer(backer, backer_params) do
      {:ok, backer} ->
        conn
        |> put_flash(:info, "Backer updated successfully.")
        |> redirect(to: backer_path(conn, :show, backer))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", backer: backer, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    backer = Account.get_backer!(id)
    {:ok, _backer} = Account.delete_backer(backer)

    conn
    |> put_flash(:info, "Backer deleted successfully.")
    |> redirect(to: backer_path(conn, :index))
  end
end
