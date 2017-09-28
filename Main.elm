module Main exposing (..)

import Counter exposing (..)
import Html exposing (text)


-- won't compile:  Hide a is not exported
-- incTwiceCantUse : Counter (Hide Int) -> Counter (Hide Int)
-- incTwiceCantUse c =
--    inc c |> inc c


incTwiceCantUse : Counter Int -> (Int -> Int)
incTwiceCantUse c =
    -- won't work
    -- - Can never have Counter Int
    -- - Hide a is not exported
    inc c >> inc c



-- result : you can only write down usable functions that use Counter if you leave the type variable abstract
-- it's like existential types, but with explicit tracking of the unusable type variable


incTwice : Counter a -> (a -> a)
incTwice c =
    inc c >> inc c


main : Html.Html msg
main =
    text (toString (zero intCounter |> incTwice intCounter |> val intCounter))



--
-- c : Counter a
-- c =
--     floatCounter
