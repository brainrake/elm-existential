module Main exposing (..)

import Counter exposing (..)
import Html exposing (text)


-- -- won't compile:  Hide a is not exported
-- incTwiceCantUse : Counter (Hide Int) -> Counter (Hide Int)
-- incTwiceCantUse c =
--    inc c |> inc c


incTwiceCantUse : Counter Int -> (Int -> Int)
incTwiceCantUse c =
    -- won't work
    -- - Can never have Counter Int
    -- - Hide a is not exported
    inc c >> inc c


-- this is fine
incTwice : Counter a -> (a -> a)
incTwice c =
    inc c >> inc c

main : Html.Html m
sg
main =
    text (toString (zero intCounter |> incTwice intCounter |> val intCounter))


-- result : you can only write down usable functions that use Counter if you leave the type variable abstract
-- it's like existential types, but with explicit tracking of the unusable type variable
-- not very useful because the type variable can't be abstracted:


-- -- won't compile. the type should be: 
-- -- counterList : List (forall a. Counter a)
-- counterList : List (Counter a)
-- counterList =
--    [ intCounter, floatCounter ]

--
-- c : Counter a
-- c =
--     floatCounter
