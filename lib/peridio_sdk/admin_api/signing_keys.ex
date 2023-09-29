defmodule PeridioSDK.AdminAPI.SigningKeys do
  alias PeridioSDK.HTTPClient
  alias PeridioSDK.AdminAPI
  alias PeridioSDK.QueryFilter

  def list(client, %QueryFilter{} = query_filter) do
    HTTPClient.get(client, AdminAPI.middleware(client), "/signing_keys",
      query: QueryFilter.encode(query_filter)
    )
  end

  def create(client, %{value: _, name: _, organization_prn: _} = signing_key_data) do
    HTTPClient.post(client, AdminAPI.middleware(client), "/signing_keys", signing_key_data)
  end

  def get(client, signing_key_prn) do
    HTTPClient.get(client, AdminAPI.middleware(client), "/signing_keys/#{signing_key_prn}")
  end

  def update(client, signing_key_prn, signing_key_data) do
    HTTPClient.patch(
      client,
      AdminAPI.middleware(client),
      "/signing_keys/#{signing_key_prn}",
      signing_key_data
    )
  end

  def delete(client, signing_key_prn) do
    HTTPClient.delete(client, AdminAPI.middleware(client), "/signing_keys/#{signing_key_prn}")
  end
end
