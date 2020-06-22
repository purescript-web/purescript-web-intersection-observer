{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "web-intersection-observer"
, dependencies =
  [ "console"
  , "effect"
  , "psci-support"
  , "web-dom"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
