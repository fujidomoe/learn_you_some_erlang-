-module(hhfuns).
-compile(export_all).

% 8.高級関数
one() -> 1.
two() -> 2.
add(X, Y) -> X() + Y().


increment([]) -> [];
increment([H|T]) -> [H+1|increment(T)].
decrement([]) -> [];
decrement([H|T]) -> [H-1|decrement(T)].
% hhfuns:decrement([3,2,1]).
% [4,3,2]


map(_, []) -> [];
map(F,[H|T]) -> [F(H)|map(F,T)].
incr(X) -> X + 1.
decr(X) -> X - 1.

%  L = [1,2,3,4,5].
% hhfuns:map(fun hhfuns:incr/1, L).
% [2,3,4,5,6]
% 抽象化できたけど、渡したい関数を常にモジュールに書いて〜っというのはじれったいですよね@参考書

% 8.2無名関数
% 無名関数、あるいはfunは、名前をつけないでも特別なインライン関数を宣言することができようるようにするｋとで先程の問題を解決してくれます。
