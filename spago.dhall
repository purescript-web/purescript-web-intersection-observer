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
