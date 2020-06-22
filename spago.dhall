{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "web-html"
, dependencies =
  [ "console"
  , "effect"
  , "psci-support"
  , "web-dom"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
