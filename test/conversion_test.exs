defmodule ConversionTest do
  use ExUnit.Case
  doctest Conversion

  test "should convert currency and return formatted response" do
    {:ok, result} = Conversion.handle_conversion("brl", "usd", 1)

    assert result.amount_to_convert == 1
  end

  test "should fail convert currency and return unsupported error" do
    {:error, error} = Conversion.handle_conversion("unknown", "usd", 1)

    assert error == "unknown isn't supported."
  end

  test "should fail convert currency and return amount error" do
    {:error, error} = Conversion.handle_conversion("brl", "usd", 0)

    assert error == "Amount must be bigger than 0"
  end

  test "should get latest rates based on EURO" do
    {:ok, rates} = Conversion.get_latest_rates()

    assert rates["base"] == "EUR"
  end

  test "should get latest rates based on BRL" do
    {:ok, rates} = Conversion.get_latest_rates("brl")

    assert rates["base"] == "BRL"
  end

  test "should fail get latest rates based on unknown currency" do
    {:error, error} = Conversion.get_latest_rates("unknown")

    assert error == "Fail get latest rates from server!"
  end

  test "should return list of valid currencies" do
    valid_rates = Conversion.get_valid_currencies()

    assert Enum.member?(valid_rates, "USD") == true
  end

  test "should pass check if is a valid currency" do
    is_valid = Conversion.is_valid_currency?("USD")

    assert is_valid == true
  end

  test "should fail check if is a valid currency" do
    is_valid = Conversion.is_valid_currency?("randomcurrency")

    assert is_valid == false
  end
end
