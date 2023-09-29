defmodule PeridioSDK do
  @moduledoc false

  @version Mix.Project.config()[:version]

  @doc """
  Returns the current version for the SDK
  """
  def version, do: @version
end
