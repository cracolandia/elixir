# Module

defmodule Base.List do
	def head(list) do
		[head | _] = list
		head
	end

	def tail(list) do
		[_ | tail] = list
		tail
	end

	def except(list, e) do
		Enum.filter list, &_EXCEPT(&1, e)
	end

	def odd(list), do: Enum.filter list, &_ODD/1
	
	def even(list), do: Enum.filter list, &_EVEN/1

	def greater_than(list, e) do
		Enum.filter list, &_GREATER_THAN(&1, e)
	end

	def less_than(list, e) do
		Enum.filter list, &_LESS_THAN(&1, e)
	end

	# FUNC
	def _EVEN(x), do: rem(x, 2) == 0
	def _EXCEPT(x, e), do: x != e
	def _GREATER_THAN(x, e), do: x > e
	def _LESS_THAN(x, e), do: x < e
	def _ODD(x), do: !_EVEN(x)

end

# Tests

ExUnit.start

defmodule Base.List.Test do
	use ExUnit.Case

	def string do
		["a", "b", "c"]
	end	

	def integer do
		[1, 2, 3]
	end

	test 'head' do
		assert Base.List.head(string) == "a"
		assert Base.List.head(integer) == 1
	end

	test 'tail' do
		assert Base.List.tail(string) == ["b", "c"]
		assert Base.List.tail(integer) == [2, 3]
	end

	test 'except' do
		assert Base.List.except(string, "b") == ["a", "c"]
		assert Base.List.except(integer, 2) == [1, 3]
	end

	test 'greater_than' do
		assert Base.List.greater_than(string, "a") == ["b", "c"]
		assert Base.List.greater_than(integer, 1) == [2, 3]
	end

	test 'less_than' do
		assert Base.List.less_than(string, "c") == ["a", "b"]
		assert Base.List.less_than(integer, 3) == [1, 2]
	end

	test 'filter_odd' do
		assert Base.List.odd(integer) == [1, 3]
	end

	test 'filter_even' do
		assert Base.List.even(integer) == [2]
	end
end