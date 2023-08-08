defmodule TalkieWeb.APIController do
  use TalkieWeb, :controller

	def ping(conn, _params) do
    Phoenix.PubSub.broadcast!(Talkie.PubSub, "messages",
      %Phoenix.Socket.Broadcast{
        topic: "messages",
        event: "ping",
        payload: {:message, "ping"}
      }
    )
		json(conn, %{pong: true})
  end
end
