defmodule PeridioSDK.DeviceAPI.Tunnels do
  alias PeridioSDK.HTTPClient
  alias PeridioSDK.DeviceAPI

  def configure(client, tunnel_prn, %{cidr_blocks: _, port_ranges: _, device_proxy_port: _, device_tunnel_port: _, device_public_key: _} = tunnel_data) do
    HTTPClient.post(
      client,
      DeviceAPI.middleware(client),
      "/tunnels/#{tunnel_prn}/configure",
      tunnel_data
    )
  end
end
