defmodule PeridioSDK.AdminAPI.Firmwares do
  alias PeridioSDK.HTTPClient
  alias PeridioSDK.AdminAPI
  alias Tesla.Multipart

  def list(client, product_name) do
    HTTPClient.get(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/products/#{product_name}/firmwares"
    )
  end

  def create(client, product_name, firmware_file_path, ttl \\ nil) do
    firmware_data =
      Multipart.new()
      |> Multipart.add_content_type_param("multipart/form-data")
      |> Multipart.add_file(firmware_file_path, name: "firmware")
      |> add_ttl(ttl)

    HTTPClient.post(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/products/#{product_name}/firmwares",
      firmware_data
    )
  end

  def delete(client, product_name, firmware_uuid) do
    HTTPClient.delete(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/products/#{product_name}/firmwares/#{firmware_uuid}"
    )
  end

  def get(client, product_name, firmware_uuid) do
    HTTPClient.get(
      client,
      AdminAPI.middleware(client),
      "/orgs/#{client.org}/products/#{product_name}/firmwares/#{firmware_uuid}"
    )
  end

  defp add_ttl(multipart, nil), do: multipart
  defp add_ttl(multipart, ttl), do: Multipart.add_field(multipart, "ttl", ttl)
end
