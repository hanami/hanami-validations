# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Break Versioning](https://www.taoensso.com/break-versioning).

## [Unreleased]

### Added

### Changed

### Deprecated

### Removed

### Fixed

### Security

[Unreleased]: https://github.com/hanami/validations/compare/v2.3.0...HEAD

## [2.3.0] - 2025-11-12

[2.3.0]: https://github.com/hanami/validations/compare/v2.3.0.beta2...v2.3.0

## [2.3.0.beta2] - 2025-10-17

### Changed

- Drop support for Ruby 3.1.

[2.3.0.beta2]: https://github.com/hanami/validations/compare/v2.3.0.beta1...v2.3.0.beta2

## [2.3.0.beta1] - 2025-10-03

[2.3.0.beta1]: https://github.com/hanami/validations/compare/v2.2.0...v2.3.0.beta1

## [2.2.0] - 2024-11-05

[2.2.0]: https://github.com/hanami/validations/compare/v2.2.0.rc1...v2.2.0

## [2.2.0.rc1] - 2024-10-29

[2.2.0.rc1]: https://github.com/hanami/validations/compare/v2.2.0.beta2...v2.2.0.rc1

## [2.2.0.beta2] - 2024-09-25

### Changed

- Remove all Ruby code from the gem. This gem now exists only to manage the dependency on dry-validation. (Tim Riley in #230)

[2.2.0.beta2]: https://github.com/hanami/validations/compare/v2.2.0.beta1...v2.2.0.beta2

## [2.2.0.beta1] - 2024-07-16

### Changed

- Drop support for Ruby 3.0.

[2.2.0.beta1]: https://github.com/hanami/validations/compare/v2.1.0...v2.2.0.beta1

## [2.1.0] - 2024-02-27

[2.1.0]: https://github.com/hanami/validations/compare/v2.1.0.rc3...v2.1.0

## [2.1.0.rc3] - 2024-02-16

[2.1.0.rc3]: https://github.com/hanami/validations/compare/v2.1.0.rc2...v2.1.0.rc3

## [2.1.0.rc2] - 2023-11-08

[2.1.0.rc2]: https://github.com/hanami/validations/compare/v2.1.0.rc1...v2.1.0.rc2

## [2.1.0.rc1] - 2023-11-02

[2.1.0.rc1]: https://github.com/hanami/validations/compare/v2.1.0.beta1...v2.1.0.rc1

## [2.1.0.beta1] - 2023-06-29

[2.1.0.beta1]: https://github.com/hanami/validations/compare/v2.0.1...v2.1.0.beta1

## [2.0.1] - 2022-12-25

### Added

- Official support for Ruby 3.2. (Luca Guidi)

[2.0.1]: https://github.com/hanami/validations/compare/v2.0.0...v2.0.1

## [2.0.0] - 2022-11-22

### Added

- Use Zeitwerk to autoload the gem. (Tim Riley)

[2.0.0]: https://github.com/hanami/validations/compare/v2.0.0.rc1...v2.0.0

## [2.0.0.rc1] - 2022-11-08

[2.0.0.rc1]: https://github.com/hanami/validations/compare/v2.0.0.beta4...v2.0.0.rc1

## [2.0.0.beta4] - 2022-10-24

### Changed

- Require latest dry-validation (to ensure best compatibility with Zeitwerk-enabled dry-rb gems). (Tim Riley in #224)

[2.0.0.beta4]: https://github.com/hanami/validations/compare/v2.0.0.beta1...v2.0.0.beta4

## [2.0.0.beta1] - 2022-07-20

### Added

- Official support for Ruby: MRI 3.1. (Luca Guidi)

[2.0.0.beta1]: https://github.com/hanami/validations/compare/v2.0.0.alpha2...v2.0.0.beta1

## [2.0.0.alpha2] - 2021-05-04

### Added

- Official support for Ruby: MRI 3.0. (Luca Guidi)

### Changed

- Drop support for Ruby: MRI 2.4, 2.5. (Luca Guidi)

[2.0.0.alpha2]: https://github.com/hanami/validations/compare/v2.0.0.alpha1...v2.0.0.alpha2

## [2.0.0.alpha1] - 2019-07-26

### Added

- Introduced `Hanami::Validator`. (Luca Guidi)
- Added support to validate JSON data. (Luca Guidi)
- Added rules. (Luca Guidi)
- Allow to inherit validations from superclasses (e.g. `ApplicationValidator < Hanami::Validator` => `SignupValidator < ApplicationValidator`). (Luca Guidi)
- Allow to error messages to receive arbitrary information as a `Hash` (e.g. `error_code: 123`), which will be interpolated in the final error message. (Luca Guidi)
- Added support for validator external dependencies. (Luca Guidi)

### Changed

- Drop support for Ruby: MRI 2.3, JRuby 9.1. (Luca Guidi)
- New validation syntax. (Luca Guidi)
- Removed custom predicates (`Hanami::Validations.predicate`). (Luca Guidi)
- Removed global custom predicates (`Hanami::Validations::Predicates`). (Luca Guidi)
- Removed messages path setting (`Hanami::Validations.messages_path=`). (Luca Guidi)
- Removed messages namespace setting (`Hanami::Validations.namespace`). (Luca Guidi)
- Removed messages engine setting (`Hanami::Validations.messages`). (Luca Guidi)

[2.0.0.alpha1]: https://github.com/hanami/validations/compare/v1.3.7...v2.0.0.alpha1

## [1.3.7] - 2021-01-06

### Fixed

- Ensure `predicate` and `predicates` to work together. (Panagiotis Matsinopoulos)

[1.3.7]: https://github.com/hanami/validations/compare/v1.3.6...v1.3.7

## [1.3.6] - 2020-01-08

### Added

- Official support for Ruby: MRI 2.7. (Luca Guidi)

[1.3.6]: https://github.com/hanami/validations/compare/v1.3.5...v1.3.6

## [1.3.5] - 2019-07-26

### Fixed

- Ensure I18n doesn't crash when used for inline predicates. (ippachi)

[1.3.5]: https://github.com/hanami/validations/compare/v1.3.4...v1.3.5

## [1.3.4] - 2019-07-26

### Fixed

- Ensure to load i18n backend (including `i18n` gem), when messages engine is `:i18n`. (Luca Guidi)

[1.3.4]: https://github.com/hanami/validations/compare/v1.3.3...v1.3.4

## [1.3.3] - 2019-01-31

### Fixed

- Depend on `dry-validation` `~> 0.11`, `< 0.12`. (Luca Guidi)
- Depend on `dry-logic` `~> 0.4.2`, `< 0.5`. (Luca Guidi)

[1.3.3]: https://github.com/hanami/validations/compare/v1.3.2...v1.3.3

## [1.3.2] - 2019-01-30

### Fixed

- Depend on `dry-validation` `~> 0.11.2`, `< 0.12` in order to skip non compatible `dry-logic` `0.5.0`. (Luca Guidi)

[1.3.2]: https://github.com/hanami/validations/compare/v1.3.1...v1.3.2

## [1.3.1] - 2019-01-18

### Added

- Official support for Ruby: MRI 2.6. (Luca Guidi)
- Support `bundler` 2.0+. (Luca Guidi)

[1.3.1]: https://github.com/hanami/validations/compare/v1.3.0...v1.3.1

## [1.3.0] - 2018-10-24

[1.3.0]: https://github.com/hanami/validations/compare/v1.3.0.beta1...v1.3.0

## [1.3.0.beta1] - 2018-08-08

### Added

- Official support for JRuby 9.2.0.0. (Luca Guidi)

[1.3.0.beta1]: https://github.com/hanami/validations/compare/v1.2.2...v1.3.0.beta1

## [1.2.2] - 2018-06-05

### Fixed

- Revert dependency to `dry-validation` to `~> 0.11`, `< 0.12`. (Luca Guidi)

[1.2.2]: https://github.com/hanami/validations/compare/v1.2.1...v1.2.2

## [1.2.1] - 2018-06-04

### Fixed

- Bump dependency to `dry-validation` to `~> 0.12`. (Luca Guidi)

[1.2.1]: https://github.com/hanami/validations/compare/v1.2.0...v1.2.1

## [1.2.0] - 2018-04-11

[1.2.0]: https://github.com/hanami/validations/compare/v1.2.0.rc2...v1.2.0

## [1.2.0.rc2] - 2018-04-06

[1.2.0.rc2]: https://github.com/hanami/validations/compare/v1.2.0.rc1...v1.2.0.rc2

## [1.2.0.rc1] - 2018-03-30

[1.2.0.rc1]: https://github.com/hanami/validations/compare/v1.2.0.beta2...v1.2.0.rc1

## [1.2.0.beta2] - 2018-03-23

[1.2.0.beta2]: https://github.com/hanami/validations/compare/v1.2.0.beta1...v1.2.0.beta2

## [1.2.0.beta1] - 2018-02-28

### Added

- Official support for Ruby: MRI 2.5. (Luca Guidi)

[1.2.0.beta1]: https://github.com/hanami/validations/compare/v1.1.0...v1.2.0.beta1

## [1.1.0] - 2017-10-25

[1.1.0]: https://github.com/hanami/validations/compare/v1.1.0.rc1...v1.1.0

## [1.1.0.rc1] - 2017-10-16

[1.1.0.rc1]: https://github.com/hanami/validations/compare/v1.1.0.beta3...v1.1.0.rc1

## [1.1.0.beta3] - 2017-10-04

[1.1.0.beta3]: https://github.com/hanami/validations/compare/v1.1.0.beta2...v1.1.0.beta3

## [1.1.0.beta2] - 2017-10-03

[1.1.0.beta2]: https://github.com/hanami/validations/compare/v1.1.0.beta1...v1.1.0.beta2

## [1.1.0.beta1] - 2017-08-11

[1.1.0.beta1]: https://github.com/hanami/validations/compare/v1.0.0...v1.1.0.beta1

## [1.0.0] - 2017-04-06

[1.0.0]: https://github.com/hanami/validations/compare/v1.0.0.rc1...v1.0.0

## [1.0.0.rc1] - 2017-03-31

[1.0.0.rc1]: https://github.com/hanami/validations/compare/v1.0.0.beta2...v1.0.0.rc1

## [1.0.0.beta2] - 2017-03-17

[1.0.0.beta2]: https://github.com/hanami/validations/compare/v1.0.0.beta1...v1.0.0.beta2

## [1.0.0.beta1] - 2017-02-14

### Added

- Official support for Ruby: MRI 2.4. (Luca Guidi)

### Fixed

- Don't let inline predicates to discard other YAML error messages. (Luca Guidi)

[1.0.0.beta1]: https://github.com/hanami/validations/compare/v0.7.1...v1.0.0.beta1

## [0.7.1] - 2016-11-18

### Fixed

- Ensure custom validators to work with concrete classes with name. (Luca Guidi)

[0.7.1]: https://github.com/hanami/validations/compare/v0.7.0...v0.7.1

## [0.7.0] - 2016-11-15

### Changed

- Official support for Ruby: MRI 2.3+ and JRuby 9.1.5.0+. (Luca Guidi)

[0.7.0]: https://github.com/hanami/validations/compare/v0.6.0...v0.7.0

## [0.6.0] - 2016-07-22

### Added

- Predicates syntax. (Luca Guidi)
- Custom predicates. (Luca Guidi)
- Inline predicates. (Luca Guidi)
- Shared predicates. (Luca Guidi)
- High level rules. (Luca Guidi)
- Error messages with I18n support (`i18n` gem). (Luca Guidi)
- Introduced `Hanami::Validations#validate`, which returns a result object. (Luca Guidi)
- Introduced `Hanami::Validations::Form` mixin, which must be used when input comes from HTTP params or web forms. (Luca Guidi)

### Changed

- Drop support for Ruby 2.0, 2.1 and Rubinius. Official support for JRuby 9.0.5.0+. (Luca Guidi)
- Validations must be wrapped in `.validations` block. (Luca Guidi)
- Removed `.attribute` DSL. A validator doesn't create accessors (getters/setters) for validated keys. (Luca Guidi)
- Removed `Hanami::Validations#valid?` in favor of `#validate`. (Luca Guidi)
- Error messages are accessible via result object. Eg. `result.errors` or `result.errors(full: true)`. (Luca Guidi)
- Coerced and sanitized data is accessible via result object. Eg. `result.output`. (Luca Guidi)

### Fixed

- Ensure to threat blank values as `nil`. (Luca Guidi)

[0.6.0]: https://github.com/hanami/validations/compare/v0.5.0...v0.6.0

## [0.5.0] - 2016-01-22

### Changed

- Renamed the project. (Luca Guidi)

[0.5.0]: https://github.com/hanami/validations/compare/v0.4.0...v0.5.0

## [0.4.0] - 2016-01-12

### Changed

- Ignore blank values for format and size validation. (Hélio Costa e Silva & Luca Guidi)

### Fixed

- Ensure acceptance validation to reject blank strings. (Pascal Betz)

[0.4.0]: https://github.com/hanami/validations/compare/v0.3.3...v0.4.0

## [0.3.3] - 2015-09-30

### Added

- Official support for JRuby 9k+. (Luca Guidi)

[0.3.3]: https://github.com/hanami/validations/compare/v0.3.2...v0.3.3

## [0.3.2] - 2015-05-22

### Added

- Introduced `Lotus::Validations#invalid?`. (deepj)

[0.3.2]: https://github.com/hanami/validations/compare/v0.3.1...v0.3.2

## [0.3.1] - 2015-05-15

### Fixed

- Fixed Hash serialization for nested validations. It always return nested `::Hash` structure. (Luca Guidi)
- Fixed Hash serialization when `Lotus::Entity` is included in the same class. (Alfonso Uceda Pompa & Dmitry Tymchuk)

[0.3.1]: https://github.com/hanami/validations/compare/v0.3.0...v0.3.1

## [0.3.0] - 2015-03-23

[0.3.0]: https://github.com/hanami/validations/compare/v0.2.4...v0.3.0

## [0.2.4] - 2015-01-30

### Added

- Introduced `Lotus::Validations::Error#attribute_name`. (Steve Hodgkiss)
- Nested validations. (Steve Hodgkiss)

### Changed

- `Lotus::Validations::Error#name` returns the complete attribute name (Eg. `first_name` or `address.street`). (Steve Hodgkiss)

[0.2.4]: https://github.com/hanami/validations/compare/v0.2.3...v0.2.4

## [0.2.3] - 2015-01-12

### Added

- Compatibility with Lotus::Entity. (Luca Guidi)

### Fixed

- Ensure `.validates` usage to not raise `ArgumentError` when `:type` option is passed. (Luca Guidi)
- Ensure to assign attributes when only `.validates` is used. (Luca Guidi)

[0.2.3]: https://github.com/hanami/validations/compare/v0.2.2...v0.2.3

## [0.2.2] - 2015-01-08

### Added

- Introduced `Validations.validates`. It defines validations, for already existing attributes. (Steve Hodgkiss)

[0.2.2]: https://github.com/hanami/validations/compare/v0.2.1...v0.2.2

## [0.2.1] - 2014-12-23

### Added

- Introduced `Validations::Errors#to_h` and `to_a`. (Luca Guidi)
- Introduced `Validations::Errors#any?`. (Luca Guidi)
- Official support for Ruby 2.2. (Luca Guidi)

### Fixed

- Made `Validations#valid?` idempotent. (Satoshi Amemiya)

[0.2.1]: https://github.com/hanami/validations/compare/v0.2.0...v0.2.1

## [0.2.0] - 2014-11-23

### Added

- Skip attribute whitelisting when a validator does not define any attribute. (Luca Guidi)
- Official support for Rubinius 2.3+. (Luca Guidi)
- Implemented `#each` in order to allow bulk operations on attributes. (Luca Guidi)
- Implemented `#to_h` to make validations usable by other libraries. (Luca Guidi)
- Made `#initialize` to accept Hashes with strings as keys, but only for declared attributes. (Luca Guidi)
- Lazy coercions, from now on `valid?` is not required to obtain a coerced value from a single attribute. (Luca Guidi)
- Made validators reusable by allowing infinite inclusion. (Rik Tonnard)

[0.2.0]: https://github.com/hanami/validations/compare/v0.1.0...v0.2.0

## 0.1.0 - 2014-10-23

### Added

- Made `#initialize` to accept any object that implements `#to_h`. (Luca Guidi)
- Custom coercions for user defined classes. (Luca Guidi)
- Raise an exception at the load time when a validation is not recognized. (Luca Guidi)
- Allow validators inheritance. (Luca Guidi)
- Confirmation validation. (Luca Guidi)
- Exclusion validation. (Luca Guidi)
- Size validation. (Luca Guidi)
- Acceptance validation. (Luca Guidi)
- Inclusion validation. (Jeremy Stephens)
- Format validation. (Luca Guidi)
- Presence validation. (Luca Guidi)
- Coercions. (Luca Guidi)
- Basic module inclusion. (Luca Guidi)
- Official support for JRuby 1.7+ (with 2.0 mode). (Luca Guidi)
- Official support for MRI 2.0+. (Luca Guidi)

### Fixed

- Ensure to not fail validations when coerce falsey values. (Jeremy Stephens)
- Ensure `Lotus::Validations#valid?` to be idempotent. (Luca Guidi)