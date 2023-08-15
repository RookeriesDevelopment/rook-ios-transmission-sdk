//
//  OxygenationEventTransmissionManager.swift
//  
//
//  Created by Francisco Guerrero Escamilla on 09/08/23.
//

import Foundation
import RookConnectTransmission

/// The Access point to transmit the oxygenation events to the rook server
///
/// Use `OxygenationEventTransmissionManager`  to store new, retrieve and upload oxygenation events.
public final class OxygenationEventTransmissionManager {
  
  // MARK:  Properties
  
  private let oxygenationManager: RookOxygenationEventTransmissionManager = RookOxygenationEventTransmissionManager()
  
  // MARK:  Init
  
  public init() {
  }
  
  // MARK:  Helpers
  
  /// Stores new oxygenation events that comes from RookAppleHealth SDK
  ///
  /// Use this method when you want to store data that comes from RookAppleHealth SDK
  public func enqueueOxygenationEvent(_ eventData: Data,
                                      completion: @escaping (Result<Bool, Error>) -> Void) {
    self.oxygenationManager.enqueueOxygenationEvent(eventData,
                                                    completion: completion)
  }
  
  ///Stores new physical data using an array of `RookOxygenationEventTransmission` objects.
  ///
  ///Use this method when the oxygenation events comes from other data source. the bellow example shows how to create a `[RookOxygenationEventTransmission]` object
  public func enqueueOxygenationEvents(_ events: [RookOxygenationEventTransmission],
                                       completion: @escaping (Result<Bool, Error>) -> Void) {
    self.oxygenationManager.enqueueOxygenationEvents(events, completion: completion)
  }
  
  /// Returns an array of `RookOxygenationEventTransmission` objects stored locally when the user was not in an activity session.
  public func getBodyOxygenationEvents(completion: @escaping (Result<[RookOxygenationEventTransmission], Error>) -> Void) {
    self.oxygenationManager.getBodyOxygenationEvents(completion: completion)
  }
  
  /// Returns an array of `RookOxygenationEventTransmission` objects stored locally when the user was in an activity session
  public func getOxygenationEvents(completion: @escaping (Result<[RookOxygenationEventTransmission], Error>) -> Void) {
    self.oxygenationManager.getOxygenationEvents(completion: completion)
  }
  
  /// Uploads all the oxygenation events stored locally and deletes all that  were uploaded successfully
  public func uploadEvent(completion: @escaping (Result<Bool, Error>) -> Void) {
    self.oxygenationManager.uploadEvent(completion: completion)
  }
  
}
