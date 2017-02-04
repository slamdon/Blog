//
//  StoneHospital.swift
//  Observer Pattern
//
//  Created by Don on 2017/1/10.
//  Copyright © 2017年 Don. All rights reserved.
//

import Foundation

class StoneHospital:Observer {
    func notify(item: String) {
        notifyDoctorsTodaySpecial(item: item)
    }
    
    func notifyDoctorsTodaySpecial(item:String) {
        print("notified doctors today's special \(item)")
    }
}
