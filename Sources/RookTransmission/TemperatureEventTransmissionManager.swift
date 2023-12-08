//
//  TemperatureEventTransmissionManager.swift
//  
//
//  Created by Francisco Guerrero Escamilla on 07/12/23.
//

import Foundation
import RookConnectTransmission

/// The Access point to transmit the temperature events to the rook server
///
/// Use `TemperatureEventTransmissionManager` to store new and upload temperature events.
public final class TemperatureEventTransmissionManager {
  
  // MARK:  Properties
  
  private let temperatureManager: RookTemperatureEventTransmissionManager = RookTemperatureEventTransmissionManager()
  
  // MARK:  Init
  
  public init() {
  }
  
  // MARK:  Helpers
  
  /// Stores new temperature events that comes from RookAppleHealth SDK
  ///
  /// Use this method when you want to store data that comes from RookAppleHealth SDK
  public func enqueueTemperatureEvent(_ eventData: Data,
                                 completion: @escaping (Result<Bool,Error>) -> Void) {
    self.temperatureManager.enqueueTemperatureEvent(eventData, completion: completion)
  }
  
  ///Stores new temperature data using an array of `RookTemperatureEventTransmission` objects
  ///
  ///Use this method when the temperature events comes from other data source.
  public func enqueueActivityEvents(_ events: [RookTemperatureEventTransmission],
                                     completion: @escaping (Result<Bool, Error>) -> Void) {
    self.temperatureManager.enqueueTemperatureEvents(events, completion: completion)
  }
  
  /// Returns an array of `RookActivityEventTransmission` objects stored locally
  public func getActivityEvents(completion: @escaping (Result<[RookTemperatureEventTransmission], Error>) -> Void) {
    self.temperatureManager.getTemperatureEvents(completion: completion)
  }
  
  /// Uploads all the temperature events stored locally and deletes all that were uploaded successfully
  public func uploadEvents(completion: @escaping (Result<Bool, Error>) -> Void) {
    self.temperatureManager.uploadEvents(completion: completion)
  }
  
}

