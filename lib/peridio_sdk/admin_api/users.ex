defmodule PeridioSDK.AdminAPI.Users do
  alias PeridioSDK.HTTPClient
  alias PeridioSDK.AdminAPI

  def auth(client, %{username: _, password: _} = auth_data) do
    HTTPClient.post(client, AdminAPI.middleware(client), "/users/auth", auth_data)
  end

  def login(client, %{username: _, password: _, note: _} = login_data) do
    HTTPClient.post(client, AdminAPI.middleware(client), "/users/login", login_data)
  end

  def register(client, %{username: _, password: _, email: _} = register_data) do
    HTTPClient.post(client, AdminAPI.middleware(client), "/users/register", register_data)
  end

  def me(client) do
    HTTPClient.get(client, AdminAPI.middleware(client), "/users/me")
  end
end
