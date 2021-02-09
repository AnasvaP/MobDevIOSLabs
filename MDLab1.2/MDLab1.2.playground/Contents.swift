//
//import Foundation
//
//// Частина 1
//
//// Дано рядок у форматі "Student1 - Group1; Student2 - Group2; ..."
//
//let studentsStr = "Дмитренко Олександр - ІП-84; Матвійчук Андрій - ІВ-83; Лесик Сергій - ІО-82; Ткаченко Ярослав - ІВ-83; Аверкова Анастасія - ІО-83; Соловйов Даніїл - ІО-83; Рахуба Вероніка - ІО-81; Кочерук Давид - ІВ-83; Лихацька Юлія - ІВ-82; Головенець Руслан - ІВ-83; Ющенко Андрій - ІО-82; Мінченко Володимир - ІП-83; Мартинюк Назар - ІО-82; Базова Лідія - ІВ-81; Снігурець Олег - ІВ-81; Роман Олександр - ІО-82; Дудка Максим - ІО-81; Кулініч Віталій - ІВ-81; Жуков Михайло - ІП-83; Грабко Михайло - ІВ-81; Іванов Володимир - ІО-81; Востриков Нікіта - ІО-82; Бондаренко Максим - ІВ-83; Скрипченко Володимир - ІВ-82; Кобук Назар - ІО-81; Дровнін Павло - ІВ-83; Тарасенко Юлія - ІО-82; Дрозд Світлана - ІВ-81; Фещенко Кирил - ІО-82; Крамар Віктор - ІО-83; Іванов Дмитро - ІВ-82"
//
//// Завдання 1
//// Заповніть словник, де:
//// - ключ – назва групи
//// - значення – відсортований масив студентів, які відносяться до відповідної групи
//
//var studentsGroups: [String: [String]] = [:]
//
//// Ваш код починається тут
//
//var part = studentsStr.components(separatedBy: ";")
//var arrayNameGroup: [String] = []
//var arrayOfNames: [String] = []
//var arrayOfGroups: [String] = []
//var arrayOfValuesArray: [[String]] = [[]]
//
//for i in 0..<part.count{
//    arrayNameGroup.append(contentsOf: part[i].components(separatedBy: " - "))
//}
//
//arrayOfNames.append(arrayNameGroup[0])
//for i in 1..<arrayNameGroup.count{
//    if i%2 != 0 {
//        arrayOfGroups.append(arrayNameGroup[i])
//    } else {
//        arrayOfNames.append(arrayNameGroup[i])
//    }
//}
//
//for i in 0..<arrayOfNames.count {
//    if arrayOfNames[i].first == " " {
//        arrayOfNames[i].remove(at: arrayOfNames[i].startIndex)
//    }
//}
//
//for i in arrayOfGroups{
//    studentsGroups.updateValue([], forKey: i)
//}
//
//for (k,_) in studentsGroups {
//    var arr: [String] = []
//    for i in 0..<arrayOfGroups.count{
//        if k == arrayOfGroups[i]{
//            arr.append(arrayOfNames[i])
//        }
//    }
//    arr.sort()
//    studentsGroups.updateValue(arr, forKey: k)
//}
//// Ваш код закінчується тут
//print("Завдання 1")
//print(studentsGroups)
//print()
//
//// Дано масив з максимально можливими оцінками
//
//let points: [Int] = [12, 12, 12, 12, 12, 12, 12, 16]
//
//// Завдання 2
//// Заповніть словник, де:
//// - ключ – назва групи
//// - значення – словник, де:
////   - ключ – студент, який відносяться до відповідної групи
////   - значення – масив з оцінками студента (заповніть масив випадковими значеннями, використовуючи функцію `randomValue(maxValue: Int) -> Int`)
//
//func randomValue(maxValue: Int) -> Int {
//    switch(arc4random_uniform(6)) {
//    case 1:
//        return Int(ceil(Float(maxValue) * 0.7))
//    case 2:
//        return Int(ceil(Float(maxValue) * 0.9))
//    case 3, 4, 5:
//        return maxValue
//    default:
//        return 0
//    }
//}
//
//var studentPoints: [String: [String: [Int]]] = [:]
//
//// Ваш код починається тут
//
//for (k,v) in studentsGroups{
//    var dictionary: [String:[Int]] = [:]
//    for i in v {
//        var arr: [Int] = []
//        for i in 0..<points.count{
//            arr.append(randomValue(maxValue: points[i]))
//        }
//        dictionary.updateValue(arr, forKey: i)
//        studentPoints.updateValue(dictionary, forKey: k)
//    }
//}
//
//// Ваш код закінчується тут
//
//print("Завдання 2")
//print(studentPoints)
//print()
//
//// Завдання 3
//// Заповніть словник, де:
//// - ключ – назва групи
//// - значення – словник, де:
////   - ключ – студент, який відносяться до відповідної групи
////   - значення – сума оцінок студента
//
//var sumPoints: [String: [String: Int]] = [:]
//
//// Ваш код починається тут
//
//var arrayOfSumsForOneStudent: [Int] = []
//for (k,v) in studentPoints{
//    var dictionary: [String:Int] = [:]
//    for (k2,v2) in v {
//        var sumOfPointsForOneStudent = 0
//        for i in v2 {
//            sumOfPointsForOneStudent += i
//        }
//        dictionary.updateValue(sumOfPointsForOneStudent, forKey: k2)
//        sumPoints.updateValue(dictionary, forKey: k)
//    }
//}
//
//// Ваш код закінчується тут
//
//print("Завдання 3")
//print(sumPoints)
//print()
//
//// Завдання 4
//// Заповніть словник, де:
//// - ключ – назва групи
//// - значення – середня оцінка всіх студентів групи
//
//var groupAvg: [String: Float] = [:]
//
//// Ваш код починається тут
//
//for (k,v) in sumPoints {
//    var avgForOneGroup: Float = 0
//    var count: Float = 0.0
//    for (_,v2) in v{
//        count += 1
//        avgForOneGroup += Float(v2)
//    }
//    groupAvg.updateValue(avgForOneGroup/count, forKey: k)
//}
//
//// Ваш код закінчується тут
//
//print("Завдання 4")
//print(groupAvg)
//print()
//
//// Завдання 5
//// Заповніть словник, де:
//// - ключ – назва групи
//// - значення – масив студентів, які мають >= 60 балів
//
//var passedPerGroup: [String: [String]] = [:]
//
//// Ваш код починається тут
//
//for (k,v) in sumPoints {
//    var arr: [String] = []
//    for (k2,v2) in v{
//        if v2 >= 60 {
//            arr.append(k2)
//            passedPerGroup.updateValue(arr, forKey: k)
//        }
//    }
//}
//
//// Ваш код закінчується тут
//
//print("Завдання 5")
//print(passedPerGroup)
//
//// Приклад виведення. Ваш результат буде відрізнятися від прикладу через використання функції random для заповнення масиву оцінок та через інші вхідні дані.
////
////Завдання 1
////["ІВ-73": ["Гончар Юрій", "Давиденко Костянтин", "Капінус Артем", "Науменко Павло", "Чередніченко Владислав"], "ІВ-72": ["Бортнік Василь", "Киба Олег", "Овчарова Юстіна", "Тимко Андрій"], "ІВ-71": ["Андрющенко Данило", "Гуменюк Олександр", "Корнійчук Ольга", "Музика Олександр", "Трудов Антон", "Феофанов Іван"]]
////
////Завдання 2
////["ІВ-73": ["Давиденко Костянтин": [5, 8, 9, 12, 11, 12, 0, 0, 14], "Капінус Артем": [5, 8, 12, 12, 0, 12, 12, 12, 11], "Науменко Павло": [4, 8, 0, 12, 12, 11, 12, 12, 15], "Чередніченко Владислав": [5, 8, 12, 12, 11, 12, 12, 12, 15], "Гончар Юрій": [5, 6, 0, 12, 0, 11, 12, 11, 14]], "ІВ-71": ["Корнійчук Ольга": [0, 0, 12, 9, 11, 11, 9, 12, 15], "Музика Олександр": [5, 8, 12, 0, 11, 12, 0, 9, 15], "Гуменюк Олександр": [5, 8, 12, 9, 12, 12, 11, 12, 15], "Трудов Антон": [5, 0, 0, 11, 11, 0, 12, 12, 15], "Андрющенко Данило": [5, 6, 0, 12, 12, 12, 0, 9, 15], "Феофанов Іван": [5, 8, 12, 9, 12, 9, 11, 12, 14]], "ІВ-72": ["Киба Олег": [5, 8, 12, 12, 11, 12, 0, 0, 11], "Овчарова Юстіна": [5, 8, 12, 0, 11, 12, 12, 12, 15], "Бортнік Василь": [4, 8, 12, 12, 0, 12, 9, 12, 15], "Тимко Андрій": [0, 8, 11, 0, 12, 12, 9, 12, 15]]]
////
////Завдання 3
////["ІВ-72": ["Бортнік Василь": 84, "Тимко Андрій": 79, "Овчарова Юстіна": 87, "Киба Олег": 71], "ІВ-73": ["Капінус Артем": 84, "Науменко Павло": 86, "Чередніченко Владислав": 99, "Гончар Юрій": 71, "Давиденко Костянтин": 71], "ІВ-71": ["Корнійчук Ольга": 79, "Трудов Антон": 66, "Андрющенко Данило": 71, "Гуменюк Олександр": 96, "Феофанов Іван": 92, "Музика Олександр": 72]]
////
////Завдання 4
////["ІВ-71": 79.333336, "ІВ-72": 80.25, "ІВ-73": 82.2]
////
////Завдання 5
////["ІВ-72": ["Бортнік Василь", "Киба Олег", "Овчарова Юстіна", "Тимко Андрій"], "ІВ-73": ["Давиденко Костянтин", "Капінус Артем", "Чередніченко Владислав", "Гончар Юрій", "Науменко Павло"], "ІВ-71": ["Музика Олександр", "Трудов Антон", "Гуменюк Олександр", "Феофанов Іван", "Андрющенко Данило", "Корнійчук Ольга"]]

