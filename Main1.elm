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
  = Yes
  | No

update : Msg -> Model -> Model
update msg model =
  case msg of
    Yes ->
      "https://ia801509.us.archive.org/1/items/yay_20200404/YAY.mp3"

    No ->
      "https://ia801405.us.archive.org/35/items/no_20200404/No.mp3"

-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Yes ] [ text "YES" ]
    , button [ onClick No ] [ text "NO" ]
    ]





