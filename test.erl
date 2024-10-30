-module(test).
-export([take/2]).
-include_lib("eunit/include/eunit.hrl").

take(_,[]) -> [].
take_1_test () ->
    ?assertEqual(take(0,[]),[]).

take_2_test () ->
    ?assertEqual(take(0,[1,2,3]),[]).