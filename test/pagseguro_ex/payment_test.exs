defmodule PagseguroEx.PaymentTest do
  use ExUnit.Case, async: true

  alias PagseguroEx.{Payment, Sender, Shipping, Item}
  import Payment, except: [new: 0]

  test "new/0" do
    payment = Payment.new
    assert payment.currency == "BRL"
  end

  test "set_reference/2" do
    payment = Payment.new |> set_reference("order-001")
    assert payment.reference == "order-001"
  end

  test "set_items/2" do
    payment = Payment.new |> set_items([%Item{id: "PROD-01"}])
    assert payment.items == [%Item{id: "PROD-01"}]
  end

  test "set_sender/2" do
    payment = Payment.new |> set_sender(%Sender{name: "Nando"})
    assert payment.sender.name == "Nando"
  end

  test "set_shipping/2" do
    payment = Payment.new |> set_shipping(%Shipping{type: 3})
    assert payment.shipping.type == 3
  end

  test "set_extra_amount/2" do
    payment = Payment.new |> set_extra_amount(40.00)
    assert payment.extra_amount == 40.00
  end

  test "set_redirect_url/2" do
    payment = Payment.new |> set_redirect_url("http://bitly/4922")
    assert payment.redirect_url == "http://bitly/4922"
  end

  test "set_notification_url/2" do
    payment = Payment.new |> set_notification_url("http://bitly/noti")
    assert payment.notification_url == "http://bitly/noti"
  end

  test "set_max_uses/2" do
    payment = Payment.new |> set_max_uses(2)
    assert payment.max_uses == 2
  end

  test "set_max_age/2" do
    payment = Payment.new |> set_max_age(3600)
    assert payment.max_age == 3600
  end

  test "to_request_map/1" do
    items = [%Item{id: "prod-1", description: "my prod 1", amount: 40.00, quantity: 2},
              %Item{id: "prod-2", description: "my prod 2", amount: 4.00, quantity: 3}]

    shipping = %Shipping{type: 3, street: "Boulevard street", city: "Floripa"}

    sender = %Sender{name: "Nando Sousa", email: "email@domain.com"}

    payment = Payment.new |> set_items(items)
                          |> set_currency("BRL")
                          |> set_shipping(shipping)
                          |> set_sender(sender)
                          |> to_request_map

    assert  %{shippingAddressCity: "Floripa",
              shippingAddressStreet: "Boulevard street",
              shippingType: 3, senderName: "Nando Sousa",
              senderEmail: "email@domain.com",
              itemId1: "prod-1", itemDescription1: "my prod 1",
              itemAmount1: 40.00, itemQuantity1: 2,
              itemId2: "prod-2", itemDescription2: "my prod 2",
              itemAmount2: 4.00, itemQuantity2: 3
             } = payment
  end
end
