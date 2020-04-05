module Main exposing (main)

import Browser
import Html exposing (Html, div, input, li, p, text, ul)
import Html.Attributes exposing (value)
import Html.Events exposing (on, onInput)
import Json.Decode as Json


type alias Model =
    { currentItem : String
    , items : List String
    }


initialModel : Model
initialModel =
    { currentItem = ""
    , items = []
    }


type Msg
    = UpdateCurrentItem String
    | AddItem


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateCurrentItem string ->
            { model | currentItem = string }

        AddItem ->
            { model
                | currentItem = ""
                , items = model.currentItem :: model.items
            }


view : Model -> Html Msg
view model =
    div []
        [ p [] [ text <| "Hit enter to add text to list." ]
        , viewTextInput model
        , ul [] <| viewItemList model
        ]


viewTextInput : Model -> Html Msg
viewTextInput model =
    input
        [ onInput UpdateCurrentItem
        , onEnter AddItem
        , value model.currentItem
        ]
        []


viewItemList : Model -> List (Html msg)
viewItemList model =
    List.map (\item -> viewItem item) model.items


viewItem : String -> Html msg
viewItem item =
    li [] [ text <| item ]


onEnter : msg -> Html.Attribute msg
onEnter msg =
    let
        isEnterKey keyCode =
            if keyCode == 13 then
                Json.succeed msg

            else
                Json.fail "silent failure :)"
    in
    on "keyup" <|
        Json.andThen isEnterKey Html.Events.keyCode


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
