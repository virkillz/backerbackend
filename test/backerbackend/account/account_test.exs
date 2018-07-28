defmodule Backerbackend.AccountTest do
  use Backerbackend.DataCase

  alias Backerbackend.Account

  describe "user" do
    alias Backerbackend.Account.User

    @valid_attrs %{avatar: "some avatar", bio: "some bio", email: "some email", fullname: "some fullname", is_active: true, location: "some location", mobile: "some mobile", password: "some password", password_hash: "some password_hash", role: "some role", username: "some username"}
    @update_attrs %{avatar: "some updated avatar", bio: "some updated bio", email: "some updated email", fullname: "some updated fullname", is_active: false, location: "some updated location", mobile: "some updated mobile", password: "some updated password", password_hash: "some updated password_hash", role: "some updated role", username: "some updated username"}
    @invalid_attrs %{avatar: nil, bio: nil, email: nil, fullname: nil, is_active: nil, location: nil, mobile: nil, password: nil, password_hash: nil, role: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_user()

      user
    end

    test "list_user/0 returns all user" do
      user = user_fixture()
      assert Account.list_user() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Account.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Account.create_user(@valid_attrs)
      assert user.avatar == "some avatar"
      assert user.bio == "some bio"
      assert user.email == "some email"
      assert user.fullname == "some fullname"
      assert user.is_active == true
      assert user.location == "some location"
      assert user.mobile == "some mobile"
      assert user.password == "some password"
      assert user.password_hash == "some password_hash"
      assert user.role == "some role"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Account.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.avatar == "some updated avatar"
      assert user.bio == "some updated bio"
      assert user.email == "some updated email"
      assert user.fullname == "some updated fullname"
      assert user.is_active == false
      assert user.location == "some updated location"
      assert user.mobile == "some updated mobile"
      assert user.password == "some updated password"
      assert user.password_hash == "some updated password_hash"
      assert user.role == "some updated role"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_user(user, @invalid_attrs)
      assert user == Account.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Account.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Account.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Account.change_user(user)
    end
  end

  describe "backer" do
    alias Backerbackend.Account.Backer

    @valid_attrs %{address: "some address", avatar: "some avatar", background_img: "some background_img", bio: "some bio", display_name: "some display_name", email: "some email", metadata1: "some metadata1", metadata2: "some metadata2", password_hash: "some password_hash", privkey: "some privkey", pubkey: "some pubkey", tokenfb: "some tokenfb", username: "some username"}
    @update_attrs %{address: "some updated address", avatar: "some updated avatar", background_img: "some updated background_img", bio: "some updated bio", display_name: "some updated display_name", email: "some updated email", metadata1: "some updated metadata1", metadata2: "some updated metadata2", password_hash: "some updated password_hash", privkey: "some updated privkey", pubkey: "some updated pubkey", tokenfb: "some updated tokenfb", username: "some updated username"}
    @invalid_attrs %{address: nil, avatar: nil, background_img: nil, bio: nil, display_name: nil, email: nil, metadata1: nil, metadata2: nil, password_hash: nil, privkey: nil, pubkey: nil, tokenfb: nil, username: nil}

    def backer_fixture(attrs \\ %{}) do
      {:ok, backer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_backer()

      backer
    end

    test "list_backer/0 returns all backer" do
      backer = backer_fixture()
      assert Account.list_backer() == [backer]
    end

    test "get_backer!/1 returns the backer with given id" do
      backer = backer_fixture()
      assert Account.get_backer!(backer.id) == backer
    end

    test "create_backer/1 with valid data creates a backer" do
      assert {:ok, %Backer{} = backer} = Account.create_backer(@valid_attrs)
      assert backer.address == "some address"
      assert backer.avatar == "some avatar"
      assert backer.background_img == "some background_img"
      assert backer.bio == "some bio"
      assert backer.display_name == "some display_name"
      assert backer.email == "some email"
      assert backer.metadata1 == "some metadata1"
      assert backer.metadata2 == "some metadata2"
      assert backer.password_hash == "some password_hash"
      assert backer.privkey == "some privkey"
      assert backer.pubkey == "some pubkey"
      assert backer.tokenfb == "some tokenfb"
      assert backer.username == "some username"
    end

    test "create_backer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_backer(@invalid_attrs)
    end

    test "update_backer/2 with valid data updates the backer" do
      backer = backer_fixture()
      assert {:ok, backer} = Account.update_backer(backer, @update_attrs)
      assert %Backer{} = backer
      assert backer.address == "some updated address"
      assert backer.avatar == "some updated avatar"
      assert backer.background_img == "some updated background_img"
      assert backer.bio == "some updated bio"
      assert backer.display_name == "some updated display_name"
      assert backer.email == "some updated email"
      assert backer.metadata1 == "some updated metadata1"
      assert backer.metadata2 == "some updated metadata2"
      assert backer.password_hash == "some updated password_hash"
      assert backer.privkey == "some updated privkey"
      assert backer.pubkey == "some updated pubkey"
      assert backer.tokenfb == "some updated tokenfb"
      assert backer.username == "some updated username"
    end

    test "update_backer/2 with invalid data returns error changeset" do
      backer = backer_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_backer(backer, @invalid_attrs)
      assert backer == Account.get_backer!(backer.id)
    end

    test "delete_backer/1 deletes the backer" do
      backer = backer_fixture()
      assert {:ok, %Backer{}} = Account.delete_backer(backer)
      assert_raise Ecto.NoResultsError, fn -> Account.get_backer!(backer.id) end
    end

    test "change_backer/1 returns a backer changeset" do
      backer = backer_fixture()
      assert %Ecto.Changeset{} = Account.change_backer(backer)
    end
  end
end
