//
//  HeartRateEventTransmissionManager.swift
//  
//
//  Created by Francisco Guerrero Escamilla on 09/08/23.
//

import Foundation
import RookConnectTransmission

/// The Access point to transmit the heart rate events to the rook server
///
/// Use `HeartRateEventTransmissionManager` to store, retrieve and upload heart rate events
public final class HeartRateEventTransmissionManager {
  
  // MARK:  Properties
  
  private let rookHrManager: RookHrEventTransmissionManager = RookHrEventTransmissionManager()
  
  // MARK:  Init
  
  public init() {
  }
  
  // MARK:  Helpers
  
  /// Stores new heart rate events that comes from RookAppleHealth SDK
  ///
  /// Use this method when you want to store data that comes from RookAppleHealth SDK
  public func enqueueHrEvent(_ eventData: Data,
                             completion: @escaping (Result<Bool, Error>) -> Void) {
    self.rookHrManager.enqueueHrEvent(eventData,
                                      completion: completion)
  }
  
  ///Stores new physical data using an array of `RookHeartRateEventTransmission` objects
  ///
  ///Use this method when the heart rate events comes from other data source. the bellow example shows how to create a `[RookHeartRateEventTransmission]` object
  public func enqueueHrEvents(_ events: [RookHeartRateEventTransmission],
                              completion: @escaping (Result<Bool, Error>) -> Void) {
    self.rookHrManager.enqueueHrEvents(events,
                                       completion: completion)
  }
  
  /// Returns an array of `RookHeartRateEventTransmission` objects stored locally when the user was in an activity session
  public func getHrEventsStored(completion: @escaping (Result<[RookHeartRateEventTransmission], Error>) -> Void) {
    self.rookHrManager.getHrEventsStored(completion: completion)
  }
  
  /// Returns an array of `RookHeartRateEventTransmission` objects stored locally when the user was not in an activity session.
  public func getBodyHrEventsStored(completion: @escaping (Result<[RookHeartRateEventTransmission], Error>) -> Void) {
    self.rookHrManager.getBodyHrEventsStored(completion: completion)
  }
  
  /// Uploads all the heart rate events stored locally and deletes all that were uploaded successfully
  public func uploadHrEvents(completion: @escaping (Result<Bool, Error>) -> Void) {
    self.rookHrManager.uploadHrEvents(completion: completion)
  }
}
