defmodule TalkieWeb.ViewerLive.Index do
  use TalkieWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <h1>Messages</h1>

    <%= for msg <- @messages do %>
      <span><%= msg %></span><br />
    <% end %>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    TalkieWeb.Endpoint.subscribe("messages")
    {:ok, assign(socket, :messages, [])}
  end

  @impl true
  def handle_info({:message, msg}, socket) do
    {:noreply, assign(socket, :messages, [msg | socket.assigns.messages])}
  end

  @impl true
  def handle_info(
    %Phoenix.Socket.Broadcast{
      topic: "messages",
      event: "ping",
      payload: {:message, msg}
    }, socket) do

    handle_info({:message, msg}, socket)
  end
end
