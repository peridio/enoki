defmodule PeridioSDK.Client do
  defstruct admin_api_host: "https://api.cremini.peridio.com",
            device_api_host: "https://device.cremini.peridio.com",
            api_key: nil,
            adapter: nil,
            json_client: Jason,
            org: nil,
            release_prn: nil,
            release_version: nil

  @default_timeout 10_000

  def new(opts) do
    opts =
      adapter_opts(opts)
      |> Keyword.merge(opts)
      |> Keyword.take([
        :admin_api_host,
        :device_api_host,
        :api_key,
        :adapter,
        :json_client,
        :org,
        :release_prn,
        :release_version
      ])

    struct!(__MODULE__, opts)
  end

  defp adapter_opts(opts) do
    timeout = opts[:timeout] || @default_timeout
    [
      adapter: {Tesla.Adapter.Mint, timeout: timeout, transport_opts: [cacertfile: cacertfile()]}
    ]
  end

  defp cacertfile() do
    Application.app_dir(:peridio_sdk)
    |> Path.join(["priv/peridio-cacerts.pem"])
  end
end
