//
//  ActivityEventTransmissionManager.swift
//  
//
//  Created by Francisco Guerrero Escamilla on 09/08/23.
//

import Foundation
import RookConnectTransmission

/// The Access point to transmit the activity events to the rook server
///
/// Use `ActivityEventTransmissionManager` to store new, retrieve and upload activity events.
public final class ActivityEventTransmissionManager {
  
  // MARK:  Properties
  
  private let activityManager: RookActivityEventTransmissionManager = RookActivityEventTransmissionManager()
  
  // MARK:  Init
  
  public init() {
  }
  
  // MARK:  Helpers
  
  /// Stores new activity events that comes from RookAppleHealth SDK
  ///
  /// Use this method when you want to store data that comes from RookAppleHealth SDK
  public func enqueueActivityEvent(_ eventData: Data,
                                 completion: @escaping (Result<Bool,Error>) -> Void) {
    self.activityManager.enqueActivityEvent(eventData, completion: completion)
  }
  
  ///Stores new physical data using an array of `RookActivityEventTransmission` objects
  ///
  ///Use this method when the activity events comes from other data source.
  public func enqueueActivityEvents(_ events: [RookActivityEventTransmission],
                                     completion: @escaping (Result<Bool, Error>) -> Void) {
    self.activityManager.enqueueActitivtyEvents(events, completion: completion)
  }
  
  /// Returns an array of `RookActivityEventTransmission` objects stored locally
  public func getActivityEvents(completion: @escaping (Result<[RookActivityEventTransmission], Error>) -> Void) {
    self.activityManager.getActivityEvents(completion: completion)
  }
  
  /// Uploads all the activity events stored locally and deletes all that were uploaded successfully
  public func uploadEvents(completion: @escaping (Result<Bool, Error>) -> Void) {
    self.activityManager.uploadEvents(completion: completion)
  }
  
}
