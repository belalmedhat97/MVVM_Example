//
//  DogViewModel.swift
//  MVVM_Example
//
//  Created by Belal medhat on 11/9/20.
//  Copyright © 2020 Belal medhat. All rights reserved.
//

import Foundation
import Combine

class DogVM:ObservableObject{

    private var cancellableBag = Set<AnyCancellable>()

    // MARK:- publish a dog image url
    @Published var DogMessageData:String?
    func callDog(){
        _ = Caller.Doggy().sink(receiveCompletion: { _ in }) { (Response) in
                self.DogMessageData = Response.message ?? ""
                print(Response.message ?? "")
            
        }.store(in: &cancellableBag)
        
    }
    
}
