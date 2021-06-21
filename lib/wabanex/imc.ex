defmodule Wabanex.IMC do
  @moduledoc """
  Calculates the IMC.
  """
  def calculate(filename) do
    filename
    |> File.read()
    |> handle_file()
  end

  def handle_file({:ok, content}) do
    content
  end

  def handle_file({:error, _reason}) do
    {:error, "Error while opening file."}
  end
end
