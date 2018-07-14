module Stopwatch exposing (Stopwatch, tick, reset, start, pause, value)

{-| A stopwatch.


# Stopwatch

@docs Stopwatch, tick, value


# Controls

@docs reset, start, pause

-}

import Time exposing (Time, millisecond)


{-| -}
type Stopwatch
    = Stopped
    | Running Time
    | Paused Time


{-| -}
tick : (Stopwatch -> msg) -> Stopwatch -> Sub msg
tick msg stopwatch =
    case stopwatch of
        Running ms ->
            Time.every millisecond (always (Running (ms + 1) |> msg))

        _ ->
            Sub.none


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


{-| -}
pause : Stopwatch -> Stopwatch
pause stopwatch =
    case stopwatch of
        Running ms ->
            Paused ms

        _ ->
            stopwatch


startValue : Time
startValue =
    0 * millisecond
