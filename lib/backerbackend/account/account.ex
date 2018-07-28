defmodule Backerbackend.Account do
  @moduledoc """
  The Account context.
  """

  import Ecto.Query, warn: false
  alias Backerbackend.Repo

  alias Backerbackend.Account.User
  alias Comeonin.Bcrypt

  @doc """
  Returns the list of user.

  ## Examples

      iex> list_user()
      [%User{}, ...]

  """
  def list_user do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
    def create_user(attrs \\ %{}) do
    %User{}
    |> User.registration_changeset(attrs)
    |> Repo.insert()
  end




  def authenticate_user(username, plain_text_password) do
    query = from u in User, where: u.username == ^username
    Repo.one(query)
    |> check_password(plain_text_password)
  end


  defp check_password(nil, _), do: {:error, "The username can't be found"}

  defp check_password(user, plain_text_password) do
    IO.inspect(plain_text_password)
    case Bcrypt.checkpw(plain_text_password, user.password_hash) do
      true -> {:ok, user}
      false -> {:error, "Incorrect username or password"}
    end
  end


  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias Backerbackend.Account.Backer

  @doc """
  Returns the list of backer.

  ## Examples

      iex> list_backer()
      [%Backer{}, ...]

  """
  def list_backer do
    Repo.all(Backer)
  end

  @doc """
  Gets a single backer.

  Raises `Ecto.NoResultsError` if the Backer does not exist.

  ## Examples

      iex> get_backer!(123)
      %Backer{}

      iex> get_backer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_backer!(id), do: Repo.get!(Backer, id)

  @doc """
  Creates a backer.

  ## Examples

      iex> create_backer(%{field: value})
      {:ok, %Backer{}}

      iex> create_backer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_backer(attrs \\ %{}) do
    %Backer{}
    |> Backer.changesetnew(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a backer.

  ## Examples

      iex> update_backer(backer, %{field: new_value})
      {:ok, %Backer{}}

      iex> update_backer(backer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_backer(%Backer{} = backer, attrs) do
    backer
    |> Backer.changesetnew(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Backer.

  ## Examples

      iex> delete_backer(backer)
      {:ok, %Backer{}}

      iex> delete_backer(backer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_backer(%Backer{} = backer) do
    Repo.delete(backer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking backer changes.

  ## Examples

      iex> change_backer(backer)
      %Ecto.Changeset{source: %Backer{}}

  """
  def change_backer(%Backer{} = backer) do
    Backer.changeset(backer, %{})
  end
end
