defmodule PagseguroEx.Sender do
  defstruct [:name, :email, :phone]

  @type t :: %__MODULE__{name: binary, email: binary, phone: binary}
end
