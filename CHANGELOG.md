# SysEnumerators Changelog

see also [Releases on GitHub](https://github.com/mazzy-ax/SysEnumerators/releases) and [Unreleased](https://github.com/mazzy-ax/SysEnumerators/compare/1.0.0...master) on GitHub.

## [0.4.0](https://github.com/mazzy-ax/SysEnumerators/compare/0.3.1...0.4.0) &ndash; 2021-03-04

Добавлено:

* добавлены энумераторы для `ax2012`
* в список энумераторов версии `ax4` добавлен `SysEnumerator_Sleep`

Изменено:

* исправлены неточные TODO
* исправлена неправильная передача параметра при инициализации в `SysEnumerator_ConfigurationKeySet`
* исправлено поведение `SysEnumerator_Sleep` - код метода `next` перенесен в метод `moveNextPost` - теперь `sleep` выполняется после того, как отработают все энумераторы в группе -
* исправлена инициализация `SysEnumerator_SysOperationProgress` в случае, если передан null параметр

## CRLF в .xpo-файлах - 2020-03-02

В git-репозитории обновлены .xpo-файлы. Теперь они содержат `CRLF`, а не `LF`.
Это изменение сделано для тех, кто не пользуется командой `git clone`, а выкачивает и распаковывает .zip-архив из git-репозитория

## 0.3.1 - 2018-04-24

* Добавлен проект с энумераторами для ax4
* Добавлен `SysEnumerator_Sleep`
* Явно определен метод moveNext в интерфейсе `ISysEnumerator`. Раньше метод только наследовался
* энумераторы `SysEnumerator_Counter` теперь считают от 1, а не от 0
* энумераторы `SysEnumerator_Indexed` теперь по умолчанию энумерируют все целые. Раньше по умолчанию устанавливался пустой диапазон

## 0.3.0 - 2018-04-23

* Add `SysEnumerator_TextBuffer` enumerators and unit test for it:
  * line enumerator
  * word enumerator
  * pattern token enumerator
  * split by tabs
  * split by pattern
* Add `autohide` for a progress window in a `SysEnumerator_RunbaseProgress` and `SysEnumerator_SysOperationProgress`
* Fix next method in the `SysEnumeratorGroup`
* `SysEnumerator_QueryRun`
  * Fix performance
  * Add parameter EstimatedIterations to avoid slow counting
  * Add unit test
  * Remove `datasourceNo` check - the enumerator should work as `QueryRun` and the enumerator should throw exception as `QueryRun`

## 0.2.3 - 2018-04-15

* Style fix in the `SysEnumerator_ConfigurationKeySet` - method `baseOrDefault` extracted from new
* Style fix - all declarations of classes and methods contains public/protected/private as first keyword
* Replace `SysDictClass::is` on `SysDictClass::isEqualOrSuperclass` when second argument is class. For performance and compatibility with ax3, ax4
* Minor performance fixes in `SysEnumerator_DictTable_Index`


## 0.2.2 - 2018-04-14

* Fix `SysDictEnum::newFrom()`. It returns a value now
* Fix `SysDictEnum` xpo-element contains modifications from USR-layer only. Now the xpo-element is not contain sys-methods.
* Add to repository script build.ps1 rebuilds files in the `\Src` directory based on `\Projects\*.xpo` files
* Add to repository `.gitignore` file

## 0.2.1 - 2018-04-11

* Fix `SysEnumerator::newFromPackedContainer()`
* Add Caption value from `runbase.caption()` if Caption parameter is empty

## 0.2.0 - 2018-04-08

* Redesign most of enumerators. It accept null as empty collections
* Redesign `RunbaseProgress` and `SysOperation` enumerators
* Redesign xpp-generator. It should not be differences between xpo and xpp files.
* Add unit tests for null-collections

## 0.1.0 - 2018-04-01

* Initial release