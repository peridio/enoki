defmodule PeridioSDK.QueryFilter do
  defstruct search: nil,
            limit: 10,
            order: "desc",
            page: nil

  def encode(%__MODULE__{} = qf) do
    [search: qf.search, limit: qf.limit, order: qf.order, page: qf.page]
    |> Enum.reject(&is_nil(elem(&1, 1)))
  end
end
