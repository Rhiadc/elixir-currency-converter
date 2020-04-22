defmodule ConversionControllerTest do
  use ExUnit.Case
  doctest ConversionController

  test "should convert currency and return formatted response" do
    convert_params = %{"from" => "usd", "to" => "brl", "amount" => "1"}

    convert_result = ConversionController.handle_convert(convert_params)

    assert convert_result.result != nil
  end

  test "should fail convert currency and return amount error" do
    convert_params = %{"from" => "usd", "to" => "brl", "amount" => "0"}

    convert_result = ConversionController.handle_convert(convert_params)

    assert convert_result.error == "Amount must be bigger than 0"
  end

  test "should fail convert currency and return required from error" do
    convert_params = %{"to" => "brl", "amount" => "1"}

    convert_result = ConversionController.handle_convert(convert_params)

    assert convert_result.error == "From is required"
  end

  test "should fail convert currency and return required to error" do
    convert_params = %{"from" => "usd", "amount" => "1"}

    convert_result = ConversionController.handle_convert(convert_params)

    assert convert_result.error == "To is required"
  end

  test "should fail convert currency and return required amount error" do
    convert_params = %{"from" => "usd", "to" => "brl"}

    convert_result = ConversionController.handle_convert(convert_params)

    assert convert_result.error == "Amount is required"
  end
end
