defmodule ApiHandler do
  @moduledoc """
  Handle the HTTP requests with Tesla.
  """

  use Tesla

  plug(Tesla.Middleware.BaseUrl, Endpoints.base_url())
  plug(Tesla.Middleware.JSON)

  @doc """
  Handle the HTTP/GET request.

  ## Parameters

    - endpoint: String that represents the http endpoint to request.

  """
  @spec request_get(binary) :: {:error, any} | {:ok, Tesla.Env.t()}
  def request_get(endpoint) do
    get(endpoint)
  end
end
