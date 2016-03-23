# Module

defmodule Base do
	def divisor?(a, 0) do
		{:Error, 'Division by zero'}
	end

	def divisor?(a, b) do
		a / b
	end
	
	def multiply(a, b) do
		a * b
	end

	def sum(a, b) do
		a + b
	end

	def subtract(a, b) do
		a - b
	end
end

# Tests

ExUnit.start

defmodule BaseTest do
	use ExUnit.Case

	test 'divisor' do
		assert Base.divisor?(1, 0) == {:Error, 'Division by zero'}
		assert Base.divisor?(2, 2) == 1
	end

	test 'multiply' do
		assert Base.multiply(2, 2) == 4
	end

	test 'sum' do
		assert Base.sum(1, 1) == 2
	end

	test 'subtract' do
		assert Base.subtract(1, 1) == 0
	end
end