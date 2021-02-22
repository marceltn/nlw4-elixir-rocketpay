defmodule RocketpayWeb.WelcomeController do
  use RocketpayWeb, :controller

  def index(conn, _params) do
    conn
      |> text("Welcome to the Rocketpay API")
  end
end
