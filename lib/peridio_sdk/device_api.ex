defmodule PeridioSDK.DeviceAPI do
  def middleware(config) do
    headers = [{"User-Agent", "peridio/peridio-sdk-elixir@#{PeridioSDK.version()}"}]

    headers =
      case config.release_prn do
        nil -> headers
        release_prn -> [{"peridio-release-prn", release_prn} | headers]
      end

    headers =
      case config.release_version do
        nil -> headers
        release_version -> [{"peridio-release-version", release_version} | headers]
      end

    headers =
      case config.bundle_prn do
        nil -> headers
        bundle_prn -> [{"peridio-bundle-prn", bundle_prn} | headers]
      end

    [
      {Tesla.Middleware.BaseUrl, config.device_api_host},
      {Tesla.Middleware.JSON, engine: config.json_client},
      {Tesla.Middleware.Headers, headers}
    ]
  end
end
