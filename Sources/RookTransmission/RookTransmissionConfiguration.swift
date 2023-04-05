//
//  File.swift
//  
//
//  Created by Francisco Guerrero Escamilla on 04/04/23.
//

import Foundation
import RookConnectTransmission

/// `TransmissionSettings` configures the sdk before start using the sdk and init the sdk
///
/// Use the shared property to access the class
public class TransmissionSettings {
  
  // MARK:  Properties
  
  ///Returns the shated TransmissionSettings object
  public static let shared: TransmissionSettings = TransmissionSettings()
  
  private let rookSettings: RookTransmissionSettings = RookTransmissionSettings.shared
  
   
  ///Sets the configuration with `RookTransmissionConfiguration` object
  ///
  ///    let configuration = RookTransmissionConfiguration(urlAPI: "https://api.rook-connect.dev",
  ///                                                      clientUUID: "11111-47c1-4477-a8ce-2322222",
  ///                                                      secretKey: "QDWIHOQW21212JN2JKN")
  ///     TransmissionSettings.shared.setConfiguration(configuration)
  ///
  ///
  ///- parameter configutation : `RookTransmissionConfiguration` should contains the urlAPI, clientUUID and secretKey.
  public func setConfiguration(_ configutation: RookTransmissionConfiguration) {
    rookSettings.setConfiguration(configutation)
  }
  
  
  /// Sets the user id.
  ///
  /// This value is importa when you want to upload data to the server.
  ///
  ///  - parameter id: `String?` use the id of the user
  public func setUserId(_ id: String?) {
    rookSettings.setUserId(with: id)
  }
  
  
  /// Initializes the sdk and validates if the credetials are correct
  public func initRookTransmission() {
    rookSettings.initRookTransmission()
  }
  
  /// Returns a Bool value indicating if the sdk is available to use
  public func isTransmissionAvailable() -> Bool {
    return rookSettings.isTransmissionAvailable()
  }
  
}
