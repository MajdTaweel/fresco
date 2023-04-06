defmodule FrescoWeb.Subdomain.PageController do
  use FrescoWeb, :controller

  def home(conn, _params) do
    render(conn, :home, layout: false, subdomain: conn.private[:subdomain])
  end
end
