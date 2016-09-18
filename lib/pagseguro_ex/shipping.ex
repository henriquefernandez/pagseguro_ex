defmodule PagseguroEx.Shipping do
  defstruct [:type, :cost, :street, :number, :complement,
             :district, :city, :state, :country]

  @type t :: %__MODULE__{type: integer, cost: number, street: binary,
                         number: binary, complement: binary, district: binary,
                         city: binary, state: binary, country: binary
                        }
end
