//
//  ViewController.swift
//  MVVM_Example
//
//  Created by Belal medhat on 11/9/20.
//  Copyright © 2020 Belal medhat. All rights reserved.
//

import UIKit
import Combine
class ViewController: UIViewController {
    private var cancellableBag = Set<AnyCancellable>()

    // MARK:- view owns viewModel
    var DogViewModel:DogVM = DogVM()
    override func viewDidLoad() {
        super.viewDidLoad()
//        DogViewModel
        // Do any additional setup after loading the view.
        BindData()
    }

    @IBOutlet weak var DogImage: UIImageView!
    
    @IBAction func ShowDog(_ sender: UIButton) {
        DogViewModel.callDog()
    }
    // MARK:- Dog ViewModel Binding
        func BindData(){
            _ = DogViewModel.$DogMessageData.sink(receiveCompletion: { _ in }) { (data) in
                if let url = URL(string: data ?? "" ) {
                    let dataNew = try? Data(contentsOf: url) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                        self.DogImage.image = UIImage(data: dataNew!)

                }

               
            }.store(in: &cancellableBag)

}
}
