defmodule PeridioSDK.AdminAPI.ProductUsers do
  alias PeridioSDK.HTTPClient
  alias PeridioSDK.AdminAPI

  @roles [:read, :write, :delete, :admin]

  def list(client, product_name) do
    HTTPClient.get(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/products/#{product_name}/users"
    )
  end

  def remove(client, product_name, username) do
    HTTPClient.delete(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/products/#{product_name}/users/#{username}"
    )
  end

  def add(client, product_name, %{username: _, role: role} = user_data) when role in @roles do
    HTTPClient.post(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/products/#{product_name}/users",
      user_data
    )
  end

  def get(client, product_name, username) do
    HTTPClient.get(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/products/#{product_name}/users/#{username}"
    )
  end

  def update(client, product_name, username, %{role: role} = org_user_data) when role in @roles do
    HTTPClient.put(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/products/#{product_name}/users/#{username}",
      org_user_data
    )
  end
end
