# Changelog

Notable changes to this project are documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

Breaking changes:

New features:

Bugfixes:

Other improvements:

## [v1.0.0](https://github.com/purescript-web/purescript-web-intersection-observer/releases/tag/v1.0.0) - 2026-10-10

Initial release. Compatible with PureScript 0.15.0

Breaking changes:

- Uses ES module FFI for PureScript 0.15 rather than CommonJS FFI for older compiler versions (#4).
- Replaces Bower/Pulp and Spago Dhall development configuration with Spago YAML and registry dependencies (#6).

Other improvements:

- Pins PureScript and Spago, and adds npm and Spago lockfiles (#6).
- Updates CI to Node 24 and current GitHub Actions; replaces ESLint with Oxlint and Oxfmt and formats PureScript with purs-tidy (#6).
- Adds configuration for the first registry publication.
