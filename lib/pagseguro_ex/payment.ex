defmodule PagseguroEx.Payment do
  @moduledoc """
  Module response for payment creation.
  See: https://pagseguro.uol.com.br/v2/guia-de-integracao/api-de-pagamentos.html
  """

  alias PagseguroEx.{Sender, Shipping}

  defstruct [:currency, :items, :reference, :sender, :shipping, :extra_amount,
             :redirect_url, :notification_url, :max_uses, :max_age]

  @type t :: %__MODULE__{currency: binary,
                         items: any,
                         reference: binary,
                         sender: Sender.t,
                         shipping: Shipping.t,
                         extra_amount: number,
                         redirect_url: binary,
                         notification_url: binary,
                         max_uses: integer,
                         max_age: integer
                        }

  def new do
    %PagseguroEx.Payment{} |> set_currency("BRL")
  end

  def set_currency(payment, currency) do
    payment |> Map.put(:currency, currency)
  end

  def set_reference(payment, reference) do
    payment |> Map.put(:reference, reference)
  end

  def set_items(payment, items) do
    payment |> Map.put(:items, items)
  end

  def set_sender(payment, sender) do
    payment |> Map.put(:sender, sender)
  end

  def set_shipping(payment, shipping) do
    payment |> Map.put(:shipping, shipping)
  end

  def set_extra_amount(payment, extra_amount) do
    payment |> Map.put(:extra_amount, extra_amount)
  end

  def set_redirect_url(payment, redirect_url) do
    payment |> Map.put(:redirect_url, redirect_url)
  end

  def set_notification_url(payment, notification_url) do
    payment |> Map.put(:notification_url, notification_url)
  end

  def set_max_uses(payment, max_uses) do
    payment |> Map.put(:max_uses, max_uses)
  end

  def set_max_age(payment, max_age) do
    payment |> Map.put(:max_age, max_age)
  end

  def to_request_map(payment) do
    %{
      currency: payment.currency,
      reference: payment.reference,
      extraAmount: payment.extra_amount,
      redirectURL: payment.redirect_url,
      notificationURL: payment.notification_url,
      maxUses: payment.max_uses
    } |> Map.merge(Sender.to_request_map(payment.sender))
      |> Map.merge(Shipping.to_request_map(payment.shipping))
      |> Map.merge(items_to_request_map(payment))
  end

  def items_to_request_map(payment) do
    payment.items
    |> Enum.with_index
    |> Enum.reduce(%{}, fn({item, index},acc) ->
      acc |> Map.put(:"itemId#{index + 1}", item.id)
          |> Map.put(:"itemDescription#{index + 1}", item.description)
          |> Map.put(:"itemAmount#{index + 1}", Float.to_string(item.amount, decimals: 2))
          |> Map.put(:"itemQuantity#{index + 1}", item.quantity)
    end)
  end
end
