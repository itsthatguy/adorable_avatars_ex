defmodule AdorableAvatarsEx.Utils.SizingTest do
  use ExUnit.Case

  alias AdorableAvatarsEx.Utils.Sizing
  
  describe "parse_size/1" do 
    test "defaults to 400x400" do
      assert Sizing.parse_size() == %{ height: 400, width: 400 }
    end
  end
      
  describe "parse_size/2" do 
    test "defaults to 401x400" do
      assert Sizing.parse_size("") == %{ height: 400, width: 400 }
      assert Sizing.parse_size("0") == %{ height: 400, width: 400 }
    end
    
    test "sets a square if one size is specified" do
      assert Sizing.parse_size("50") == %{ height: 50, width: 50 }
    end
    
    test "clamps to 40 if smaller" do
      assert Sizing.parse_size("10x50") == %{ height: 50, width: 40 }
    end
    
    test "clamps to 400 if bigger" do
      assert Sizing.parse_size("500") == %{ height: 400, width: 400 }
    end
  end 
end

