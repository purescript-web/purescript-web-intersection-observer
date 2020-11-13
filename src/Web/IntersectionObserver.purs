module Web.IntersectionObserver where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Nullable (Nullable, null, toNullable)
import Effect (Effect)
import Effect.Uncurried as EFn
import Web.DOM as Web.DOM
import Web.DOM.Element as Web.DOM.Element
import Web.DOM.Document as Web.DOM.Document
import Web.IntersectionObserverEntry (IntersectionObserverEntry)

-- from https://w3c.github.io/IntersectionObserver/#intersection-observer

data IntersectionObserver

type IntersectionObserverInit' =
  { root :: Nullable Web.DOM.Node
  , rootMargin :: String

  -- | ```js
  -- | var obs = new IntersectionObserver(() => {}, { threshold: [] })`
  -- | console.log(obs.thresholds)
  -- | > [0]
  -- | console.log(obs.threshold) -- check documentation, for constuctor it is `threshold`, but for fields - `thresholds`!!
  -- | > undefined
  -- |
  -- | so, maybe replace type to `NonEmpty Array Number`?
  , threshold :: Array Number
  }

data IntersectionObserverInitRoot
  = None
  | Element Web.DOM.Element
  | Document Web.DOM.Document

intersectionObserverInitRootToInternal :: IntersectionObserverInitRoot -> Nullable Web.DOM.Node
intersectionObserverInitRootToInternal None = null
intersectionObserverInitRootToInternal (Element element) = toNullable <<< Just <<<  Web.DOM.Element.toNode $ element
intersectionObserverInitRootToInternal (Document document) = toNullable <<< Just <<<  Web.DOM.Document.toNode $ document

type IntersectionObserverInit =
  { root :: IntersectionObserverInitRoot
  , rootMargin :: String
  , threshold :: Array Number
  }

defaultIntersectionObserverInit :: IntersectionObserverInit
defaultIntersectionObserverInit =
  { root: None
  , rootMargin: "0px"
  , threshold: [0.0]
  }

foreign import _create :: EFn.EffectFn2 (EFn.EffectFn2 (Array IntersectionObserverEntry) IntersectionObserver Unit) IntersectionObserverInit' IntersectionObserver

create :: (Array IntersectionObserverEntry -> IntersectionObserver -> Effect Unit) -> IntersectionObserverInit -> Effect IntersectionObserver
create callback options =
  let
    callback' :: EFn.EffectFn2 (Array IntersectionObserverEntry) IntersectionObserver Unit
    callback' = EFn.mkEffectFn2 callback

    options' :: IntersectionObserverInit'
    options' = options { root = intersectionObserverInitRootToInternal options.root }
  in EFn.runEffectFn2 _create callback' options'

foreign import root :: IntersectionObserver -> Web.DOM.Node

foreign import rootMargin :: IntersectionObserver -> String

foreign import thresholds :: IntersectionObserver -> Array Number

foreign import _observe :: EFn.EffectFn2 IntersectionObserver Web.DOM.Element Unit

observe :: IntersectionObserver -> Web.DOM.Element -> Effect Unit
observe = EFn.runEffectFn2 _observe

foreign import _unobserve :: EFn.EffectFn2 IntersectionObserver Web.DOM.Element Unit

unobserve :: IntersectionObserver -> Web.DOM.Element -> Effect Unit
unobserve = EFn.runEffectFn2 _unobserve

foreign import _disconnect :: EFn.EffectFn1 IntersectionObserver Unit

disconnect :: IntersectionObserver -> Effect Unit
disconnect = EFn.runEffectFn1 _disconnect

foreign import _takeRecords :: EFn.EffectFn1 IntersectionObserver (Array IntersectionObserverEntry)

takeRecords :: IntersectionObserver -> Effect (Array IntersectionObserverEntry)
takeRecords = EFn.runEffectFn1 _takeRecords
