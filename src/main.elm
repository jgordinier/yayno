port module Main exposing (Msg(..), subscriptions, view)

import Browser
import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Json.Encode as E
import Task
-- import Time exposing (..)


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

  -- Yes ->
  --     "https://ia801509.us.archive.org/1/items/yay_20200404/YAY.mp3"

  --   No ->
  --     "https://ia801405.us.archive.org/35/items/no_20200404/No.mp3"

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


-- MODEL
-- type alias Model = String
-- init : Model
-- init =
--   ""

-- -- UPDATE
-- type Msg
--   = Yes
--   | No

-- update : Msg -> Model -> Model
-- update msg model =
--   case msg of
--     Yes ->
--       "https://ia801509.us.archive.org/1/items/yay_20200404/YAY.mp3"

--     No ->
--       "https://ia801405.us.archive.org/35/items/no_20200404/No.mp3"

-- -- VIEW
-- view : Model -> Html Msg
-- view model =
--   div []
--     [ button [ onClick Yes ] [ text "YES" ]
--     , button [ onClick No ] [ text "NO" ]
--     ]