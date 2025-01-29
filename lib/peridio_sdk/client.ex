defmodule PeridioSDK.Client do
  defstruct admin_api_host: "https://api.cremini.peridio.com",
            device_api_host: "https://device.cremini.peridio.com",
            api_key: nil,
            adapter: nil,
            json_client: Jason,
            org: nil,
            release_prn: nil,
            bundle_prn: nil,
            release_version: nil,
            user_agent: nil

  def new(opts) do
    opts =
      adapter_opts()
      |> Keyword.put(:user_agent, user_agent())
      |> Keyword.merge(opts)
      |> Keyword.take([
        :admin_api_host,
        :device_api_host,
        :api_key,
        :adapter,
        :json_client,
        :org,
        :release_prn,
        :bundle_prn,
        :release_version,
        :user_agent
      ])

    struct!(__MODULE__, opts)
  end

  defp adapter_opts() do
    [
      adapter: {Tesla.Adapter.Mint, transport_opts: [cacertfile: cacertfile()]}
    ]
  end

  defp cacertfile() do
    Application.app_dir(:peridio_sdk)
    |> Path.join(["priv/peridio-cacerts.pem"])
  end

  def user_agent() do
    {os_family, os_type} = :erlang.system_info(:os_type)
    arch = :erlang.system_info(:system_architecture)
    version = PeridioSDK.version()
    otp_version = :erlang.system_info(:otp_release) |> to_string()
    elixir_version = System.version()

    "peridio-sdk-elixir/#{version} (#{os_family},#{os_type}; #{arch}) OTP/#{otp_version} Elixir/#{elixir_version}"
  end
end
