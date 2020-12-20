defmodule TrelloTasker.Shared.Providers.CacheProvider.CardCacheClient do
  def save(key, value), do: GenServer.cast(:card_cache, {:put, key, value})
  def recover(key), do: GenServer.call(:card_cache, {:get, key})
end
