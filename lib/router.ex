defmodule Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/convert" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(ConversionController.handle_convert(conn.params)))
  end
end
