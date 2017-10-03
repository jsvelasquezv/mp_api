defmodule MpApiWeb.SessionView do
  use MpApiWeb, :view

  def render("info.json", %{info: token}) do
    %{access_token: token}
  end
end
