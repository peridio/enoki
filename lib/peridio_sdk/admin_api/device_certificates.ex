defmodule PeridioSDK.AdminAPI.DeviceCertificates do
  alias PeridioSDK.HTTPClient
  alias PeridioSDK.AdminAPI

  def list(client, product_name, device_identifier) do
    HTTPClient.get(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/products/#{product_name}/devices/#{device_identifier}/certificates"
    )
  end

  def create(client, product_name, device_identifier, %{cert: _} = device_certificate_data) do
    HTTPClient.post(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/products/#{product_name}/devices/#{device_identifier}/certificates",
      device_certificate_data
    )
  end

  def get(client, product_name, device_identifier, certificate_serial) do
    HTTPClient.get(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/products/#{product_name}/devices/#{device_identifier}/certificates/#{certificate_serial}"
    )
  end

  def delete(client, product_name, device_identifier, certificate_serial) do
    HTTPClient.delete(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/products/#{product_name}/devices/#{device_identifier}/certificates/#{certificate_serial}"
    )
  end
end
