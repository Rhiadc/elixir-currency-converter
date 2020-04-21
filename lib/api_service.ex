defmodule ApiService do
  use Tesla

  plug(Tesla.Middleware.BaseUrl, Endpoints.base_url())
  plug(Tesla.Middleware.JSON)

  def request_get(endpoint) do
    get(endpoint)
  end
end
