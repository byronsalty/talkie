defmodule TalkieWeb.APIController do
  alias Phoenix.PubSub
	use TalkieWeb, :controller

	def ping(conn, _params) do
    # TalkieWeb.Endpoint.broadcast!("messages", "ping", {:message, "pinged"})
    PubSub.broadcast!(Talkie.PubSub, "messages",
      %Phoenix.Socket.Broadcast{
        topic: "messages",
        event: "ping",
        payload: {:message, "ping"}
      }
    )
		json(conn, %{pong: true})
    end
end
