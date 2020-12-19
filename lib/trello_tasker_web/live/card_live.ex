defmodule TrelloTaskerWeb.CardLive do
  use TrelloTaskerWeb, :live_view

  alias Phoenix.View
  alias TrelloTaskerWeb.CardView
  alias TrelloTasker.Shared.Services.Trello
  alias TrelloTasker.Cards.Card
  alias TrelloTasker.Cards

  @impl true
  def mount(_params, _session, socket) do
    changeset = Card.changeset(%Card{})
    {:ok, socket |> assign(cards: list_cards(), changeset: changeset)}
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
        card["path"]
        |> Trello.get_card()
        |> case do
          {:error, error} ->
            {:noreply, socket |> put_flash(:error, error) |> push_redirect(to: "/")}

          _card_info ->
            card
            |> Cards.create_card()
            |> response(socket)
        end
    end
  end

  defp response({:ok, _card}, socket),
    do: {:noreply, socket |> put_flash(:info, "Created card") |> push_redirect(to: "/")}

  defp response({:error, changeset}, socket),
    do: {:noreply, assign(socket, :changeset, changeset)}

  defp list_cards do
    Cards.list_cards()
    |> Enum.map(&Trello.get_card(&1.path))
  end
end
