# Module

defmodule Base do
	def list_head(list) do
		[head | _] = list
		head
	end

	def list_tail(list) do
		[_ | tail] = list
		tail
	end

	def list_except(list, e) do
		Enum.filter list, &_EXCEPT(&1, e)
	end

	def list_filter(list, func) do
		Enum.filter list, func
	end

	def list_greater_than(list, e) do
		Enum.filter list, &_GREATER_THAN(&1, e)
	end

	def list_less_than(list, e) do
		Enum.filter list, &_LESS_THAN(&1, e)
	end

	# FUNC
	def _ODD(x) do
		!_EVEN(x)
	end

	def _EVEN(x) do
		rem(x, 2) == 0
	end

	def _EXCEPT(x, e) do
		x != e
	end

	def _GREATER_THAN(x, e) do
		x > e
	end

	def _LESS_THAN(x, e) do
		x < e
	end
end

# Tests

ExUnit.start

defmodule BaseTest do
	use ExUnit.Case

	def list_string do
		["a", "b", "c"]
	end	

	def list_integer do
		[1, 2, 3]
	end

	test 'head' do
		assert Base.list_head(list_string) == "a"
		assert Base.list_head(list_integer) == 1
	end

	test 'tail' do
		assert Base.list_tail(list_string) == ["b", "c"]
		assert Base.list_tail(list_integer) == [2, 3]
	end

	test 'except' do
		assert Base.list_except(list_string, "b") == ["a", "c"]
		assert Base.list_except(list_integer, 2) == [1, 3]
	end

	test 'greater_than' do
		assert Base.list_greater_than(list_string, "a") == ["b", "c"]
		assert Base.list_greater_than(list_integer, 1) == [2, 3]
	end

	test 'less_than' do
		assert Base.list_less_than(list_string, "c") == ["a", "b"]
		assert Base.list_less_than(list_integer, 3) == [1, 2]
	end

	test 'filter_with_function' do
		assert Base.list_filter(list_integer, &Base._ODD/1) == [1, 3]
		assert Base.list_filter(list_integer, &Base._EVEN/1) == [2]
	end
end