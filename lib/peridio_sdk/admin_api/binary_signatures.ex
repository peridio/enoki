defmodule PeridioSDK.AdminAPI.BinarySignatures do
  alias PeridioSDK.HTTPClient
  alias PeridioSDK.AdminAPI

  def create(client, %{binary_prn: _, signing_key_prn: _, signature: _} = signature_data) do
    HTTPClient.post(client, AdminAPI.middleware(client), "/binary_signatures", signature_data)
  end

  def delete(client, binary_signature_prn) do
    HTTPClient.delete(
      client,
      AdminAPI.middleware(client),
      "/binary_signatures/#{binary_signature_prn}"
    )
  end
end
