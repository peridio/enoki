defmodule PeridioSDK.AdminAPI.CACertificates do
  alias PeridioSDK.HTTPClient
  alias PeridioSDK.AdminAPI

  def list(client) do
    HTTPClient.get(client, AdminAPI.middleware(client), "/orgs/#{client.org}/ca_certificates")
  end

  def create_verification_code(client) do
    HTTPClient.post(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/ca_certificates/verification_codes",
      %{}
    )
  end

  def create(client, %{certificate: _, verification_certificate: _} = ca_certificate_data) do
    HTTPClient.post(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/ca_certificates",
      ca_certificate_data
    )
  end

  def get(client, ca_certificate_serial) do
    HTTPClient.get(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/ca_certificates/#{ca_certificate_serial}"
    )
  end

  def update(client, ca_certificate_serial, ca_certificate_data) do
    HTTPClient.put(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/ca_certificates/#{ca_certificate_serial}",
      ca_certificate_data
    )
  end

  def update(client, ca_certificate_serial) do
    HTTPClient.delete(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/ca_certificates/#{ca_certificate_serial}"
    )
  end
end
