module Web.IntersectionObserverEntry where

import Prelude

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Effect.Uncurried as EFn
import Web.DOM as Web.DOM

-- from https://w3c.github.io/IntersectionObserver/#intersection-observer-entry

type DOMHighResTimeStamp = Number

type DOMRectReadOnly =
  { x :: Number
  , y :: Number
  , width :: Number
  , height :: Number
  , top :: Number
  , right :: Number
  , bottom :: Number
  , left :: Number
  }

type DOMRectInit =
  { x :: Number
  , y :: Number
  , width :: Number
  , heigth :: Number
  }


type IntersectionObserverEntryInit =
  { time :: DOMHighResTimeStamp
  , rootBounds :: Nullable DOMRectInit
  , boundingClientRect :: DOMRectInit
  , intersectionRect :: DOMRectInit
  , isIntersecting :: Boolean
  , intersectionRatio :: Number
  , target :: Web.DOM.Element
  }

data IntersectionObserverEntry

foreign import _create :: EFn.EffectFn1 IntersectionObserverEntryInit IntersectionObserverEntry

create :: IntersectionObserverEntryInit -> Effect IntersectionObserverEntry
create = EFn.runEffectFn1 _create

foreign import time :: IntersectionObserverEntry -> DOMHighResTimeStamp
foreign import _rootBounds :: IntersectionObserverEntry -> Nullable DOMRectReadOnly

rootBounds :: IntersectionObserverEntry -> Maybe DOMRectReadOnly
rootBounds = toMaybe <<< _rootBounds

foreign import boundingClientRect :: IntersectionObserverEntry -> DOMRectReadOnly
foreign import intersectionRect :: IntersectionObserverEntry -> DOMRectReadOnly
foreign import isIntersecting :: IntersectionObserverEntry -> Boolean
foreign import intersectionRatio :: IntersectionObserverEntry -> Number
foreign import target :: IntersectionObserverEntry -> Web.DOM.Element
