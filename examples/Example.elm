module Example exposing (main)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Stopwatch exposing (Stopwatch)


type Msg
    = Reset
    | Start
    | Pause


main : Program Never Stopwatch Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


init : ( Stopwatch, Cmd Msg )
init =
    ( Stopwatch.reset, Cmd.none )


update : Msg -> Stopwatch -> ( Stopwatch, Cmd Msg )
update msg stopwatch =
    case msg of
        Reset ->
            ( Stopwatch.reset, Cmd.none )

        Start ->
            ( Stopwatch.start stopwatch, Cmd.none )

        Pause ->
            ( Stopwatch.pause stopwatch, Cmd.none )


view : Stopwatch -> Html Msg
view stopwatch =
    div []
        [ button [ onClick Reset ] [ text "Reset" ]
        , button [ onClick Start ] [ text "Start" ]
        , button [ onClick Pause ] [ text "Pause" ]
        , div [] [ text (stopwatch |> toString) ]
        ]


subscriptions : Stopwatch -> Sub Msg
subscriptions stopwatch =
    Sub.none
