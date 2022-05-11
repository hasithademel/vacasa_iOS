//
//  SettingsViewModel.swift
//  Vacasa
//
//  Created by Hasitha De Mel on 10/05/22.
//

import Foundation
import UIKit

class SettingsViewModel: ObservableObject {
    
    func getHeaderForSection(section: Int) -> String? {
        if section == 0 {
            return "SUPPORT"
        }
        return nil
    }
    
    func getAppVersion() -> String {
        UIApplication.version
    }
}
