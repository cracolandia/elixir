# Module

defmodule Base.Math do

	def absolute(a), do: abs(a)
	def divisor?(a, 0), do: {:Error, 'Division by zero'}
	def divisor?(a, b) when is_float(a) or is_float(b), do: a / b 
	def divisor?(a, b), do: div a, b
	def multiply(a, b), do: a * b 
	def rest(a, b), do: rem a, b
	def roundable(a), do: round a
	def sum(a, b), do: a + b
	def subtract(a, b), do: a - b
	def truncate(a), do: trunc a

end

# Tests

ExUnit.start

defmodule Base.Math.Test do
	use ExUnit.Case

	test 'absolute' do
		assert Base.Math.absolute(-1) == 1
	end

	test 'divisor' do
		assert Base.Math.divisor?(1, 0) == {:Error, 'Division by zero'}
		assert Base.Math.divisor?(2, 2) == 1
		assert Base.Math.divisor?(3.0, 2) == 1.5
		assert Base.Math.divisor?(3, 2.0) == 1.5
		assert Base.Math.divisor?(3.0, 2.0) == 1.5
	end

	test 'multiply' do
		assert Base.Math.multiply(2, 2) == 4
	end

	test 'rest' do
		assert Base.Math.rest(10, 3) == 1	
	end

	test 'roundable' do
		assert Base.Math.roundable(1.4) == 1
		assert Base.Math.roundable(1.5) == 2
	end

	test 'sum' do
		assert Base.Math.sum(1, 1) == 2
	end

	test 'subtract' do
		assert Base.Math.subtract(1, 1) == 0
	end

	test 'truncate' do
		assert Base.Math.truncate(1.9) == 1
	end
end