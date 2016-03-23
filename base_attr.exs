# Module

defmodule Base do
	# Attributes
	@deck []
	@faces %{11 => 'J', 12 => 'Q', 13 => 'K', 1 => 'A'}

	# Properties
	def deck, do: @deck


	# Macros
	def face?(x) when x > 1 and x < 11 do
		x
	end

	def face?(x) do
		@faces[x]
	end
end

# Tests
ExUnit.start

defmodule BaseTest do
	use ExUnit.Case

	test 'deck initial' do
		assert Base.deck == []
	end

	test 'faces' do
		for n <- 2..10, do: assert Base.face?(n) == n
		for {l, n} <- %{'A' => 1, 'J' => 11, 'Q' => 12, 'K' => 13}, do: assert Base.face?(n) == l
	end
end