# Project_SQL
Processing of the SQL project
## Projekt SQL - Data o mzdách a cenách potravin a jejich zpracování pomocí SQL

### Autor : Jana Dedyková
------
### Zadání projektu 

Zodpovědět na otázky, které se vztahují k tématu dostupnosti základních potravin široké veřejnosti, pro porovnání dostupnosti základních potravin ve vztahu k průměrným příjmům v daném časovém období.

### Výzkumné otázky 

#### 1)    Rostou v průběhu let mzdy ve všechodvětvích, nebo v některých klesají?

U většiny odvětví mají mzdy spíše rostoucí trend a to až na rok 2013, kdy dochází k poklesu mezd ve většině odvětví. Tento jev může být způsobem finanční krizí v letech 2008 – 2015. Mezi obory, ve kterých mzdy klesaly i mimo zmíněný rok 2013, patří těžba a dobývání,veřejná správa nebo kulturní, zábavní a rekreační činnosti.

#### 2)    Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cena mezd?

Pro každou komoditu a rok je vytvořen samostatný příkaz, který vrátí množství dané komodity, které je možné koupit v daný rok.

#### 3)    Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?

Na první příčce se umístil cukr krystal, který má však záporné procento růstu cen, což znamená, že cukr nezdražuje, ale naopak jeho cena klesá. Mezi potravinami s nejnižším percentuálním meziročním růstem patří banány, minerální voda nebo pšeničné pečivo.

#### 4)    Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?

Ano,jedná se o rok 2012.

#### 5)    Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?

Hrubý domácí produkt je jedním z klíčových souhrnných ukazatelů vývoje ekonomiky. Představuje míru celkové ekonomické činnosti na daném území, při které produkce uspokojuje konečnou poptávku hospodářství. Velmi zjednodušeně by se dalo říct, že pokud roste HDP roste i ekonomika na daném území. A když se daří, mohou růst i platy, což je vidět i v našich datech. Ve sledovaném období se nachází pouze dva roky, kdy růst/pokles HDP nekoreluje s růstem/poklesem mezd. Dopad to však má na rok následující.. U cen potravin je úměra k HDP naopak nepřímá. HDP roste, ceny klesají a via versa.
