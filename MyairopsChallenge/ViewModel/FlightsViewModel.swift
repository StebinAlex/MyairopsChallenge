//
//  FlightsViewModel.swift
//  MyairopsChallenge
//
//  Created by Stebin Alex on 13/03/23.
//

import Foundation

@MainActor
class FlightsViewModel: ObservableObject {
    
    @Published var aircrafts = [Aircraft]()
    @Published var errorWarning: Error? = nil
    
    let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
        fetchFlightData()
    }
    
    @MainActor
    func fetchFlightData() {
        
        let headers = [
            "X-RapidAPI-Key": "a8dbe55619msh13553ab44135931p1f2424jsn6a129f14f3eb",
            "X-RapidAPI-Host": "aerodatabox.p.rapidapi.com"
        ]
         
        Task {
            let result: Result<[Aircraft], Error> = await apiClient.get(url: "https://aerodatabox.p.rapidapi.com/aircrafts/reg/TF-ELD/all?withImage=true", headers: headers) 
            switch result {
            case .success(let data):
                aircrafts.append(contentsOf: data)
            case .failure(let error):
                errorWarning = error
            }
        }
    }
    
    
    
}
