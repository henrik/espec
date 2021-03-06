defmodule ESpec.Assertions.Dict.HaveValue do

  use ESpec.Assertions.Interface

  defp match(dict, val) do
    result = Enum.member?(Dict.values(dict), val)
    {result, result}
  end

  defp success_message(dict, val, _result, positive) do
    to = if positive, do: "has", else: "doesn't have"
    "`#{inspect dict}` #{to} value `#{inspect val}`."
  end 

  defp error_message(dict, val, _result, positive) do
    to = if positive, do: "to", else: "to not"
    but = if positive, do: "has not", else: "has"
    "Expected `#{inspect dict}` #{to} have value `#{inspect val}` but it #{but}."
  end

end
