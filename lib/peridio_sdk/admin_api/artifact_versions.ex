defmodule PeridioSDK.AdminAPI.ArtifactVersions do
  alias PeridioSDK.HTTPClient
  alias PeridioSDK.AdminAPI
  alias PeridioSDK.QueryFilter

  def list(client, %QueryFilter{} = query_filter) do
    HTTPClient.get(client, AdminAPI.middleware(client), "/artifact_versions",
      query: QueryFilter.encode(query_filter)
    )
  end

  def create(client, %{version: _, artifact_prn: _} = artifact_version_data) do
    HTTPClient.post(
      client,
      AdminAPI.middleware(client),
      "/artifact_versions",
      artifact_version_data
    )
  end

  def update(client, artifact_version_prn, artifact_version_data) do
    HTTPClient.patch(
      client,
      AdminAPI.middleware(client),
      "/artifact_versions/#{artifact_version_prn}",
      artifact_version_data
    )
  end

  def get(client, artifact_version_prn) do
    HTTPClient.get(
      client,
      AdminAPI.middleware(client),
      "/artifact_versions/#{artifact_version_prn}"
    )
  end
end
