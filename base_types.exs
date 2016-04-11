ExUnit.start

defmodule BaseTypesTest do
	use ExUnit.Case

	test 'basic types atom' do
		assert is_atom(:"atom")
	end

	test 'basic types binary' do
		assert is_binary(<<0, 255>>)
	end

	test 'basic types bitstring' do
		assert is_bitstring(<<"string">>)
	end

	test 'basic types boolean' do
		assert is_boolean(false)
	end

	test 'basic types float' do
		assert is_float(1.0)
		assert is_float(1.0e-10)
	end

	test 'basic types function' do
		assert is_function(fn(x)-> x end, 1)
		assert is_function(fn(x, y) -> x + y end, 2)
	end

	test 'basic types integer' do
		assert is_integer(1)
		assert is_integer(0b11)
		assert is_integer(0o77)
		assert is_integer(0xFF)
		assert is_integer(0xFF)
	end

	test 'basic types list' do
		assert is_list([1, 2, 3])
	end

	test 'basic types map' do
		assert is_map(%{:key => "value"})
	end

	test 'basic types nil' do
		assert is_nil(nil)
	end

	test 'basic types number' do
		assert is_number(1)
	end

	test 'basic types pid' do
		assert is_pid(self())
	end

	test 'basic types port' do
		# assert is_port()
	end

	test 'basic types reference' do
		# assert is_reference()
	end

	test 'basic types string' do
		assert is_bitstring("string")
		assert "string" == "str"<>"ing"
		assert "string" == "#{"string"}"
	end

	test 'basic types tuple' do
		assert is_tuple({:key, "value"})
	end

	test 'basic types arithmetic' do
		assert 1 != "1"
		assert 1 !== "1"

		assert +1 == 1
		assert -1 == -1

		assert 1+1 == 2
		assert 1-1 == 0
		assert 1*1 == 1
		assert 1/1 == 1

		assert ([1] ++ [2]) == [1, 2]
		assert ([1] -- [1]) == []
	end

	test 'basic types comparasion' do
		assert 1<2
		assert 2>1
		assert 1<=2
		assert 2>=1
		assert 1==1
		assert 1===1
	end

	test 'basic types some functions' do
		# Regex
		assert "string" =~ ~r/string/

		assert abs(-1) == 1
		assert apply(fn x -> x * 2 end, [1])
		assert apply(Kernel, :is_integer, [1])
		assert binary_part(<<1, 255>>, 1, 1) == <<255>>
		assert bit_size(<<"b">>) == byte_size(<<"B">>) * 8
		assert div(1, 2) == 0
		assert elem({false, true}, 1)
		# assert exit(1)
		assert function_exported?(Enum, :count, 1)
		# get_and_update_in(%{"key" => %{at: 1}}, ["key", :at], &{&1, &1 + 1})
		assert hd([true, false])
		assert length([1, 2, 3]) == 3
		assert map_size(%{:key => "value"}) == 1
		assert max(true, false)
		assert !min(true, false)
	end
end
