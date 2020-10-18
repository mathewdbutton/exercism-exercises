defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer

  def hamming_distance(strand1, strand2) when length(strand1) == length(strand2) do
   {:ok, find_difference(strand1, strand2, 0)}
  end

  defp find_difference([strand1_head | strand1_tail], [strand2_head | strand2_tail], count) do
    difference = if strand1_head != strand2_head, do: 1, else: 0
    find_difference(strand1_tail, strand2_tail, count + difference)
  end

  defp find_difference([], [], count) do
    count
  end

  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) do
   {:error, "Lists must be the same length"}
  end
end
