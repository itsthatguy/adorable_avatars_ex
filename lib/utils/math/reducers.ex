defmodule AdorableAvatarsEx.Utils.Reducers do
  @moduledoc """
  Documentation for AdorableAvatarsEx.Utils.Reducers.
  """

  @doc """
  Returns the sum of all elements.

  ## Examples

      iex> AdorableAvatarsEx.Utils.Reducers.sum([])
      0

      iex> AdorableAvatarsEx.Utils.Reducers.sum([1, 2, 3])
      6
  """
  def sum(arr) do
    Enum.sum(arr)
  end

  @doc """
  Returns the product of all elements.

  ## Examples

      iex> AdorableAvatarsEx.Utils.Reducers.product([])
      1

      iex> AdorableAvatarsEx.Utils.Reducers.product([1, 2, 3, 4])
      24
  """
  def product([]) do
    1
  end

  def product(arr) when length(arr) > 0 do
    Enum.reduce(arr, 1, fn x, acc -> x * acc end)
  end

  @doc """
  Returns the product of all elements.

  ## Examples

      iex> AdorableAvatarsEx.Utils.Reducers.sum_and_diff([])
      0

      iex> AdorableAvatarsEx.Utils.Reducers.sum_and_diff([1, 2, 3, 4])
      -2
  """
  def sum_and_diff(arr) do
    import Integer, only: [is_even: 1]

    arr
    |> Enum.with_index
    |> Enum.reduce(0, fn({x, index}, acc) ->
      if Integer.is_even(index) do
        acc + x
      else
        acc - x
      end
    end)
  end
end
