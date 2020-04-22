defmodule Conversion do
  @type conversion_result :: %{
          from: binary,
          to: binary,
          amount_to_convert: number,
          amount_converted: number
        }

  @spec handle_conversion(binary, binary, number) :: conversion_result
  def handle_conversion(from, to, amount) when amount > 0 do
    cond do
      !is_valid_currency?(from) ->
        {:error, "#{from} isn't supported."}

      !is_valid_currency?(to) ->
        {:error, "#{to} isn't supported."}

      true ->
        {:ok, rates} = get_latest_rates(from)

        converted = convert(rates["rates"][String.upcase(to)], amount)

        {:ok,
         %{
           from: from,
           to: to,
           amount_to_convert: amount,
           amount_converted: converted
         }}
    end
  end

  defp convert(rate, amount) do
    (rate * amount)
    |> Float.ceil(2)
  end

  @spec is_valid_currency?(String.t()) :: boolean
  def is_valid_currency?(currency) when byte_size(currency) > 0 do
    currencies = get_valid_currencies()

    Enum.member?(currencies, String.upcase(currency))
  end

  def get_latest_rates do
    {:ok, response} = ApiHandler.request_get("/")

    if response.status == 200 do
      {:ok, response.body}
    else
      {:error, "Fail get latest rates from server!"}
    end
  end

  def get_latest_rates(base) when byte_size(base) > 0 do
    {:ok, response} = ApiHandler.request_get("?base=#{String.upcase(base)}")

    if response.status == 200 do
      {:ok, response.body}
    else
      {:error, "Fail get latest rates from server!"}
    end
  end

  @spec get_valid_currencies :: [...]
  def get_valid_currencies do
    {:ok, rates} = get_latest_rates()

    Map.keys(rates["rates"])
  end
end
