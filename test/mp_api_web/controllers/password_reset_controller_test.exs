defmodule MpApiWeb.PasswordResetControllerTest do
  use MpApiWeb.ConnCase

  import MpApiWeb.AuthCase

  setup %{conn: conn} do
    add_reset_user("gladys@example.com")
    {:ok, %{conn: conn}}
  end

  test "user can create a password reset request", %{conn: conn} do
    valid_attrs = %{email: "gladys@example.com"}
    conn = post(conn, password_reset_path(conn, :create), password_reset: valid_attrs)
    assert json_response(conn, 201)["info"]["detail"]
  end

  test "create function fails for no user", %{conn: conn} do
    invalid_attrs = %{email: "prettylady@example.com"}
    conn = post(conn, password_reset_path(conn, :create), password_reset: invalid_attrs)
    assert json_response(conn, 201)["info"]["detail"]
  end

  test "reset password succeeds for correct key", %{conn: conn} do
    valid_attrs = %{email: "gladys@example.com", password: "^hEsdg*F899", key: gen_key("gladys@example.com")}
    conn = put(conn, password_reset_path(conn, :update), password_reset: valid_attrs)
    assert json_response(conn, 200)["info"]["detail"]
  end

  test "reset password fails for incorrect key", %{conn: conn} do
    invalid_attrs = %{email: "gladys@example.com", password: "^hEsdg*F899", key: "garbage"}
    conn = put(conn, password_reset_path(conn, :update), password_reset: invalid_attrs)
    assert json_response(conn, 422)["errors"] != %{}
  end

end
