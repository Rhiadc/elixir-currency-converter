defmodule ConversionController do
  require Logger

  @moduledoc """
  Handle api calls for conversion.
  """

  @doc """
  Handle the conversion request from api.

  """
  def handle_convert(params) do
    cond do
      params["from"] in ["", nil] ->
        request_return(nil, "From is required")

      params["to"] in ["", nil] ->
        request_return(nil, "To is required")

      params["amount"] in ["", nil] ->
        request_return(nil, "Amount is required")

      true ->
        convert = Conversion.handle_conversion(params["from"], params["to"], params["amount"])

        case convert do
          {:error, error} ->
            request_return(nil, error)

          {:ok, result} ->
            request_return(result, false)
        end
    end
  end

  def request_return(data, error) do
    if error do
      %{
        error: error,
        result: nil
      }
    else
      %{
        error: nil,
        result: data
      }
    end
  end
end
