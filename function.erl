-module(function).
-export([greet/2]).

greet(male, Name) ->
    io:format("Hello, Mr. ~s!", [Name]);

greet(famale, Name) ->
    io:format("Hello, Mrs. ~s!", [Name]);

greet(_, Name) ->
    io:format("Hello, ~s!", [Name]).
