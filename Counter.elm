module Counter exposing (Counter, mkCounter, zero, inc, val, intCounter, floatCounter)


type Hide a
    = Hide a


type Counter a
    = Counter { zero : a, inc : a -> a, val : a -> Int }


zero : Counter a -> a
zero (Counter c) =
    c.zero


inc : Counter a -> (a -> a)
inc (Counter c) =
    c.inc


val : Counter a -> (a -> Int)
val (Counter c) =
    c.val


mkCounter : a -> (a -> a) -> (a -> Int) -> Counter (Hide a)
mkCounter zero inc val =
    Counter
        { zero = Hide zero
        , inc = \(Hide a) -> Hide (inc a)
        , val = \(Hide a) -> val a
        }


intCounter : Counter (Hide Int)
intCounter =
    mkCounter 0 (\i -> i + 1) (\i -> i + 0)


floatCounter : Counter (Hide Float)
floatCounter =
    mkCounter 0.0 (\i -> i + 1.0) round
