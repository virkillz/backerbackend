defmodule BackerbackendWeb.BackerControllerTest do
  use BackerbackendWeb.ConnCase

  alias Backerbackend.Account

  @create_attrs %{address: "some address", avatar: "some avatar", background_img: "some background_img", bio: "some bio", display_name: "some display_name", email: "some email", metadata1: "some metadata1", metadata2: "some metadata2", password_hash: "some password_hash", privkey: "some privkey", pubkey: "some pubkey", tokenfb: "some tokenfb", username: "some username"}
  @update_attrs %{address: "some updated address", avatar: "some updated avatar", background_img: "some updated background_img", bio: "some updated bio", display_name: "some updated display_name", email: "some updated email", metadata1: "some updated metadata1", metadata2: "some updated metadata2", password_hash: "some updated password_hash", privkey: "some updated privkey", pubkey: "some updated pubkey", tokenfb: "some updated tokenfb", username: "some updated username"}
  @invalid_attrs %{address: nil, avatar: nil, background_img: nil, bio: nil, display_name: nil, email: nil, metadata1: nil, metadata2: nil, password_hash: nil, privkey: nil, pubkey: nil, tokenfb: nil, username: nil}

  def fixture(:backer) do
    {:ok, backer} = Account.create_backer(@create_attrs)
    backer
  end

  describe "index" do
    test "lists all backer", %{conn: conn} do
      conn = get conn, backer_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Backer"
    end
  end

  describe "new backer" do
    test "renders form", %{conn: conn} do
      conn = get conn, backer_path(conn, :new)
      assert html_response(conn, 200) =~ "New Backer"
    end
  end

  describe "create backer" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, backer_path(conn, :create), backer: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == backer_path(conn, :show, id)

      conn = get conn, backer_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Backer"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, backer_path(conn, :create), backer: @invalid_attrs
      assert html_response(conn, 200) =~ "New Backer"
    end
  end

  describe "edit backer" do
    setup [:create_backer]

    test "renders form for editing chosen backer", %{conn: conn, backer: backer} do
      conn = get conn, backer_path(conn, :edit, backer)
      assert html_response(conn, 200) =~ "Edit Backer"
    end
  end

  describe "update backer" do
    setup [:create_backer]

    test "redirects when data is valid", %{conn: conn, backer: backer} do
      conn = put conn, backer_path(conn, :update, backer), backer: @update_attrs
      assert redirected_to(conn) == backer_path(conn, :show, backer)

      conn = get conn, backer_path(conn, :show, backer)
      assert html_response(conn, 200) =~ "some updated address"
    end

    test "renders errors when data is invalid", %{conn: conn, backer: backer} do
      conn = put conn, backer_path(conn, :update, backer), backer: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Backer"
    end
  end

  describe "delete backer" do
    setup [:create_backer]

    test "deletes chosen backer", %{conn: conn, backer: backer} do
      conn = delete conn, backer_path(conn, :delete, backer)
      assert redirected_to(conn) == backer_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, backer_path(conn, :show, backer)
      end
    end
  end

  defp create_backer(_) do
    backer = fixture(:backer)
    {:ok, backer: backer}
  end
end
