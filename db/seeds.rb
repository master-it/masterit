# Encoding: utf-8 
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "admin@admin.ru", password: "admin@admin.ru", role: "admin")
Competition.create(year: 2013)
Competition.create(year: 2012)
tours = ["Школьный", "Муниципальный", "Областной"]
tours.each{|tour| Tour.create(name: tour)}
Nominate.create(name: "Тематический сайт")
Nominate.create(name: "2-мерная статичная графика")
Nominate.create(name: "3-мерная статичная графика")
Nominate.create(name: "Анимационный ролик - 2-х мерная графика")
Nominate.create(name: "Анимационный ролик - 3-х мерная графика")
Nominate.create(name: "Электронные учебные пособия")
Nominate.create(name: "Презентация в программе PowerPoint")
Nominate.create(name: "Презентация с использованием программ (Flash, Movie Maker и т.п)")
Nominate.create(name: "Программное творчество")
Nominate.create(name: "Компьютерные игры")
Nominate.create(name: "Видеомонтаж, видеосъемка")
Nominate.create(name: "Музыка")
Nominate.create(name: "Защита информации - номинация от лаборатории Касперского")
Nominate.create(name: "Свободное программное обеспечение (работы, выполненные на СПО)")
Nominate.create(name: "IT-интеграция – номинация, объединяющая не менее трех побед в разных
номинациях (для выдающихся участников)")
Nominate.create(name: "Реклама к юбилею Конкурса (видеоролики, графика и т.д.)")

