defmodule TrelloTaskerWeb.CardInfoLive do
  use TrelloTaskerWeb, :live_view

  alias Phoenix.View
  alias TrelloTaskerWeb.CardView

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    View.render(CardView, "info.html", assigns)
  end
end
