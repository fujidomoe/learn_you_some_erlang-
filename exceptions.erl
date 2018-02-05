-module(exceptions).
-compile(export_all).

throws(F) ->
    try F() of
        _-> ok
    catch
        Throw -> {throw, caught, Throw}
    end.
% exceptions:throws(fun() -> throw(thrown) end).
% {throw,caught,thrown}    

% exceptions:throws(fun() -> erlang:error(pang) end).
% ** exception error: pang

errors(F) ->
    try F() of
        _-> ok
    catch
        error:Error -> {error, caught, Error}
    end.
% exceptions:errors(fun() -> erlang:error("Die!") end).
% {error,caught,"Die!"}

exits(F) ->
    try F() of
        _-> ok
    catch
        exit:Exit -> {exit, caught, Exit}
    end.
% exceptions:exits(fun() -> exit(googbye) end).
% {exit,caught,googbye}    

talk() -> "blah blah".
sword(1) -> throw(slice);
sword(2) -> erlang:error(cut_arm);
sword(3) -> exit(cut_leg);
sword(4) -> throw(punch);
sword(5) -> exit(cross_bridge).

black_knight(Attack) when is_function(Attack, 0) ->
    try Attack() of
        _ -> "None shall pass."
    catch
       throw:slice -> "It is but a scratch.";
       error:cut_arm -> "I've had worse.";
       exit:cut_leg -> "Come on you pansy!";
       _:_ -> "Just a flesh wound." %% _:_パターンはどんなタイプの例外も確実にキャッチする時に使います
    end.

im_impressed() ->
        try
            talk(),
            _Knight = "None shall Pass!",
            _Doubles = [N*2 || N <- lists:seq(1,100)],
            throw(up),
            _WillReturnThis = tequila
        catch
            Exception:Reason -> {caught, Exception, Reason}
        end.