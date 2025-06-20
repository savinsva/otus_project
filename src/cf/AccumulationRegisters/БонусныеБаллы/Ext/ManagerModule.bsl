﻿
#Область ПрограммныйИнтерфейс

Функция ПолучитьОстатокБонусныхБаллов(ВидКартЛояльности, Партнер) Экспорт

	Результат = 0;
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	БонусныеБаллыОстатки.ВидКартЛояльности КАК ВидКартЛояльности,
		|	БонусныеБаллыОстатки.Партнер КАК Партнер,
		|	БонусныеБаллыОстатки.НачисленоОстаток + БонусныеБаллыОстатки.КСписаниюОстаток КАК ДоступноКСписанию
		|ИЗ
		|	РегистрНакопления.БонусныеБаллы.Остатки(
		|			,
		|			ВидКартЛояльности = &ВидКартЛояльности
		|				И Партнер = &Партнер) КАК БонусныеБаллыОстатки";
	
	Запрос.УстановитьПараметр("ВидКартЛояльности", ВидКартЛояльности);
	Запрос.УстановитьПараметр("Партнер", Партнер);
	
	Выборка = Запрос.Выполнить().Выбрать();

	Если Выборка.Следующий() Тогда
		
		Результат = Выборка.ДоступноКСписанию;

	КонецЕсли;

	Возврат Результат;

КонецФункции

#КонецОбласти