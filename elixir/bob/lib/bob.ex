defmodule Bob do
  def hey(input) do
      String.trim(input)
      |> determine_response
  end

  defp determine_response(input) do
    cond do
      nothing?(input) -> "Fine. Be that way!"
      yelling?(input) && question?(input) -> "Calm down, I know what I'm doing!"
      question?(input) -> "Sure."
      yelling?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp nothing?(input) do
    String.length(input) == 0
  end

  defp yelling?(input) do
    input == String.upcase(input) && String.upcase(input) != String.downcase(input)
  end

  defp question?(input) do
    String.ends_with?(input, "?")
  end
end
