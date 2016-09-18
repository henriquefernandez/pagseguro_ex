defmodule PagseguroEx.Item do
  defstruct [:id, :description, :amount, :quantity, :weigth]

  @type t :: %__MODULE__{id: binary, description: binary,
                         amount: number, quantity: integer,
                         weigth: integer}
end
