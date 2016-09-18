defmodule PagseguroEx.Shipping do
  defstruct [:type, :cost, :street, :number, :complement,
             :district, :city, :state, :country, :postal_code]

  @type t :: %__MODULE__{type: integer, cost: number, street: binary,
                         number: binary, complement: binary, district: binary,
                         city: binary, state: binary, country: binary,
                         postal_code: integer
                       }

  def to_request_map(shipping) do
    %{
      shippingType: shipping.type,
      shippingCost: shipping.cost,
      shippingAddressStreet: shipping.street,
      shippingAddressNumber: shipping.number,
      shippingAddressComplement: shipping.complement,
      shippingAddressDistrict: shipping.district,
      shippingAddressCity: shipping.city,
      shippingAddressState: shipping.state,
      shippingAddressCountry: shipping.country,
      shippingAddressPostalCode: shipping.postal_code
    }
  end
end
