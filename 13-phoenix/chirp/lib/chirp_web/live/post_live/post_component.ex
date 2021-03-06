defmodule ChirpWeb.PostLive.PostComponent do
  use ChirpWeb, :live_component

  alias Chirp.Timeline
  alias Chirp.Timeline.Post

  def render(assigns) do
    ~L"""
    <div id="post-<%= @post.id %>" class="card">
      <div class="card-content">
        <div  class="row">
          <div class="col xs3">
            <div>
              <img src="http://lorempixel.com/60/60" />
            </div>
          </div>
          <div class="col xs9">
            <b>@<%= @post.username %></b>
            <br/>
            <%= @post.body %>
          </div>
        </div>
        <div class="card-title activator grey-text text-darken-4 row">
          <span class="col col-s3">
            <%= live_patch to: Routes.post_index_path(@socket, :edit, @post) do %>
              <i class="material-icons">create</i>
            <% end %>
          </span>
          <span class="col col-s3">
            <%= link to: "#", phx_click: "delete", phx_value_id: @post.id, data: [confirm: "Are you sure?"] do %>
              <i class="material-icons">delete</i>
            <% end %>
          </span>
          <span class="col col-s3">
            <a href="#" phx-click="like" phx-target="<%= @myself %>">
              <%= @post.like_count %>
              <i class="material-icons">thumb_up</i>
            </a>
          </span>
          <span class="col col-s3">
            <a href="#" phx-click="report" phx-target="<%= @myself %>">
              <%= @post.reports_count %>
              <i class="material-icons">not_interested</i>
            </a>
          </span>
        </div>
      </div>
    </div>
    """
  end

  def handle_event("like", _, socket) do
    Chirp.Timeline.inc_likes(socket.assigns.post)
    {:noreply, socket}
  end

  def handle_event("report", _, socket) do
    Chirp.Timeline.inc_reports(socket.assigns.post)
    {:noreply, socket}
  end
end
