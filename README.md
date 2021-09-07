# SQL скрипты на задачи Локо-банка.

##### Для просмотра результатов склонируйте репозиторий при помощи команды в терминале: 
``` 
git clone https://github.com/INI-MED/sqlfiles.git
``` 
##### или используйте <https://sqliteonline.com>
 ---
 
#### Задача 1. 
Написать скрипты на SQL. 

Даны 2 таблицы: информация о заявке, где есть номер заявки, дата подачи заявки, финальное решение по заявке и информация о клиенте, который подавал заявку на получение кредита. В одной заявке, кроме клиента (основной заёмщик) может быть ещё один участник сделки (поручитель, залогодатель и тд). 

Необходимо вывести все одобренные заявки c датой заведения и id клиента, где город регистрации основного заёмщика Москва.

#### Решение:

<https://github.com/INI-MED/sqlfiles/blob/0809175e58736e66ed4c1fe54fde6bd69bcf4a3c/1st.sql>

---
#### Задача 2. 

Дана выборка, информация об авто в качестве залога по кредиту.

Необходимо на языке SQL посчитать кол-во отечественных авто и иномарок в зависимости от года выпуска в виде:

| Год авто | кол-во иномарок | кол-во отечественных |
| :---:   | :-: | :-: |
| 2007 | 1 | 0 |
|...| ...|...|

#### Решение:

<https://github.com/INI-MED/sqlfiles/blob/0809175e58736e66ed4c1fe54fde6bd69bcf4a3c/2nd.sql>

---

#### Задача 3.

Существует представление/view. Код view содержит несколько джойнов таблицы самой на себя.
В последнее время запросы на выборку данных из этой view стали работать очень долго, что замедляет скорость работы получения решения.
Предложить перечень мероприятий по ускорению получения выборок из этой view.

#### Решение:

``` 
Для оптимизации получения выборок стоит уменьшить объем данных при помощи компрессии таблиц если это возможно.  
Так же стоит проставить индексы атрибутов таблиц, которые участвуют в JOIN и на атрибуты в условиях фильтрации. 
Желательно использовать числовые данные типа INT, которые не имели бы значений NULL там, где они NOT NULL. 
Избавиться от проверки regexp там, где это возможно.
```

---

#### Задача 4. 

Написать скрипты на SQL. Получить накопленную сумму продаж (Sum) по сотруднику (Id) на отчетные даты (Date).

#### Решение:

<https://github.com/INI-MED/sqlfiles/blob/0809175e58736e66ed4c1fe54fde6bd69bcf4a3c/4th.sql>

##### Пример использования:

```
Select SUM(sum) from <Table> where id = <ID> and date <= <DATE>
```
---

#### Задача 5.

Написать скрипты на языке SQL, чтобы получить список кредитов, которые на момент расчета имеют непогашенную задолженность, и рассчитать для каждого такого кредита:
1.	Общую (накопленную) сумму просроченного долга непогашенную (не выплаченную) к моменту расчета.
2.	Дату начала текущей просрочки. Под датой начала просрочки, в данной задаче понимается первая дата непрерывного периода, в котором общая сумма просроченного непогашенного долга > 0.
3.	Кол-во дней текущей просрочки.

#### Исходные данные
Таблица PDCL – содержит информацию о выносах на просрочку неоплаченных сумм по кредиту и о погашениях просроченного долга. 

#### Структура:

| Date| дата | 
| :---:   | :-: |
|Customer|	Номер клиента|
|Deal|	Номер кредита|
|Currency|	Валюта кредита|
|Sum	|сумма, вынесенная на просрочку ("+") или выплаченная ("-")|

#### Решение: 

<https://github.com/INI-MED/sqlfiles/blob/0809175e58736e66ed4c1fe54fde6bd69bcf4a3c/5th.sql>

---
