### Currency conversion Application/API - Exchange rates are based on current foreign exchange rates published by the European Central Bank.

#### About
The main objective of this application is to provide a way to make currency conversions quickly, simply and based on a secure source.

#### Dependencies

* [Elixir 1.10](https://elixir-lang.org/)
* [Tesla](https://github.com/teamon/tesla) - HTTP requests client.
* [Poison](https://github.com/devinus/poison) - JSON parser.
* [Cowboy](https://github.com/ninenines/cowboy) - Small Erlang/OTP HTTP server.
* [ExchangeRateApi](https://exchangeratesapi.io/) - API for exchange rates.

#### Installation 

##### Step 1 - Install Elixir

You can follow the installation guide according to your operating system.

* [Unix (and Unix-like)](https://elixir-lang.org/install.html#unix-and-unix-like)
* [Windows](https://elixir-lang.org/install.html#windows)
* [MacOS](https://elixir-lang.org/install.html#macos)

##### Step 2 - Cloning the repository

```
git clone git@github.com:maikkkko1/elixir-currency-converter.git
```

##### Step 3 - Install project dependencies

From the terminal in the project's root folder, run the command:

```
mix deps.get
```

If the installation has been successfully completed, the project is ready to be used!

#### How to use

##### Elixir's interactive shell (iex)

About the IEX: https://hexdocs.pm/iex/IEx.html

From the terminal in the project's root folder, run the command to enter in the IEX mode:

```
iex -S mix
```

The conversion function is **handle_conversion** from the **Conversion** module.

handle_conversion/3 - from, to, amount

Converting an amount of 1 BRL to USD, we will have in the current values the following result:

```elixir
iex(1)> Conversion.handle_conversion("brl", "usd", 1)
{:ok, %{amount_converted: 0.19, amount_to_convert: 1, from: "brl", to: "usd"}}
``` 

##### HTTP Request (API)

To use it via API, it is first necessary to start the HTTP server.

From the terminal in the project's root folder, run the command to start the server:

```
mix run --no-halt
``` 

Now using a client for HTTP requests like Postman or Insomnia, it is possible to make the requests to perform the conversion.

Request params: 
* **from** - required
* **to** - required
* **amount** - required

Success request

```json
GET http://localhost:4000/api/conversion?from=brl&to=usd&amount=1

RESPONSE
  {
  "result": {
    "to": "usd",
    "from": "brl",
    "amount_to_convert": "1",
    "amount_converted": 0.19
  },
  "error": null
}
``` 

Error request

```json
GET http://localhost:4000/api/conversion?from=brl&to=usd

RESPONSE
  {
  "result": null,
  "error": "Amount is required"
}
``` 
