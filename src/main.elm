module Main exposing (..)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--
import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

-- MAIN
main =
  Browser.sandbox { init = init, update = update, view = view }

-- MODEL
type alias Model = String
init : Model
init =
  ""

-- UPDATE
type Msg
  = Increment
  | Decrement

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1

-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Increment ] [ text "YES" ]
    , button [ onClick Decrement ] [ text "NO" ]
    ]



module Main exposing (Msg(..), view)

import Browser
import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Task
import Time exposing (..)



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
        _  ->
            ( model, Cmd.none )


view model =
    div [ ] [
        div [] [text "Just use the controls... "]
            , div [ id "audio" ]
            [ audio
                [ id "roar"
                -- src can be a local file too.
                , src "https://soundbible.com/mp3/Tyrannosaurus%20Rex%20Roar-SoundBible.com-807702404.mp3"
                , controls True
                ] []
            ]
        ]

subscriptions : Model -> Sub msg
subscriptions 
    = \_ -> Sub.none

    

