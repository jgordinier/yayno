port module Main exposing (Msg(..), subscriptions, view)

import Browser
import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Events exposing (onClick)
import Json.Encode as E
import Task
-- import Time exposing (..)


port play : E.Value -> Cmd msg
type Msg
    = Beep Maybe Bool
    | Nothing
    
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
        button [ onClick Beep ] [ text "YES" ]
            , div [ id "audio" ]
            [ audio
                [ id "pulse-beep"
                -- src can be a local file too.
                , src "https://ia801509.us.archive.org/1/items/yay_20200404/YAY.mp3"
                , controls False
                ] []
            ]
        ]


subscriptions : Model -> Sub msg
subscriptions =
    Silent


-- <!doctype html>
-- <html>
--   <head>
--     <title>Audio</title>
--   </head>
--   <body>

--     <script>
--       function play() {
--         var audio = document.getElementById("audio");
--         audio.play();
--       }
--     </script>

--     <input type="button" value="PLAY" onclick="play()">
--     <audio id="audio" src="http://dev.interactive-creation-works.net/1/1.ogg"></audio>

--   </body>
-- </html>

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

  -- Yes ->
  --     "https://ia801509.us.archive.org/1/items/yay_20200404/YAY.mp3"

  --   No ->
  --     "https://ia801405.us.archive.org/35/items/no_20200404/No.mp3"