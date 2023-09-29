defmodule PeridioSDK.AdminAPI.Binaries do
  alias PeridioSDK.HTTPClient
  alias PeridioSDK.AdminAPI
  alias PeridioSDK.QueryFilter

  def list(client, %QueryFilter{} = query_filter) do
    HTTPClient.get(client, AdminAPI.middleware(client), "/binaries",
      query: QueryFilter.encode(query_filter)
    )
  end

  def create(client, %{hash: _, size: _, target: _, binary_prn: _} = binary_data) do
    HTTPClient.post(client, AdminAPI.middleware(client), "/binaries", binary_data)
  end

  def update(client, binary_prn, binary_data) do
    HTTPClient.patch(client, AdminAPI.middleware(client), "/binaries/#{binary_prn}", binary_data)
  end

  def get(client, binary_prn) do
    HTTPClient.get(client, AdminAPI.middleware(client), "/binaries/#{binary_prn}")
  end
end
