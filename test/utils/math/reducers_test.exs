defmodule AdorableAvatarsEx.Utils.ReducersTest do
  use ExUnit.Case

  alias AdorableAvatarsEx.Utils.Reducers

  describe "sum" do
    test "reduces an empty array to 0" do
      assert Reducers.sum('foo') == :butt
    end

    test "reduces an array to an integer" do
      assert Reducers.sum('foo') == :butt	
    end
  end 
  describe "product" do
    test "reduces an empty array to 1" do
      assert Reducers.product('foo') == :butt	
    end
   
    test "reduces an array to an integer" do
      assert Reducers.product('foo') == :butt	
    end
  end
  describe "sum_and_diff" do
    test "reduces an empty array to 1" do
      assert Reducers.sum_and_diff('foo') == :butt	
    end

    test "reduces an array to an integer" do
      assert Reducers.sum_and_diff('foo') == :butt	
    end
  end
end
