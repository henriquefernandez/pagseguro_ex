defmodule PagseguroEx.Client do
  defstruct email: "", token: ""

  @type t :: %__MODULE__{email: binary, token: binary}

  @spec new(binary, binary) :: t
  def new(email, token) do
    %__MODULE__{email: email, token: token}
  end
end
