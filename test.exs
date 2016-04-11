defmodule Sse do
  import Plug.Conn
  use Plug.Router
  
  plug :match
  plug :dispatch
  
  get "/" do
    conn
    |> put_resp_header("content-type", "text/html")
    |> send_file(200, "priv/static/index.html")
  end
  
  get "/sse" do
    conn = put_resp_header(conn, "content-type", "text/event-stream")
    conn = send_chunked(conn, 200)
    
    send_message(conn, "Look, Ma'! I'm streaming!")
    :timer.sleep(1000)
    send_message(conn, "It only took two lines of code!")
    :timer.sleep(1000)
    send_message(conn, "All you have to do is set a header and chunk the response!")
    :timer.sleep(1000)
    send_message(conn, "Bye now!")
    conn
  end
  
  defp send_message(conn, message) do
    chunk(conn, "event: \"message\"\n\ndata: {\"message\": \"#{message}\"}\n\n")
  end
end

# Run with mix run --no-halt lib/sse.ex
Plug.Adapters.Cowboy.http Sse, [], port: 4000