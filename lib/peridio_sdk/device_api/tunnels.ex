defmodule PeridioSDK.DeviceAPI.Tunnels do
  alias PeridioSDK.HTTPClient
  alias PeridioSDK.DeviceAPI

  def list(client, query_params \\ []) do
    HTTPClient.get(
      client,
      DeviceAPI.middleware(client),
      "/tunnels",
      query: query_params
    )
  end

  def configure(client, tunnel_prn, %{cidr_blocks: _, port_ranges: _, device_proxy_port: _, device_tunnel_port: _, device_public_key: _} = tunnel_data) do
    HTTPClient.post(
      client,
      DeviceAPI.middleware(client),
      "/tunnels/#{tunnel_prn}/configure",
      tunnel_data
    )
  end

  def update(client, tunnel_prn, %{state: _} = tunnel_data) do
    HTTPClient.patch(
      client,
      DeviceAPI.middleware(client),
      "/tunnels/#{tunnel_prn}/update",
      tunnel_data
    )
  end
end
