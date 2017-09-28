module Main exposing (..)

import Counter exposing (..)
import Html exposing (text)


-- won't compile:
-- - inc only works with Counter (Hide a)
-- wouldn't work anyway:
-- - Can never have Counter Int
-- - Hide a is not exported
-- incTwiceCantUse : Counter Int -> Counter Int
-- incTwiceCantUse c =
--    inc c |> inc c
-- won't compile:  Hide a is not exported
-- incTwiceCantUse : Counter (Hide Int) -> Counter (Hide Int)
-- incTwiceCantUse c =
--    inc c |> inc c


notInteresting : Counter Int -> Counter Int
notInteresting c =
    -- the only function you can ever write with a fully applied Counter
    -- you can never use it since you can't construct a Counter Int
    c



-- result : you can only write down useful functions that use Counter if you leave the type variable abstract
-- it's like existential types, but with explicit tracking of the unusable type variable


incTwice : Counter a -> Counter a
incTwice c =
    inc c |> inc c


main : Html.Html msg
main =
    text (toString (zero intCounter |> incTwice intCounter |> val intCounter))
