module Stopwatch exposing (Stopwatch, reset, start, pause, value)

{-| A stopwatch.


# Types

@docs Stopwatch


# Controls

@docs reset, start, pause


# Misc

@docs value

-}

import Time exposing (Time, millisecond)


{-| -}
type Stopwatch
    = Stopped
    | Running Time
    | Paused Time


{-| -}
reset : Stopwatch
reset =
    Stopped


{-| -}
start : Stopwatch -> Stopwatch
start stopwatch =
    case stopwatch of
        Paused ms ->
            Running ms

        _ ->
            Running startValue


startValue : Time
startValue =
    0 * millisecond


{-| -}
pause : Stopwatch -> Stopwatch
pause stopwatch =
    case stopwatch of
        Running ms ->
            Paused ms

        _ ->
            stopwatch


{-| -}
value : Stopwatch -> Time
value stopwatch =
    case stopwatch of
        Stopped ->
            startValue

        Running ms ->
            ms

        Paused ms ->
            ms
