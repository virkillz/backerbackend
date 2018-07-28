defmodule Backerbackend.Repo.Migrations.CreateBacker do
  use Ecto.Migration

  def change do
    create table(:backer) do
      add :username, :string
      add :display_name, :string
      add :address, :string
      add :pubkey, :string
      add :privkey, :string
      add :password_hash, :string
      add :bio, :text
      add :avatar, :string
      add :background_img, :string
      add :email, :string
      add :tokenfb, :string
      add :metadata1, :string
      add :metadata2, :text

      timestamps()
    end

    create unique_index(:backer, [:username])
    create unique_index(:backer, [:address])
    create unique_index(:backer, [:email])
  end
end
