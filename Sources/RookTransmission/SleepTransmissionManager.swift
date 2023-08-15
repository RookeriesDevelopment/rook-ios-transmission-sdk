//
//  SleepTransmissionManager.swift
//  
//
//  Created by Francisco Guerrero Escamilla on 04/04/23.
//

import Foundation
import RookConnectTransmission

/// The Access point to transmit the sleep data to the rook server
///
/// Use `SleepTransmissionManager` to enque new summaries, get sleep data stored and upload sleep data to the server
public class SleepTransmissionManager {
  
  // MARK:  Properties
  
  private let sleepManager: RookSleepTransmissionManager = RookSleepTransmissionManager()
  
  // MARK:  Init
  
  public init() {
    
  }
  
  // MARK:  Helepers
  
  /// Stores new sleep data that comes from the RookAppleHealth SDK
  ///
  /// Use this method when you want to store data that comes from RookAppleHealth SDK
  public func enqueueSleepSummary(with extractionData: Data,
                                  completion: @escaping (Result<Bool, Error>) -> Void) {
    
    sleepManager.enqueueSleepSummary(with: extractionData,
                                     completion: completion)
  }
  
  ///Stores new sleep data using the object `RookSleepDataTransmissionDTO`
  ///
  ///Use this method when the sleep data comes from others providers. the bellow example shows how to create a `RookSleepDataTransmissionDTO` object
  ///
  ///     let sleepDTO: RookSleepDataTransmissionDTO = RookSleepDataTransmissionDTO.RookSleepDataTransmissionDTOBuilder()
  ///       .addDateTime(date: Date())
  ///       .addSleepDate(sleepStartDatetime: Date(),
  ///                     sleepEndDatetime: Date(),
  ///                     sleepDate: Date())
  ///       .addSleepTime(sleepDurationSeconds: 100,
  ///                     timeInBedSeconds: 100,
  ///                     lightSleepDurationSeconds: 100,
  ///                     remSleepDurationSeconds: 100,
  ///                     deepSleepDurationSeconds: 100,
  ///                     timeToFallAsleepSeconds: 100,
  ///                     timeAwakeDuringSleepSeconds: 100)
  ///       .buildSleepDataTransmission()
  ///
  ///
  /// - parameter summary: `RookSleepDataTransmissionDTO` objet to store
  /// - parameter completion: completion block that returns an Error or a Bool indicating if the object was stored
  public func enqueueSleepSummary(with summary: RookSleepDataTransmissionDTO,
                                  completion: @escaping(Result<Bool, Error>) -> Void) {
    sleepManager.enqueueSleepSummary(with: summary, completion: completion)
  }
  
  /// Returns an array of `RookSleepSummaryTransmission` objects stored locally
  public func getSleepSummariesStored(completion: @escaping (Result<[RookSleepDataTransmissionDTO], Error>) -> Void) {
    sleepManager.getSleepSummariesStored(completion: completion)
  }
  
  /// Uploads sleep summaries stored locally and deletes all the summaries uploaded successfully
  public func uploadSleepSummaries(completion: @escaping (Result<Bool, Error>) -> Void) {
    sleepManager.uploadSleepSummaries(completion: completion)
  }
  
}
