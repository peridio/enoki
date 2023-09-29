defmodule PeridioSDK.AdminAPI do
  def middleware(config) do
    [
      {Tesla.Middleware.BaseUrl, config.admin_api_host},
      {Tesla.Middleware.JSON, engine: config.json_client},
      {Tesla.Middleware.Headers,
       [
         {"Authorization", "Token " <> config.api_key},
         {"User-Agent", "peridio/peridio-sdk-elixir@#{PeridioSDK.version()}"}
       ]}
    ]
  end
end
