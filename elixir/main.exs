defmodule Kmer do
  def convert(?A), do: ?C
  def convert(?C), do: ?G
  def convert(?G), do: ?T
  def convert(?T), do: ?A
  def convert(_), do: ?\s

  def step([head | tail]) when head == ?T, do: [convert(head) | step(tail)]
  def step([head | tail]), do: [convert(head) | tail]
  def step([]), do: []

  def count_until(last, last, counter), do: counter
  def count_until(current, last, counter), do: count_until(step(current), last, counter + 1)
end

case System.argv() do
  [len_str | _] ->
    len = String.to_integer(len_str)
    current = List.duplicate(?A, len)
    last = List.duplicate(?T, len)

    start = System.monotonic_time(:millisecond)
    counter = Kmer.count_until(current, last, 1)
    delta = System.monotonic_time(:millisecond) - start

    IO.puts("Number of generated k-mers: #{counter} - took #{delta}ms")

  _ ->
    IO.puts("Usage: elixir_kmer <length>")
end
