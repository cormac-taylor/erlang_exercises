-module(basic).
-compile(export_all).
-compile(nowarn_export_all).

mult(N1, N2) ->
    N1 * N2.

double(N1) ->
    N1 * 2.

distance({X1,Y1}, {X2,Y2}) ->
    math:sqrt((X1 - X2) * (X1 - X2) + (Y1 - Y2) * (Y1 - Y2)).

my_and(B1, B2) ->
   if 
      B1 and B2 -> 
        true; 
      true -> 
         false
   end.

my_or(B1, B2) ->
   if 
      B1 or B2 -> 
        true; 
      true -> 
         false
   end.

my_not(B) ->
   if 
      not B -> 
        true; 
      true -> 
         false
   end.

fibonacci(I) ->
    case I of
        0 -> 0;
        1 -> 1;
        _ -> fibonacci(I - 1) + fibonacci(I - 2)
    end.

fibonacciTR(I) ->
    fibonacciHelper(I, 0, 1).

fibonacciHelper(I, A, B) ->
    case I of
        0 -> A;
        1 -> B;
        _ -> fibonacciHelper(I - 1, B, A + B)
    end.


sum([]) ->
    0;
sum([H|T]) ->
    H + sum(T).

maximum([H]) ->
    H;
maximum([H1|[H2|T]]) ->
    if H1 > H2 ->
        maximum([H1|T]);
    true ->
        maximum([H2|T])
    end.

zip([],[]) ->
    [];
zip([H1|T1], [H2|T2]) ->
    [{H1, H2}] ++ zip(T1, T2).

append([], L2) ->
    L2;
append([H|T], L2) ->
    [H|append(T, L2)].

reverse([]) ->
    [];
reverse([H|T]) ->
    reverse(T) ++ [H].

evenL([]) ->
    [];
evenL([H|T]) ->
    case H rem 2 of
        0 -> [H|evenL(T)];
        1 -> evenL(T)
    end.

take(N, [H|T]) ->
    case N of
        0 -> [];
        _ -> [H|take(N - 1, T)]
    end.

drop(N, [_|T]) ->
    case N of
        0 -> T;
        _ -> drop(N - 1, T)
    end.

map([], _) ->
    [];
map([H|T], F) ->
    [F(H) | map(T, F)].

filter([], _) ->
    [];
filter([H|T], F) ->
    case F(H) of
        true ->
            [H|filter(T, F)];
        false ->
            filter(T, F)
    end.

foldl(_, [], I) ->
    I;
foldl(F, [H|T], I) ->
    foldl(F, T, F(I, H)).

foldr(_, [], I) ->
    I;
foldr(F, [H|T], I) ->
    F(H, (foldr(F, T, I))).

% make tail recursive
sumTree({empty}) ->
    0;
sumTree({node, N, LT, RT}) ->
    N + sumTree(LT) + sumTree(RT).

mapTree({empty}, _) ->
    {empty};
mapTree({node, N, LT, RT}, F) ->
    {node, F(N), mapTree(LT, F), mapTree(RT, F)}.

foldlTree(_, {empty}, I) ->
    I;
foldlTree(F, {node, N, LT, RT}, I) ->
    foldlTree(F, RT, foldlTree(F, LT, F(N, I))).

foldrTree(_, {empty}, I) ->
    I;
foldrTree(F, {node, N, LT, RT}, I) ->
    F(N, foldrTree(F, RT, foldrTree(F, LT, I))).

mapGTree({node, N, L}, F) ->
    {node, F(N), mapGTreeHelper(L, F)}.

mapGTreeHelper([], _) ->
    [];
mapGTreeHelper([H|T], F) ->
    [mapGTree(H, F)|mapGTreeHelper(T, F)].