print()
print("PART2")

enum Direction {
    case latitude//широта
    case longitude //довгота
}


class CoordinateAP{
    
    var degrees: Int
    var minutes: UInt
    var seconds: UInt
    
    var direction = Direction.self

    init() {
        self.degrees = 0
        self.minutes = 0
        self.seconds = 0
    }
    
    init(degrees: Int, mimutes: UInt, seconds:UInt ) {
        self.degrees = degrees
        self.minutes = mimutes
        self.seconds = seconds
    }
    
    func choosePartOfTheWorld(dir: Direction) -> String{
        var directionString: String = "Z"
        if dir == Direction.latitude && degrees >= -90 && degrees <= 90 && minutes >= 0 && minutes <= 59 && seconds >= 0 && seconds <= 59  {
            switch degrees {
                case -90..<0 : directionString = "S"
                case 0...90 : directionString = "N"
                default:
                    print("error")
                }
            }
        
        else if dir == Direction.longitude && degrees >= -180 && degrees <= 180 && minutes >= 0 && minutes <= 59 && seconds >= 0 && seconds <= 59  {
            switch degrees {
                case -180..<0 : directionString = "W"
                case 0...180 : directionString = "E"
                default:
                    print("error")
                }
        }
        else {
                print("ERROR - input another value")
                return "error"
            }
        return directionString
    }
    
