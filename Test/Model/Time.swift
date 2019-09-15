//
//  Time.swift
//  Test
//
//  Created by Kanat Kuanyshbek on 9/14/19.
//  Copyright © 2019 Kanat Kuanyshbek. All rights reserved.
//

import Foundation

class Time {
    // тут должно быть через Дату
    class func getTime() -> [TimeModel] {
        var time = [TimeModel]()
        time.append(TimeModel(time: "Любое"))
        time.append(TimeModel(time: "0:00"))
        time.append(TimeModel(time: "1:00"))
        time.append(TimeModel(time: "2:00"))
        time.append(TimeModel(time: "3:00"))
        time.append(TimeModel(time: "4:00"))
        time.append(TimeModel(time: "5:00"))
        time.append(TimeModel(time: "6:00"))
        time.append(TimeModel(time: "8:00"))
        time.append(TimeModel(time: "9:00"))
        time.append(TimeModel(time: "10:00"))
        time.append(TimeModel(time: "11:00"))
        time.append(TimeModel(time: "12:00"))
        time.append(TimeModel(time: "13:00"))
        time.append(TimeModel(time: "14:00"))
        time.append(TimeModel(time: "15:00"))
        time.append(TimeModel(time: "16:00"))
        time.append(TimeModel(time: "17:00"))
        time.append(TimeModel(time: "18:00"))
        time.append(TimeModel(time: "19:00"))
        time.append(TimeModel(time: "20:00"))
        time.append(TimeModel(time: "21:00"))
        time.append(TimeModel(time: "22:00"))
        time.append(TimeModel(time: "23:00"))
        return time
    }
}
