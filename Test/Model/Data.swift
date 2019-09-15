//
//  Data.swift
//  Test
//
//  Created by Kanat Kuanyshbek on 9/14/19.
//  Copyright © 2019 Kanat Kuanyshbek. All rights reserved.
//

import Foundation

class Data2 {
    // тут должно быть через Дату
    class func getData() -> [DateModel] {
        var data = [DateModel]()
        data.append(DateModel(dayName: "день", date: "Любой"))
        data.append(DateModel(dayName: "ПН", date: "9"))
        data.append(DateModel(dayName: "ВТ", date: "10"))
        data.append(DateModel(dayName: "СР", date: "11"))
        data.append(DateModel(dayName: "ЧТ", date: "12"))
        data.append(DateModel(dayName: "ПТ", date: "13"))
        data.append(DateModel(dayName: "СБ", date: "14"))
        data.append(DateModel(dayName: "ВС", date: "15"))
        return data
    }
}
