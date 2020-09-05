defmodule AdorableAvatarsEx.Utils.ReducersTest do
  use ExUnit.Case

  alias AdorableAvatarsEx.Utils.Reducers

  describe "hashing" do
    describe "sum" do
      test "reduces an empty array to 0" do
        assert Reducers.get('foo') == 'd'
      end

      test "reduces an array to an integer" do
        assert Reducers.get('foo') == 'd'
      end
    end 
    describe "product" do
      test "reduces an empty array to 1" do
        assert Reducers.get('foo') == 'd'
      end
     
      test "reduces an array to an integer" do
        assert Reducers.get('foo') == 'd'
      end
    end
    describe "sum_and_diff" do
      test "reduces an empty array to 1" do
        assert Reducers.get('foo') == 'd'
      end

      test "reduces an array to an integer" do
        assert Reducers.get('foo') == 'd'
      end
    end
  end
end
