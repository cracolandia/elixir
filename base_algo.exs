defmodule Base.Algo do
	@moduledoc """
		Documentation of module current	
	"""


	@doc """
		# Problem: get element at in array
	"""
	def element_at([found | _], 1), do: found
	def element_at([_ | rest], index) when index > 1 do
		element_at rest, index - 1
	end

	@doc """
		# Problem: Append semi colon
	"""
	def append_semicolon(message, 1, accumulator), do: accumulator <> message
	def append_semicolon(message, n, accumulator \\ "") do
		append_semicolon message, n - 1, accumulator <> message <> ";"
	end

	@doc """
		# Problem: sum all number
	"""
	def sum_recursion([], accumulator), do: accumulator
	def sum_recursion([head | tail], accumulator \\ 0) do
		sum_recursion tail, accumulator + head
	end
end

# Tests
ExUnit.start 
defmodule Base.Algo.Test do
	use ExUnit.Case

	test 'element_at' do
		list = ['A', 'B', 'C', 'D', 'E']
		assert Base.Algo.element_at(list, 3) == 'C'
	end

	test 'append_semicolon' do
		assert Base.Algo.append_semicolon("T", 3) == "T;T;T"
	end

	test 'sum_recursion' do
		assert Base.Algo.sum_recursion([1,2,3]) == 6
	end
end