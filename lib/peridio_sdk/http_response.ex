defmodule PeridioSDK.HTTPResponse do
  @moduledoc """
  Represents a response
  """

  @enforce_keys [:body, :headers, :status, :url]

  defstruct [
    :url,
    :body,
    :headers,
    :status
  ]

  @type t :: %__MODULE__{
          url: String.t(),
          body: map(),
          headers: [],
          status: pos_integer()
        }
end
