//
//  BloodPressureEventTransmissionManager.swift
//  
//
//  Created by Francisco Guerrero Escamilla on 07/12/23.
//

import Foundation
import RookConnectTransmission

/// The Access point to transmit the blood pressure events to the rook server
///
/// Use `BloodPressureEventTransmissionManager` to store new and upload blood pressure events.
public final class BloodPressureEventTransmissionManager {
  
  // MARK:  Properties
  
  private let pressureManager: RookBloodPressureEventTransmissionManager = RookBloodPressureEventTransmissionManager()
  
  // MARK:  Init
  
  public init() {
  }
  
  // MARK:  Helpers
  
  /// Stores new blood pressure events that comes from RookAppleHealth SDK
  ///
  /// Use this method when you want to store data that comes from RookAppleHealth SDK
  public func enqueueBloodPressureEvent(_ eventData: Data,
                                 completion: @escaping (Result<Bool,Error>) -> Void) {
    self.pressureManager.enqueueBloodPressureEvent(eventData, completion: completion)
  }
  
  ///Stores new blood pressure data using an array of `RookBloodPressureEventTransmission` objects
  ///
  ///Use this method when the blood pressure events comes from other data source.
  public func enqueueBloodPressureEvents(_ events: [RookBloodPressureEventTransmission],
                                     completion: @escaping (Result<Bool, Error>) -> Void) {
    self.pressureManager.enqueueBloodPressureEvents(events, completion: completion)
  }
  
  /// Returns an array of `RookBloodPressureEventTransmission` objects stored locally
  public func getActivityEvents(completion: @escaping (Result<[RookBloodPressureEventTransmission], Error>) -> Void) {
    self.pressureManager.getBloodPressureEvents(completion: completion)
  }
  
  /// Uploads all the blood pressure events stored locally and deletes all that were uploaded successfully
  public func uploadEvents(completion: @escaping (Result<Bool, Error>) -> Void) {
    self.pressureManager.uploadEvents(completion: completion)
  }
  
}


