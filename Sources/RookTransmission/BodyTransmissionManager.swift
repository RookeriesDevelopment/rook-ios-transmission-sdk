//
//  BodyTransmissionManager.swift
//  
//
//  Created by Francisco Guerrero Escamilla on 04/04/23.
//

import Foundation
import RookConnectTransmission

/// The Access point to transmit the body data to the rook server
///
/// Use `BodyTransmissionManager` to enqueue new summaries, get body data stored and upload body data to the server
public class BodyTransmissionManager {
  
  // MARK:  Properties
  
  private let bodyTransmission: RookBodyTransmissionManager = RookBodyTransmissionManager()
  
  // MARK:  Init
  
  public init () {
    
  }
  
  // MARK:  Helpers
  
  /// Stores new body data that comes from the RookAppleHealth SDK
  ///
  /// Use this method when you want to store data that comes from RookAppleHealth SDK
  public func enqueueBodySummary(with extractionData: Data,
                                 completion: @escaping (Result<Bool, Error>) -> Void) {
    bodyTransmission.enqueueBodySummary(with: extractionData,
                                        completion: completion)
  }
  
  ///Stores new body data using the object `RookBodyDataTransmissionDTO`
  ///
  ///Use this method when have body data from others providers. the bellow example shows how to create a `RookBodyDataTransmissionDTO` object
  ///
  ///     let bodySummaryDTO: RookBodyDataTransmissionDTO = RookBodyDataTransmissionDTO.RookBodyDataTransmissionDTOBuilder()       .addDate(date: Date())
  ///           .addMesurements(waistCircumferenceCMNumber: 10,
  ///                           hipCircumferenceCMNumber: 10,
  ///                           chestCircumferenceCMNumber: 20)
  ///           .addBodyComposition(boneCompositionPercentageNumber: 98,
  ///                               muscleCompositionPercentageNumber: 99,
  ///                               weightKgNumber: 78,
  ///                               heightCMNumber: 173,
  ///                               bmiNumber: 20)
  ///           .buildBodyDataTransmission()
  ///
  ///
  /// - parameter summary: `RookBodyDataTransmissionDTO` objet to store
  /// - parameter completion: completion block that returns an Error or a Bool indicating if the object was stored
  public func enqueueBodySummary(with bodyDTO: RookBodyDataTransmissionDTO,
                                 completion: @escaping (Result<Bool, Error>) -> Void) {
    bodyTransmission.enqueueBodySummary(with: bodyDTO,
                                        completion: completion)
  }
  
  /// Returns an array of `RookBodySummaryTransmission` objects stored locally
  public func getBodySummariesStored(completion: @escaping(Result<[RookBodyDataTransmissionDTO],Error>) -> Void) {
    bodyTransmission.getBodySummariesStored(completion: completion)
  }
  
  /// Uploads body summaries stored locally and deletes all the summaries uploaded successfully
  public func uploadBodySummaries(completion: @escaping (Result<Bool, Error>) -> Void) {
    bodyTransmission.uploadBodySummaries(completion: completion)
  }
  
}
