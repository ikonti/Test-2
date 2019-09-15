//
//  City.swift
//  Test
//
//  Created by Kanat Kuanyshbek on 9/15/19.
//  Copyright © 2019 Kanat Kuanyshbek. All rights reserved.
//

import Foundation

class City {
    // Тут должно быть через api
    class func getCity() -> [CityModel] {
        var city = [CityModel]()
        city.append(CityModel(name: "Нур-Султан"))
        city.append(CityModel(name: "Алматы"))
        city.append(CityModel(name: "Актау"))
        city.append(CityModel(name: "Актобе"))
        city.append(CityModel(name: "Атырау"))
        city.append(CityModel(name: "Байконыр"))
        city.append(CityModel(name: "Балхаш"))
        city.append(CityModel(name: "Екибастуз"))
        city.append(CityModel(name: "Жанаозен"))
        city.append(CityModel(name: "Капшагай"))
        city.append(CityModel(name: "Караганда"))
        city.append(CityModel(name: "Каскелен"))
        city.append(CityModel(name: "Кентау"))
        city.append(CityModel(name: "Кокшетау"))
        city.append(CityModel(name: "Костанай"))
        city.append(CityModel(name: "Кульсары"))
        city.append(CityModel(name: "Кызылорда"))
        city.append(CityModel(name: "Павлодар"))
        city.append(CityModel(name: "Петропавловск"))
        city.append(CityModel(name: "Рудный"))
        city.append(CityModel(name: "Сарань"))
        city.append(CityModel(name: "Сатбаев"))
        city.append(CityModel(name: "Семей"))
        city.append(CityModel(name: "Степногорск"))
        city.append(CityModel(name: "Талдыкорган"))
        city.append(CityModel(name: "Тараз"))
        city.append(CityModel(name: "Темиртау"))
        city.append(CityModel(name: "Туркестан"))
        city.append(CityModel(name: "Уральск"))
        city.append(CityModel(name: "Усть-Каменогорск"))
        city.append(CityModel(name: "Шымкент"))
        return city
    }
}
