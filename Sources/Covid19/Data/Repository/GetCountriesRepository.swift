//
//  GetCountriesRepository.swift
//  
//
//  Created by Ari Supriatna on 03/02/21.
//

import Foundation
import Combine
import Covid19StatsCore

public struct GetCountriesRepository<
  GetCountriesRemoteDataSource: DataSource,
  Transformer: Mapper
>: Repository
where GetCountriesRemoteDataSource.Response == [CountryResponse],
      Transformer.Response == [CountryResponse],
      Transformer.Domain == [CountryModel] {
  
  public typealias Request = Any
  public typealias Response = [CountryModel]
  
  private let _remoteDataSource: GetCountriesRemoteDataSource
  private let _mapper: Transformer
  
  public init(remoteDataSource: GetCountriesRemoteDataSource, mapper: Transformer) {
    _remoteDataSource = remoteDataSource
    _mapper = mapper
  }
  
  public func execute(request: Any?) -> AnyPublisher<[CountryModel], Error> {
    _remoteDataSource.execute(request: nil)
      .map { _mapper.transformResponseToDomain(response: $0) }
      .eraseToAnyPublisher()
  }
  
}
