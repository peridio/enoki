defmodule PeridioSDK.AdminAPI.OrganizationUsers do
  alias PeridioSDK.HTTPClient
  alias PeridioSDK.AdminAPI

  @roles [:read, :write, :delete, :admin]

  def list(client) do
    HTTPClient.get(client, AdminAPI.middleware(client), "/orgs/#{client.org}/users")
  end

  def remove(client, username) do
    HTTPClient.delete(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/users/#{username}"
    )
  end

  def add(client, %{username: _, role: role} = user_data) when role in @roles do
    HTTPClient.post(client, AdminAPI.middleware(client), "/orgs/#{client.org}/users", user_data)
  end

  def get(client, username) do
    HTTPClient.get(client, AdminAPI.middleware(client), "/orgs/#{client.org}/users/#{username}")
  end

  def update(client, username, %{role: role} = org_user_data) when role in @roles do
    HTTPClient.put(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/users/#{username}",
      org_user_data
    )
  end
end
