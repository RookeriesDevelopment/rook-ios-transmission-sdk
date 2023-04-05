//
//  File.swift
//  
//
//  Created by Francisco Guerrero Escamilla on 04/04/23.
//

import Foundation
import RookConnectTransmission

/// The Access point to transmit the physical data to the rook server
///
/// User `PhysicalTransmissionManager` to enque new summaries, get physical data stored and upload physical data to the server
public class PhysicalTransmissionManager {
  
  // MARK:  Properties
  
  private let physicalTransmission: RookPhysicalTransmissionManager = RookPhysicalTransmissionManager()
  
  // MARK:  Init
  
  public init() {
    
  }
  
  // MARK:  Helpers
  
  
  /// Stores new physical data that comes from the RookAppleHealth SDK
  ///
  /// Use this method when you want to store data that comes form RookAppleHealth SDK
  public func enqueuePhysicalSummary(with extractionData: Data,
                                     completion: @escaping (Result<Bool, Error>) -> Void) {
    physicalTransmission.enqueuePhysicalSummary(with: extractionData,
                                                completion: completion)
  }
  
  ///Stores new physical data using the object `RookSleepDataTransmissionDTO`
  ///
  ///Use this method when have physical data from others providers. the bellow example shows how to create a `RookPhysicalDataTransmissionDTO` object
  ///
  ///     let physicalDTO: RookPhysicalDataTransmissionDTO = RookPhysicalDataTransmissionDTO.RookPhysicalDataTransmissionDTOBuilder()
  ///     .addDateTime(date: Date())
  ///     .addCaloriesData(caloriesNetIntakeKilocalories: 0,
  ///     caloriesExpenditureKilocalories: 0,
  ///     caloriesNetActiveKilocalories: 670,
  ///     caloriesBasalMetabolicRateKilocalories: 1900)
  ///     .addDistanceData(physicalHealthScore: nil,
  ///     stepsPerDayNumber: 1790,
  ///     stepsGranularDataStepsPerHr: [],
  ///     activeStepsPerDayNumber: 500,
  ///     activeStepsGranularDataStepsPerHr: [],
  ///     walkedDistanceMeters: 2000,
  ///     traveledDistanceMeters: 4000,
  ///     traveledDistanceGranularDataMeters: [],
  ///     floorsClimbedNumber: 12,
  ///     floorsClimbedGranularDataFloors: [])
  ///     .buildPhysicalDataTransmission()
  ///
  ///
  /// - parameter summary: `RookPhysicalDataTransmissionDTO` objet to store
  /// - parameter completion: completion block that returns an Error or a Bool indicating if the object was stored
  public func enqueuePhysicalSummary(with physicalDTO: RookPhysicalDataTransmissionDTO,
                                     completion: @escaping (Result<Bool, Error>) -> Void) {
    physicalTransmission.enqueuePhysicalSummary(with: physicalDTO,
                                                completion: completion)
  }
  
  /// Returns an array of `RookPhysicalSummaryTransmission` objects stored locally
  public func getPhysicalSummariesStored(completion: @escaping (Result<[RookPhysicalSummaryTransmission], Error>) -> Void) {
    physicalTransmission.getPhysicalSummariesStored(completion: completion)
  }
  
  /// Uploads physical summaries stored locally and deletes all the summaries uploaded successfully
  public func uploadPhysicalSummaries(completion: @escaping (Result<Bool, Error>) -> Void) {
    physicalTransmission.uploadPhysicalSummaries(completion: completion)
  }
  
}
