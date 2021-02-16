//
//  ParseJSON.swift
//  mobileDevelopmentLab1.1
//
//  Created by Anastasiia Poliukovych on 15.02.2021.
//

import Foundation

class ParseJSON {
    
    var onCompletion : ( (currentData) -> Void )?
    
    func getData(){
        if let path = Bundle.main.path(forResource: "BooksList", ofType: "txt") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                if let currentdata = self.parseJSON(withData: data){
                    self.onCompletion?(currentdata)
                }
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }
    }
    
    func parseJSON(withData data: Data) -> currentData? {
        let decoder = JSONDecoder()
        do {
            let fileData = try decoder.decode(Github.self, from: data)
            guard let currentFileData = currentData(model: fileData) else {
                return nil
            }
            return currentFileData
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}

