defmodule PeridioSDK.AdminAPI.Artifacts do
  alias PeridioSDK.HTTPClient
  alias PeridioSDK.AdminAPI
  alias PeridioSDK.QueryFilter

  def list(client, %QueryFilter{} = query_filter) do
    HTTPClient.get(client, AdminAPI.middleware(client), "/artifacts",
      query: QueryFilter.encode(query_filter)
    )
  end

  def create(client, %{name: _, organization_prn: _} = artifact_data) do
    HTTPClient.post(client, AdminAPI.middleware(client), "/artifacts", artifact_data)
  end

  def update(client, artifact_prn, artifact_data) do
    HTTPClient.patch(
      client,
      AdminAPI.middleware(client),
      "/artifacts/#{artifact_prn}",
      artifact_data
    )
  end

  def get(client, artifact_prn) do
    HTTPClient.get(client, AdminAPI.middleware(client), "/artifacts/#{artifact_prn}")
  end
end
