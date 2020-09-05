defmodule AdorableAvatarsEx.Utils.SizingTest do
  use ExUnit.Case

  alias AdorableAvatarsEx.Utils.Sizing

  describe "value_or_maximum/2" do
    test "returns maximum when value is nil" do
      assert Sizing.value_or_maximum(nil, 400) == 400
    end

    test "returns maximum when value is a string" do
      assert Sizing.value_or_maximum("300", 400) == 400
    end

    test "returns maximum when value is 0" do
      assert Sizing.value_or_maximum(0, 400) == 400
    end

    test "returns value when greater than 0" do
      assert Sizing.value_or_maximum(1, 400) == 1
    end
  end

  describe "size_tuple/1" do
    test "reurns a {w, h} tuple from single tuple string" do
      assert Sizing.size_tuple(["4"]) == { 4, 4 }
    end

    test "reurns a {w, h} tuple from double tuple string" do
      assert Sizing.size_tuple(["4", "7"]) == { 4, 7 }
    end
  end

  describe "clamp/3" do
    test "returns the right thing" do
      assert Sizing.clamp(1, 2, 300) == 2
      assert Sizing.clamp(2, 1, 300) == 2
      assert Sizing.clamp(2, 3, 300) == 3
      assert Sizing.clamp(15, 3, 300) == 15
    end
  end

  describe "parse_size/3" do
    test "defaults to 400x400" do
      assert Sizing.parse_size() == %{ height: 400, width: 400 }
      assert Sizing.parse_size("") == %{ height: 400, width: 400 }
      assert Sizing.parse_size("0") == %{ height: 400, width: 400 }
    end

    test "sets a square if one size is specified" do
      assert Sizing.parse_size("50") == %{ height: 50, width: 50 }
    end

    test "clamps to 40 if smaller" do
      assert Sizing.parse_size("10x50") == %{ height: 50, width: 40 }
      assert Sizing.parse_size("100x20") == %{ height: 40, width: 100 }
    end

    test "clamps to 400 if bigger" do
      assert Sizing.parse_size("500") == %{ height: 400, width: 400 }
      assert Sizing.parse_size("500x200") == %{ height: 200, width: 400 }
      assert Sizing.parse_size("100x500") == %{ height: 400, width: 100 }
    end
  end
end

