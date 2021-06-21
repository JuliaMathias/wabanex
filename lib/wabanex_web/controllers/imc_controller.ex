defmodule WabanexWeb.IMCController do
  @moduledoc """
  Actions for the IMC module.
  """

  use WabanexWeb, :controller

  alias Wabanex.IMC

  @spec index(Plug.Conn.t(), map) :: Plug.Conn.t()
  def index(conn, params) do
    params
    |> IMC.calculate()
    |> handle_response(conn)
  end

  defp handle_response({:ok, result}, conn), do: render_response(conn, result, :ok)

  defp handle_response({:error, result}, conn), do: render_response(conn, result, :bad_request)

  defp render_response(conn, result, status) do
    conn
    |> put_status(status)
    |> json(%{result: result})
  end
end
