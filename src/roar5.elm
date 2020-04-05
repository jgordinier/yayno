port module Main exposing (Msg(..), subscriptions, view)

import Browser
import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Json.Encode as E
import Task
import Time exposing (..)


port play : E.Value -> Cmd msg


type Msg
    = Beep Time.Posix


main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    Int


init : () -> ( Model, Cmd Msg )
init _ =
    ( 1, Cmd.none )


update msg model =
    case msg of
        Beep _ ->
            ( model, play (E.bool True) )


view model =
    div [ ] [
        div [] [text "Every 5 seconds... "]
            , div [ id "audio" ]
            [ audio
                [ id "pulse-beep"
                -- src can be a local file too.
                , src "https://soundbible.com/mp3/Tyrannosaurus%20Rex%20Roar-SoundBible.com-807702404.mp3"
                , controls False
                ] []
            ]
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every 5000 Beep
