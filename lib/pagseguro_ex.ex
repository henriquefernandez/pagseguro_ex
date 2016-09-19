defmodule PagseguroEx do
  alias PagseguroEx.Payment

  @doc """
  send_payment receives a Payment as argument and perform request.
  """
  def create_payment(client, payment) do
    client_info = client |> Map.from_struct

    request_params = payment
                   |> Payment.to_request_map
                   |> Map.merge(client_info)
                   |> Enum.filter(&elem(&1, 1))
                   |> URI.encode_query

    headers = ["Content-Type": "application/x-www-form-urlencoded; charset=ISO-8859-1"]
    url = service_url <> "/v2/checkout?" <> request_params

    response = HTTPotion.post(url, [headers: headers])
    case Floki.find(response.body, "code") do
      [{"code", _, [code]}] ->
        code
      body ->
        raise  """
          status: #{response.status_code}
          body: #{body}
        """
    end
  end

  defp service_url do
    "https://ws.pagseguro.uol.com.br"
  end
end
