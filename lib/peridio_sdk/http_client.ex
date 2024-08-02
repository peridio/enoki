defmodule PeridioSDK.HTTPClient do
  alias PeridioSDK.HTTPResponse

  @typedoc """
  Describes a response from calling an API function
  """
  @type response :: {:ok, HTTPResponse.t()} | {:error, HTTPResponse.t()} | {:error, any()}

  @typedoc """
  Defines available options to pass to an API function
  """
  @type options :: [Tesla.option()] | []

  def http_client(config, middleware) do
    Tesla.client(middleware, config.adapter)
  end

  @doc """
  Executes a get request.
  """
  def get(client, middleware, path, opts \\ []) do
    client
    |> http_client(middleware)
    |> Tesla.get(path, opts)
    |> handle_response()
  end

  @doc """
  Executes a put request.
  """
  def put(client, middleware, path, body, opts \\ []) do
    client
    |> http_client(middleware)
    |> Tesla.put(path, body, opts)
    |> handle_response()
  end

  @doc """
  Executes a patch request.
  """
  def patch(client, middleware, path, body) do
    client
    |> http_client(middleware)
    |> Tesla.patch(path, body)
    |> handle_response()
  end

  @doc """
  Executes a post request.
  """
  def post(client, middleware, path, body, opts \\ []) do
    client
    |> http_client(middleware)
    |> Tesla.post(path, body, opts)
    |> handle_response()
  end

  @doc """
  Executes a delete request.
  """
  def delete(client, middleware, path, opts \\ []) do
    client
    |> http_client(middleware)
    |> Tesla.delete(path, opts)
    |> handle_response()
  end

  defp handle_response({:ok, %Tesla.Env{status: status} = env})
       when status >= 200 and status < 300 do
    {:ok,
     %PeridioSDK.HTTPResponse{status: status, headers: env.headers, body: env.body, url: env.url}}
  end

  defp handle_response({:ok, %Tesla.Env{status: status} = env}) do
    {:error, %HTTPResponse{status: status, headers: env.headers, body: env.body, url: env.url}}
  end

  defp handle_response(result), do: result
end
