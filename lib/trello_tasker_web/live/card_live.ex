defmodule TrelloTaskerWeb.CardLive do
  use TrelloTaskerWeb, :live_view

  alias Phoenix.View
  alias TrelloTaskerWeb.CardView
  alias TrelloTasker.Shared.Services.{CreateCard, FindAllCards}
  alias TrelloTasker.Cards.Card


  @impl true
  def mount(_params, _session, socket) do
    changeset = Card.changeset(%Card{})
    {:ok, socket |> assign(cards: FindAllCards.execute(), changeset: changeset)}
  end

  @impl true
  def render(assigns) do
    View.render(CardView, "index.html", assigns)
  end

  @impl true
  def handle_event("create", %{"card" => card}, socket) do
    changeset = %Ecto.Changeset{Card.changeset(%Card{}, card) | action: :insert}

    changeset.valid?
    |> case do
      false ->
        {:noreply, assign(socket, :changeset, changeset)}

      true ->
        card
        |> CreateCard.execute()
        |> response(socket)
    end
  end

  defp response({:trello_error, error}, socket),
    do: {:noreply, socket |> put_flash(:error, error) |> push_redirect(to: "/")}

  defp response({:ok, _card}, socket),
    do: {:noreply, socket |> put_flash(:info, "Created card") |> push_redirect(to: "/")}

  defp response({:error, changeset}, socket),
    do: {:noreply, assign(socket, :changeset, changeset)}
end
