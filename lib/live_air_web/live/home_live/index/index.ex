defmodule LiveAirWeb.HomeLive.Index do
  use LiveAirWeb, :surface_live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(params, url, socket) do
    {:noreply,
     socket
     |> assign(:current_path, URI.parse(url).path)
     |> apply_action(socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :new, _params) do

    socket
    |> assign(:page_title, dgettext("home_live", "Home"))
  end
end
