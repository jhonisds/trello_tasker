defmodule TrelloTaskerWeb.CardInfoLive do
  use TrelloTaskerWeb, :live_view

  alias Phoenix.View
  alias TrelloTaskerWeb.CardView
  alias TrelloTasker.Shared.Services.Trello

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    {:ok, socket |> assign(comments: Trello.get_comments(id), card: Trello.get_card(id))}
  end

  @impl true
  def render(assigns) do
    View.render(CardView, "info.html", assigns)
  end
end
