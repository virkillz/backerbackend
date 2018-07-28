defmodule Backerbackend.Account.Backer do
  use Ecto.Schema
  import Ecto.Changeset


  schema "backer" do
    field :address, :string
    field :avatar, :string
    field :background_img, :string
    field :bio, :string
    field :display_name, :string
    field :email, :string
    field :metadata1, :string
    field :metadata2, :string
    field :password_hash, :string
    field :privkey, :string
    field :pubkey, :string
    field :tokenfb, :string
    field :username, :string

    timestamps()
  end


  @doc false
  def changesetnew(backer, attrs) do
    backer
    |> cast(attrs, [:username, :display_name, :address, :pubkey, :privkey, :password_hash, :bio, :avatar, :background_img, :email, :tokenfb, :metadata1, :metadata2])
    |> validate_required([:username, :email])
    |> validate_provider
    |> unique_constraint(:username, unique: :backer_username_index)
    |> unique_constraint(:email, unique: :backer_email_index)
  end

  @doc false
  def changeset(backer, attrs) do
    backer
    |> cast(attrs, [:username, :display_name, :address, :pubkey, :privkey, :password_hash, :bio, :avatar, :background_img, :email, :tokenfb, :metadata1, :metadata2])
    |> validate_required([:username, :email])
  end

  def validate_provider(changeset) do 
    uname = get_field(changeset, :username)
    if Regex.match?(~r/^[0-9A-Za-z]+$/, uname) do
      changeset
    else
      add_error(changeset, :username, "Username only can consisted of alphanumeric character")
    end
  end


end
