defmodule PeridioSDK.AdminAPI.Cohorts do
  alias PeridioSDK.HTTPClient
  alias PeridioSDK.AdminAPI
  alias PeridioSDK.QueryFilter

  def list(client, %QueryFilter{} = query_filter) do
    HTTPClient.get(client, AdminAPI.middleware(client), "/cohorts",
      query: QueryFilter.encode(query_filter)
    )
  end

  def create(client, %{name: _, organization_prn: _, product_prn: _} = cohort_data) do
    HTTPClient.post(client, AdminAPI.middleware(client), "/cohorts", cohort_data)
  end

  def update(client, cohort_prn, cohort_data) do
    HTTPClient.patch(client, AdminAPI.middleware(client), "/cohorts/#{cohort_prn}", cohort_data)
  end

  def get(client, cohort_prn) do
    HTTPClient.get(client, AdminAPI.middleware(client), "/cohorts/#{cohort_prn}")
  end
end
