defmodule TrelloTasker.Shared.Providers.CacheProvider.CardCache do
  use GenServer

  @data_base :cards

  def start_link(_), do: GenServer.start_link(__MODULE__, %{}, name: :card_cache)

  def init(state) do
    IO.inspect(state)
    :ets.new(@data_base, [:set, :public, :named_table])
    {:ok, state}
  end

  def handle_call({:get, key}, _from, state) do
    response =
      :ets.lookup(@data_base, key)
      |> case do
        [] -> {:not_found, []}
        [{_k, value}] -> {:ok, value}
      end

    {:reply, response, state}
  end

  def handle_cast({:put, key, value}, state) do
    :ets.insert(@data_base, {key, value})
    IO.inspect({key, value}, label: "handle_cast:")
    {:noreply, state}
  end
end
