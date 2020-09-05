defmodule AdorableAvatarsEx.Utils.Sizing do
  @moduledoc """
  Documentation for AdorableAvatarsEx.Utils.Sizing.
  """

  @doc """
  Get

  ## Examples

      iex> 
  """ 
  def value_or_maximum(value, _maximum) when is_integer(value) and value > 0, do: value
  def value_or_maximum(_value, maximum), do: maximum
 
  def clamp(num, minimum, maximum) do
    safe_num = value_or_maximum(num, maximum)
    min(max(safe_num, minimum), maximum)
  end
 
  def size_tuple([w]), do: size_tuple([w, w]) 
  def size_tuple([w, h]) do
    [w, h]
    |> Enum.flat_map(fn string ->
      case Integer.parse(string) do
        {int, _rest} -> [int]
        :error -> [0]
      end
    end)
    |> List.to_tuple
  end

  def parse_size(raw_size \\ "400", minimum \\ 40, maximum \\ 400) do
    {raw_width, raw_height} =
      raw_size
      |> String.downcase()
      |> String.split("x")
      |> size_tuple

    width = clamp(raw_width, minimum, maximum)
    height = clamp(raw_height, minimum, maximum)

    %{ height: height, width: width }
  end
end


