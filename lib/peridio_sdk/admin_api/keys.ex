defmodule PeridioSDK.AdminAPI.Keys do
  alias PeridioSDK.HTTPClient
  alias PeridioSDK.AdminAPI

  def list(client) do
    HTTPClient.get(client, AdminAPI.middleware(client), "/orgs/#{client.org}/keys")
  end

  def create(client, %{key: _, name: _} = key_data) do
    HTTPClient.post(client, AdminAPI.middleware(client), "/orgs/#{client.org}/keys", key_data)
  end

  def get(client, key_name) do
    HTTPClient.get(client, AdminAPI.middleware(client), "/orgs/#{client.org}/keys/#{key_name}")
  end

  def delete(client, key_name) do
    HTTPClient.delete(client, AdminAPI.middleware(client), "/orgs/#{client.org}/keys/#{key_name}")
  end
end
