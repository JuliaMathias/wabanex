defmodule Wabanex.IMC do
  @moduledoc """
  Calculates the IMC.
  """
  def calculate(%{"filename" => filename}) do
    filename
    |> File.read()
    |> handle_file()
  end

  def handle_file({:ok, content}) do
    data =
      content
      |> String.split("\n")
      |> Enum.map(fn line -> parse_line(line) end)
      |> Enum.into(%{})

    {:ok, data}
  end

  def handle_file({:error, _reason}) do
    {:error, "Error while opening file."}
  end

  defp parse_line(line) do
    line
    |> String.split(",")
    |> List.update_at(1, &String.to_float/1)
    |> List.update_at(2, &String.to_float/1)
    |> calculate_imc()
  end

  defp calculate_imc([name, height, weight]), do: {name, weight / (height * height)}
end
