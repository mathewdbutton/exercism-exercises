defmodule Bob do
  def hey(input) do
    cond do
      String.length(String.trim(input)) == 0 -> "Fine. Be that way!"
      question?(input) -> "Sure."
      yelling?(input) && question?(input) -> "Calm down, I know what I'm doing!"
      yelling?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  def yelling?(input) do
    input == String.upcase(input)
  end

  def question?(input) do
    String.ends_with?(input, "?")
  end
end
