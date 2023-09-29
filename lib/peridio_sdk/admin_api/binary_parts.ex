defmodule PeridioSDK.AdminAPI.BinaryParts do
  alias PeridioSDK.HTTPClient
  alias PeridioSDK.AdminAPI

  def list(client, binary_prn) do
    HTTPClient.get(client, AdminAPI.middleware(client), "/binaries/#{binary_prn}/parts")
  end

  def create(
        client,
        binary_prn,
        index,
        %{hash: _, size: size, expected_binary_size: total_bytes} = binary_part_data
      ) do
    offset = index - 1

    middleware =
      ([
         {Tesla.Middleware.Headers,
          [
            {"content-range", "bytes #{offset * size}-#{index * size - 1}/#{total_bytes}"}
          ]}
       ] ++ AdminAPI.middleware(client))
      |> IO.inspect()

    HTTPClient.put(client, middleware, "/binaries/#{binary_prn}/parts/#{index}", binary_part_data)
  end
end
