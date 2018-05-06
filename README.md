# SysEnumerators

*SysEnumerators* - это набор классов на языке X++, который позволяет разработчику единообразно "пробежать" по:

* интервалу чисел;
* интервалу дат;
* элементам контейнера;
* элементам коллекций Аксапты (`array`, `set`, `map`, `list`, `struct`);
* элементам `enum`;
* элементам коллекций из .Net-пространства `System.Collections` (как с [генериками](https://msdn.microsoft.com/library/system.collections.generic.aspx), так и [без них](https://msdn.microsoft.com/ru-ru/library/system.collections.aspx));
* промаркированным на форме записям;
* записям `QueryRun`, `Query`, `select Table where...`;
* записям из коллекций `RecordSortedList`, `RecordLinkList`;
* элементам `TreeNode`;
* элементам коллекций Dict-классов;
* XML-элементам;
* файлам (`CommaIo`, `AsciiIo`, `BinaryIo`, `TextIo`);
* строкам, словам и regexp-токенам из `TextBuffer`;
* и прочим системным коллекциям Аксапты.

Подробнее о *SysEnumerators* для [Microsoft Dynamics AX 2009](/ax2009), [Microsoft Dynamics AX 2012](/ax2012), [Axapta 3.0](/ax3) и [Axapta 4.0](/ax4).

## Пример использования SysEnumerators

![SysEnumeratorExample03_Container](ax2009/Media/Example03.png)

```java
container c = ['a', 'b', 1, 'd', systemdateget(), 'f'];
SysEnumerator se = SysEnumerator::newFromContainer(c);

while( se.moveNext() )
{
    info(strfmt("%1", se.current()));
}
```

Больше примеров с описанием и скриншотами результатов можно найти в каталоге [Examples](ax2009/Src/Examples).

## Отличия проектов для разных версий Аксапты

Первичная разработка ведется в [ax2009](/ax2009).

|Код| Отличие | ax2012 | ax2009 | ax4 | ax3 |
|---|---------|:------:|:------:|:---:|:---:|
|ut_01|Test-классы и проекты для модуля Unit-тестирования | + | + | + | - |
|int64_01|SysIterations (тип для количества итераций) extends | Int64 | Int64 | Int64 | Int |
|int64_02|SysRangeInt64, SysRangeInt64Test | + | + | + | - |
|int64_03|SysSequenceInt64, SysSequenceInt64Test | + | + | + | - |
|int64_04|SysEnumerator_Int64, SysEnumerator_Int64Test | + | + | + | - |
|int64_05|SysEnumerator_Indexed64 | + | + | + | - |
|variant_01|методы в интерфейсе ISysRange | - | + | + | - |
|variant_02|методы в интерфейсе ISysSequence | - | + | + | - |
|variant_03|методы current* в интерфейсе ISysEnumerator | - | + | + | - |
|variant_04|интерфейс ISysEnumerator extends Enumerator | - | + | + | - |
|variant_05|метод base в классе SysEnumerator_Io | - | + | + | - |
|op_01|оператор `is` | + | - | - | - |
|ref_01|SysEnumerator_SystemCollection | + | + | - | - |
|misc_01|SysEnumerator_TextBuffer с наследниками | + | + | - | - |
|real_01|в SysRangeRealTest и SysSequenceRealTest используется универсальный SysEnumerator::IterationMax | - | + | + | + |

Примечания:

* [ut]: модуль Unit-тестирования появился в ax4. В стандартной поставке ax3 этот модуль отсутствует.

* [int64]: тип `Int64` появился в ax4. В ax3 для целочисленной арифметики используется только `Int`.

* [variant]: ax3 и ax2012 требуют полного совпадения названий типов в унаследованных методах с типами метода родителя (класса или интерфейса).

* [op]: операторы `is` и `as` появились в ax2012. В предыдущих версиях вместо них использовались методы `SysDictClass::is` и `SysDictClass::as`.

* [real]: из-за особенностей арифметики с real, в ax2012 в тестах используются "магические" константы.

## Благодарности

Спасибо [Ивану Захарову](ivan@zakharov.com) и Роману Долгополову (RDOL, [db](https://axforum.info/forums/member.php?u=2836)), на проекте которых я убедился что энумераторы реально снижают время разработки, а вопросы быстродействия энумераторов легко решаются после профилирования кода и выявления узких мест.

Спасибо Дмитрию Толстову ([damn](https://axforum.info/forums/member.php?u=1465)) за вклад в данный проект.

## Disclaimer

* Названия классов и методов, иерархия и порядок вызовов в наборе классов  будут по возможности сохраняться, но это не гарантируется - в будущих версиях *SysEnumerators* все может измениться.
* Код в xpp-файлах конвертирован скриптом [build.ps1](build.ps1) из xpo-файлов только для удобства использования человеком. Оригиналом является код в xpo-проектах, отличия между xpo и xpp всегда трактуются в пользу текста из xpo-проектов.
* Проект выложен "как есть" под лицензией [MIT](LICENSE): вы можете использовать данный код как угодно безо всяких отчислений, автор не дает никаких гарантий и не несет ответственности за возможный эффект от использования кода на проектах.

## ChangeLog

* [CHANGELOG.md](CHANGELOG.md)
* <https://github.com/mazzy-ax/SysEnumerators/releases>

## Помощь проекту

Буду признателен за ваши замечания, предложения, советы в разделе [Issues](https://github.com/mazzy-ax/SysEnumerators/issues) и [Pull requests](https://github.com/mazzy-ax/SysEnumerators/pulls) по проекту, а также в виде письма на адрес [mazzy@mazzy.ru](mailto:mazzy@mazzy.ru)

Мазуркин Сергей (mazzy)