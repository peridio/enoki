defmodule PeridioSDK.AdminAPI.Devices do
  alias PeridioSDK.HTTPClient
  alias PeridioSDK.AdminAPI

  def list(client, product_name) do
    HTTPClient.get(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/products/#{product_name}/devices"
    )
  end

  def create(client, product_name, %{identifier: _} = device_data) do
    HTTPClient.post(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/products/#{product_name}/devices",
      device_data
    )
  end

  def update(client, product_name, device_identifier, device_data) do
    HTTPClient.put(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/products/#{product_name}/devices/#{device_identifier}",
      device_data
    )
  end

  def delete(client, product_name, device_identifier) do
    HTTPClient.delete(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/products/#{product_name}/devices/#{device_identifier}"
    )
  end

  def get(client, product_name, device_identifier) do
    HTTPClient.get(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/products/#{product_name}/devices/#{device_identifier}"
    )
  end

  def auth(client, product_name, certificate) do
    HTTPClient.post(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/products/#{product_name}/devices/auth",
      %{certificate: certificate}
    )
  end
end