    func taskD(coord1: CoordinateAP, coord2: CoordinateAP, dir1: Direction, dir2: Direction) -> CoordinateAP? {
        let avgCoord: CoordinateAP = CoordinateAP()
        if coord1.choosePartOfTheWorld(dir: dir1) == coord1.choosePartOfTheWorld(dir: dir2) {
            avgCoord.degrees = (coord1.degrees + coord2.degrees)/2
            avgCoord.minutes = (coord1.minutes + coord2.minutes)/2
            avgCoord.seconds = (coord1.seconds + coord2.seconds)/2
        } else {
            print("coordinate task c2 =  nil")
            return nil
        }
        print("coordinate task c2 = ", avgCoord.degrees, avgCoord.minutes, avgCoord.seconds)
        return avgCoord
    }
}



func taskA(coord: CoordinateAP, dir: Direction) -> String {  // “xx°yy′zz″ Z”
    return "\(coord.degrees)°\(coord.minutes)′\(coord.seconds)″ \(coord.choosePartOfTheWorld(dir: dir))"
}

func taskB(coord: CoordinateAP, dir: Direction) -> String {
    let doubleMinutes: Double = Double(coord.minutes)
    let doubleSeconds: Double = Double(coord.minutes)
    return "\(Double(coord.degrees) + doubleMinutes / 60 + doubleSeconds / 3600) °\(coord.choosePartOfTheWorld(dir: dir))"
}

func taskC(coord1: CoordinateAP, coord2: CoordinateAP, dir1: Direction, dir2: Direction) -> CoordinateAP? {
    let avgCoord: CoordinateAP = CoordinateAP()
    if coord1.choosePartOfTheWorld(dir: dir1) == coord1.choosePartOfTheWorld(dir: dir2) {
        avgCoord.degrees = (coord1.degrees + coord2.degrees)/2
        avgCoord.minutes = (coord1.minutes + coord2.minutes)/2
        avgCoord.seconds = (coord1.seconds + coord2.seconds)/2
    } else {
        print("coordinate task c2 =  nil")
        return nil
    }
    print("coordinate task c = ", avgCoord.degrees, avgCoord.minutes, avgCoord.seconds)
    return avgCoord
}

var coord = CoordinateAP()
var coord1 = CoordinateAP(degrees: 33, mimutes: 19, seconds: 25)
var coord2 = CoordinateAP(degrees: 40, mimutes: 50, seconds: 34)
print("task A = ", taskA(coord: coord1, dir: Direction.latitude))
print("task A = ", taskA(coord: coord2, dir: Direction.longitude))

print("task B = ", taskB(coord: coord1, dir: Direction.latitude))
print("task B = ", taskB(coord: coord2, dir: Direction.longitude))

taskC(coord1: CoordinateAP(degrees: 22, mimutes: 4, seconds: 6), coord2: CoordinateAP(degrees: 56, mimutes: 3, seconds: 12), dir1: Direction.longitude, dir2: Direction.latitude)
coord.taskD(coord1: coord1, coord2: coord2, dir1: Direction.latitude, dir2: Direction.latitude)
