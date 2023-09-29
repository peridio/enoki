defmodule PeridioSDK.Client do
  defstruct admin_api_host: "https://api.cremini.peridio.com",
            device_api_host: "https://device.cremini.peridio.com",
            api_key: nil,
            adapter: nil,
            json_client: Jason,
            org: nil

  def new(opts) do
    opts =
      default_opts()
      |> Keyword.merge(opts)
      |> Keyword.take([:admin_api_host, :device_api_host, :api_key, :adapter, :json_client, :org])

    struct!(__MODULE__, opts)
  end

  defp default_opts() do
    [
      adapter: {Tesla.Adapter.Mint, transport_opts: [cacertfile: cacertfile()]}
    ]
  end

  defp cacertfile() do
    Application.app_dir(:peridio_sdk)
    |> Path.join(["priv/peridio-cacerts.pem"])
  end
end
