defmodule MpApiWeb.ConfirmController do
  use MpApiWeb, :controller

  import MpApiWeb.Authorize
  alias MpApi.Accounts

  def index(conn, params) do
    case Phauxth.Confirm.verify(params, Accounts) do
      {:ok, user} ->
        Accounts.confirm_user(user)
        message = "Your account has been confirmed"
        Accounts.Message.confirm_success(user.email)
        render(conn, MpApiWeb.ConfirmView, "info.json", %{info: message})
      {:error, _message} ->
        error(conn, :unauthorized, 401)
    end
  end
end
