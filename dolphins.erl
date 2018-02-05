-module(dolphins).
-compile(export_all).

% 12.4 さようなら、いままで魚をありがとう！
dolphin1() ->
    receive
        do_a_flip ->
            io:format("How about no? ~n");
        fish ->
            io:format("So long and thanks for all the fish ~n");
        _->
            io:format("Heh, were smarter than you humans ~n")
    end.

% 毎回プロセスを立ち上がる必要がある
dolphin2() ->
    receive
        {From, do_a_flip} ->
            From ! "How about no?";
        {From, fish} ->
            From ! "So long and thanks for all the fish!";
        _->
            io:format("Heh, were smarter than you humans. ~n")
    end.

% 常にメッセージを受けとれるジョウタいにする
dolphin3() ->
    receive
        {From, do_a_flip} ->
            From ! "How about no?";
        {From, fish} ->
            From ! "So long and thanks for all the fish!";
        _->
            io:format("Heh, were smarter than you humans. ~n"),
            dolphin3()
    end.
    