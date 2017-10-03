defmodule MpApiWeb.SessionController do
  use MpApiWeb, :controller

  import MpApiWeb.Authorize
  alias Phauxth.Confirm.Login

  # If you are using Argon2 or Pbkdf2, add crypto: Comeonin.Argon2
  # or crypto: Comeonin.Pbkdf2 to Login.verify (after Accounts)
  def create(conn, %{"session" => params}) do
    case Login.verify(params, MpApi.Accounts, crypto: Comeonin.Argon2) do
      {:ok, user} ->
        token = Phauxth.Token.sign(conn, user.id)
        render(conn, MpApiWeb.SessionView, "info.json", %{info: token})
      {:error, _message} ->
        error(conn, :unauthorized, 401)
    end
  end
end
