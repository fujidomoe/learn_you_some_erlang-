-module(gard).
-compile(export_all).

old_enough(X) when X >= 16 ->
    true;

old_enough(_) ->
    false.

right_age(X) when X >= 16, X < 104  % カンマは if文における and を意味する
    -> true;

right_age(_) ->
    false.

wrong_age(X) when X < 16; X > 104 -> % セミコロンは if文における or を意味する
    true; 

wrong_age(_) ->
    false.

%% if式はガード
oh_god(N) ->
    if N =:= 2 -> might_succeed;        
        true -> always_does %% this is Erlang's if's 'else!'
    end.

help_me(Animal) ->
    Talk = if Animal == cat -> "meow";
        Animal == beef -> "mooo";
        Animal == dog -> "bark";
        Animal == tree -> "bark2";
        true -> "HOGEHOGE"
        end,
    {Animal, "says " ++ Talk ++ "!"}.

% case of 式は関数のようです。引数を持った複雑なパターンマッチや、その上にガードする持てるのです!
% boolな結果を覗いては、関数の中に処理をもりもり書くよりも関数を沢山実装するほうがErlangぽいらしい

beachf({celsius,N}) when N >= 20, N =< 45 ->
    'favalite';
beachf(_) ->
    'avoid beach'.