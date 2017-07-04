defmodule Rumbl.Repo do
  @moduledoc """
  In memory repository.
  """

  def all(Rumbl.User) do
    [
      %Rumbl.User{id: 1, name: "Chriss", username: "chriss", password: "asdqwe123"},
      %Rumbl.User{id: 2, name: "asdqwe", username: "asdqwe", password: "asdqwe123"},
      %Rumbl.User{id: 3, name: "klopklop", username: "klopklop", password: "asdqwe123"},
    ]
  end
  def all(_module), do: []

  def get(module, id) do
    Enum.find all(module), fn map -> map.id == id end
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, value} -> Map.get(map, key) == value end)
    end
  end

end
