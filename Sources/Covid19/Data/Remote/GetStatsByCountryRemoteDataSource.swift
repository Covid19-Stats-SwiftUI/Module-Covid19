//
//  File.swift
//  
//
//  Created by Ari Supriatna on 03/02/21.
//

import Foundation
import Alamofire
import Combine
import Covid19StatsCore

public struct GetStatsByCountryRemoteDataSource: DataSource {
  
  public typealias Request = String
  public typealias Response = GlobalCaseStatsResponse
  
  private let _endpoint: String
  
  public init(endpoint: String) {
    _endpoint = endpoint
  }
  
  public func execute(request: String?) -> AnyPublisher<GlobalCaseStatsResponse, Error> {
    return Future<GlobalCaseStatsResponse, Error> { completion in
      
      guard let url = URL(string: "\(_endpoint)\(request ?? "")") else { return }
      
      AF.request(url)
        .validate()
        .responseDecodable(of: GlobalCaseStatsResponse.self) { response in
          switch response.result {
          case .success(let result):
            completion(.success(result))
          case .failure:
            completion(.failure(CovidAPIError.invalidSerialization))
            debugPrint("Failure: \(response)")
          }
        }
      
    }.eraseToAnyPublisher()
  }
  
}
