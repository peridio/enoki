defmodule PeridioSDK.AdminAPI.Releases do
  alias PeridioSDK.HTTPClient
  alias PeridioSDK.AdminAPI
  alias PeridioSDK.QueryFilter

  def list(client, %QueryFilter{} = query_filter) do
    HTTPClient.get(client, AdminAPI.middleware(client), "/releases",
      query: QueryFilter.encode(query_filter)
    )
  end

  def create(
        client,
        %{
          bundle_prn: _,
          phase_value: _,
          cohort_prn: _,
          name: _,
          organization_prn: _,
          schedule_date: _,
          required: _
        } = release_data
      ) do
    HTTPClient.post(client, AdminAPI.middleware(client), "/releases", release_data)
  end

  def get(client, release_prn) do
    HTTPClient.get(client, AdminAPI.middleware(client), "/releases/#{release_prn}")
  end

  def update(client, release_prn, release_data) do
    HTTPClient.patch(
      client,
      AdminAPI.middleware(client),
      "/releases/#{release_prn}",
      release_data
    )
  end
end
