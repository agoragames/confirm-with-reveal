# CHANGELOG

## 1.1.0 (2021-04-05)

* use $.rails.confirm to comply to Rails 6
* use Foundation 6 for reveal / close

## 1.0.2 (2015-01-08)

* Ensure that bare `data-confirm` attribute without value launches Foundation
  confirmation dialog and `data-confirm` with a plain string attribute falls
  back to using browser’s built-in `window.confirm`.
  [Fixes #12](https://github.com/agoragames/confirm-with-reveal/issues/12).

## 1.0.1 (2014-07-25)

* Fix compatibility issue with [jquery-ujs](https://github.com/rails/jquery-ujs)
  (see [issue #9](https://github.com/agoragames/confirm-with-reveal/issues/9)).

## 1.0.0 (2014-03-28)

* Additional UI customization options; plugin-specific confirm/cancel events.

## 0.0.3 (2014-02-25)

* Fix semantic versioning tag snafu. No functional changes.

## 0.0.2 (2014-02-21)

* Configuration options for classes on OK/Cancel buttons.

## 0.0.1 (2014-02-21)

* Start using [semver](http://semver.org); add Bower package file.

## 2014-02-21 release

* Use dialog-specific `cancel` localization if set.

## 2014-02-20 release

* Compatibility update for ZURB Foundation 5.

## 2013-06-18 release

* Add localization via configuration variable.

## 2013-05-09 release

* Form confirmation on submit, not on click.

## 2013-04-16 release

* Initial release.
