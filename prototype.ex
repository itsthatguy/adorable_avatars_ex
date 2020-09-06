defmodule FS do
  def files(dir) do
    Path.wildcard(dir)
  end

  def file_names(dir) do
    dir
    |> files
    |> Enum.map(fn name_with_extension ->
      String.replace(name_with_extension, ~r/\.\w+$/, "")
    end)
  end
end

defmodule Hasher do
  def sum(charlist) do
    charlist
    |> String.to_charlist
    |> Enum.reduce(fn x, acc ->
      acc + x
    end)
  end

  def product(charlist) do
    charlist
    |> String.to_charlist
    |> Enum.reduce(fn x, acc ->
      acc * x
    end)
  end

  def sum_and_diff(charlist) do
    import Integer, only: [is_even: 1]

    charlist
    |> String.to_charlist
    |> Enum.with_index
    |> Enum.reduce(0, fn({x, index}, acc) ->
      if is_even(index) do
        acc + x
      else
        acc - x
      end
    end)
  end
end

defmodule Nose, do: defstruct hash: &Hasher.sum/1, list: FS.files("./assets/static/images/nose/*.png")
defmodule Mouth, do: defstruct hash: &Hasher.sum/1, list: FS.files("./assets/static/images/mouth/*.png")
defmodule Eyes, do: defstruct hash: &Hasher.sum/1, list: FS.files("./assets/static/images/eyes/*.png")
defmodule Color, do: defstruct hash: &Hasher.sum_and_diff/1, list: [
  "#81bef1",
  "#ad8bf2",
  "#bff288",
  "#de7878",
  "#a5aac5",
  "#6ff2c5",
  "#f0da5e",
  "#eb5972",
  "#f6be5d",
]

defmodule Part do
  def create(:nose, string), do: create(%Nose{}, string)
  def create(:mouth, string), do: create(%Mouth{}, string)
  def create(:eyes, string), do: create(%Eyes{}, string)
  def create(:color, string), do: create(%Color{}, string)
  def create(part, string) do
    key = part.hash.(string)
    index = index_for(part.list, key)

    Enum.at(part.list, index)
  end

  def index_for(list, key) do
    rem(key, length(list))
  end
end

defmodule Face do
  def create(string) do
    %{
      nose: Part.create(:nose, string),
      eyes: Part.create(:eyes, string),
      mouth: Part.create(:mouth, string),
      color: Part.create(:color, string),
    }
  end
end

defmodule Butt do
  def main do
    IO.inspect(Face.create("ke"))
  end
end

Butt.main()
