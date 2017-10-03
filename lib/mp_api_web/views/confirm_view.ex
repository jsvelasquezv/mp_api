defmodule MpApiWeb.ConfirmView do
  use MpApiWeb, :view

  def render("info.json", %{info: message}) do
    %{info: %{detail: message}}
  end
end
