defmodule PeridioSDK.AdminAPI.Products do
  alias PeridioSDK.HTTPClient
  alias PeridioSDK.AdminAPI

  def list(client) do
    HTTPClient.get(client, AdminAPI.middleware(client), "/orgs/#{client.org}/products")
  end

  def new(client, %{name: _} = product_data) do
    HTTPClient.post(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/products",
      product_data
    )
  end

  def delete(client, product_name) do
    HTTPClient.delete(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/products/#{product_name}"
    )
  end

  def get(client, product_name) do
    HTTPClient.get(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/products/#{product_name}"
    )
  end

  def update(client, product_name, product_data) do
    HTTPClient.put(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/products/#{product_name}",
      product_data
    )
  end
end
