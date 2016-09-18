defmodule PagseguroEx.ClientTest do
  use ExUnit.Case, async: true
  alias PagseguroEx.Client

  doctest PagseguroEx.Client

  test "new/2" do
    client = Client.new("user@domain.com", "passphrase")
    assert client.email == "user@domain.com"
    assert client.token == "passphrase"
  end
end
