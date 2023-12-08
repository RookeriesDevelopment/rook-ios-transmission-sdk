//
//  GlucoseEventTransmissionManager.swift
//  
//
//  Created by Francisco Guerrero Escamilla on 07/12/23.
//

import Foundation
import RookConnectTransmission

/// The Access point to transmit the blood glucose events to the rook server
///
/// Use `GlucoseEventTransmissionManager` to store new and upload blood glucose events.
public final class GlucoseEventTransmissionManager {
  
  // MARK:  Properties
  
  private let glucoseManager: RookGlucoseEventTransmissionManager = RookGlucoseEventTransmissionManager()
  
  // MARK:  Init
  
  public init() {
  }
  
  // MARK:  Helpers
  
  /// Stores new blood glucose events that comes from RookAppleHealth SDK
  ///
  /// Use this method when you want to store data that comes from RookAppleHealth SDK
  public func enqueueGlucoseEvent(_ eventData: Data,
                                 completion: @escaping (Result<Bool,Error>) -> Void) {
    self.glucoseManager.enqueueGlucoseEvent(eventData, completion: completion)
  }
  
  ///Stores new blood glucose data using an array of `RookGlucoseEventTransmission` objects
  ///
  ///Use this method when the blood glucose events comes from other data source.
  public func enqueueGlucoseEvents(_ events: [RookGlucoseEventTransmission],
                                     completion: @escaping (Result<Bool, Error>) -> Void) {
    self.glucoseManager.enqueueGlucoseEvents(events, completion: completion)
  }
  
  /// Returns an array of `RookBloodPressureEventTransmission` objects stored locally
  public func getActivityEvents(completion: @escaping (Result<[RookGlucoseEventTransmission], Error>) -> Void) {
    self.glucoseManager.getGlucoseEvents(completion: completion)
  }
  
  /// Uploads all the blood glucose events stored locally and deletes all that were uploaded successfully
  public func uploadEvents(completion: @escaping (Result<Bool, Error>) -> Void) {
    self.glucoseManager.uploadEvents(completion: completion)
  }
  
}


