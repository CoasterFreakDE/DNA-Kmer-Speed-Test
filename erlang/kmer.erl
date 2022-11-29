-module(kmer).
-export([calculate/1]).

% Run this in erlang shell:
% c("kmer.erl").
% kmer:calculate(Number).

get_timestamp() ->
  {Mega, Sec, Micro} = os:timestamp(),
  (Mega*1000000 + Sec)*1000 + round(Micro/1000).

calculate(N) ->
  Now = get_timestamp(),
  Kmers = calculate(N, string:copies("A", N), string:copies("T", N)),
  Delta = get_timestamp() - Now,
  io:fwrite("Nummer of generated k-mers: ~p - took ~pms~n", [Kmers, Delta]).

calculate(N, Start, Stop) -> calculate(N, Start, Stop, 1).

calculate(N, Start, Stop, C) -> if
  Start == Stop -> C;
  true -> calculate(N, next(N, Start), Stop, C + 1)
end.

next(N, Start) -> next(N, 1, Start, "T").

next(N, I, Start, "T") ->
  C = string:sub_string(Start, I, I),
  New = convert(C),
  String = string:left(Start, I - 1) ++ New ++ string:right(Start, N - I),
  next(N, I + 1, String, C);
next(_, _, Start, _) -> 
  % io:fwrite("~p~n", [Start]),
  Start.

convert(S) -> case S of
  "A" -> "C";
  "C" -> "G";
  "G" -> "T";
  "T" -> "A";
  _Else -> " "
end.
