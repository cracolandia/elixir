defmodule Base.Process do
	
	def init do
		listen 0 
	end

	def listen(state) do
		receive do
			{:message, message} -> 
				IO.puts message
				listen(state)
			{:hello} -> 
				IO.puts "Hello"
				listen(state)
			{:get_state} ->
				new_state = state + 1
				IO.puts "State is #{new_state}"
				listen(new_state)
			_ -> 
				IO.puts "Eh?"
		after
			1_000 -> "Nothig"
		end
	end
end

#Tests

ExUnit.start

defmodule Base.Process.Test do
	use ExUnit.Case, async: true
	# import ExUnit.CaptureIO

	setup do
		pid = spawn fn -> Base.Process.init end
		other_pid = spawn fn -> Base.Process.init end
		{:ok, [pid: pid, other_pid: other_pid]}
	end

	test 'send', context do
		send context[:pid], {:message, "Test"}
		send context[:pid], {:hello}

		send context[:pid], {:get_state}
		send context[:other_pid], {:get_state}
		send context[:pid], {:get_state}
		send context[:other_pid], {:get_state}
	end

	test 'alive?', context do
		assert Process.alive?(context[:pid]) == true
		assert Process.alive?(context[:other_pid]) == true
	end

	test 'kill', context do
		Process.exit(context[:pid], :kill)
		Process.exit(context[:other_pid], :kill)

		assert Process.alive?(context[:pid]) == false
		assert Process.alive?(context[:other_pid]) == false
	end
end