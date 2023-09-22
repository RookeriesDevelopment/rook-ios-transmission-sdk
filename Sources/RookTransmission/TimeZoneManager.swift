//
//  TimeZoneManager.swift
//  
//
//  Created by Francisco Guerrero Escamilla on 22/09/23.
//

import Foundation
import RookConnectTransmission

public final class TimeZoneManager {
  
  // MARK:  Properties
  
  private let timeZoneManager: RookTimeZoneManager = RookTimeZoneManager()
  
  // MARK:  Init
  
  public init() {
    
  }
  
  // MARK:  Helpers
  
  /// Uploads the user's time zone, a user have to be added before use this method.
  /// - parameter timezone: `String` This parameter has to be a TZ Identifier
  /// - parameter offset: `Int` the difference in hours between the current time zone and UTC
  /// - parameter completion: completion block that returns an Error or a Bool indicating if the object was received
  public func uploadUserTimeZone(timezone: String,
                                 offset: Int,
                                 completion: @escaping (Result<Bool, Error>) -> Void) {
    self.timeZoneManager.uploadUserTimeZone(
      timezone: timezone,
      offset: offset,
      completion: completion)
  }
  
}
