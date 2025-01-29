defmodule PeridioSDK.AdminAPI do
  def middleware(config) do
    [
      {Tesla.Middleware.BaseUrl, config.admin_api_host},
      {Tesla.Middleware.JSON, engine: config.json_client},
      {Tesla.Middleware.Headers,
       [
         {"User-Agent", config.user_agent},
         {"Authorization", "Token " <> config.api_key}
       ]}
    ]
  end
end
