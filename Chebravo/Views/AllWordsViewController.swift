//
//  AllWordsViewController.swift
//  Chebravo
//
//  Created by Phillip Lundin on 28/06/2022.
//

import Foundation


struct AllWordsViewController {
    var WordCon = WordController()
    
    
    
    func GetListOfWords() {
        let fetchedRequest = WordCon.GetWords()
        
        for ele in fetchedRequest {
            print(ele.name ?? "NaN")
        }
        
    }
}
