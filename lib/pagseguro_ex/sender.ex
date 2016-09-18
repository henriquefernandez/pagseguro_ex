defmodule PagseguroEx.Sender do
  defstruct [:name, :email, :area_code, :phone]

  @type t :: %__MODULE__{name: binary, email: binary, area_code: integer, phone: binary}

  def to_request_map(sender) do
    %{
      senderName: sender.name,
      senderEmail: sender.email,
      senderAreaCode: sender.area_code,
      senderPhone: sender.phone,
    }
  end
end
