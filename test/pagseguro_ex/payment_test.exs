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
end
