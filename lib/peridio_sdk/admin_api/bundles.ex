defmodule PeridioSDK.AdminAPI.Bundles do
  alias PeridioSDK.HTTPClient
  alias PeridioSDK.AdminAPI
  alias PeridioSDK.QueryFilter

  def list(client, %QueryFilter{} = query_filter) do
    HTTPClient.get(client, AdminAPI.middleware(client), "/bundles",
      query: QueryFilter.encode(query_filter)
    )
  end

  def create(client, %{organization_prn: _, artifact_version_prns: [_ | _]} = bundle_data) do
    HTTPClient.post(client, AdminAPI.middleware(client), "/bundles", bundle_data)
  end

  def get(client, bundle_prn) do
    HTTPClient.get(client, AdminAPI.middleware(client), "/bundles/#{bundle_prn}")
  end
end
