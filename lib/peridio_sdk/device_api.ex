defmodule PeridioSDK.DeviceAPI do
  def middleware(config) do
    [
      {Tesla.Middleware.BaseUrl, config.device_api_host},
      {Tesla.Middleware.JSON, engine: config.json_client},
      {Tesla.Middleware.Headers,
       [
         {"peridio-release-prn", config.release_prn},
         {"peridio-release-version", config.release_version},
         {"User-Agent", "peridio/peridio-sdk-elixir@#{PeridioSDK.version()}"}
       ]}
    ]
  end
end
