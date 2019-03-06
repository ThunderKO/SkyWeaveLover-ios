//
//  IoTVC.swift
//  breakpoint
//
//  Created by KO TING on 26/2/2019.
//  Copyright © 2019 Caleb Stultz. All rights reserved.
//

import UIKit

class IoTVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var displayView: UIView!
    @IBOutlet weak var outerDisplayView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var redColor: Float = 0
    var greenColor: Float = 0
    var blueColor: Float = 0
    
    var redArr = Array(repeating: 0, count: 64)
    var greenArr = Array(repeating: 0, count: 64)
    var blueArr = Array(repeating: 0, count: 64)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        layout()
    }
    
    func layout() {
        redView.layer.cornerRadius = 10
        greenView.layer.cornerRadius = 10
        blueView.layer.cornerRadius = 10
        outerDisplayView.layer.cornerRadius = 32
        displayView.layer.cornerRadius = 24
    }
    
    @IBAction func redSliderAction(_ sender: Any) { changeColor() }
    @IBAction func greenSliderAction(_ sender: Any) { changeColor() }
    @IBAction func blueSliderAction(_ sender: Any) { changeColor() }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 64
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! MyCollectionViewCell
        cell.layer.borderWidth = 1.0;
        cell.layer.borderColor = UIColor.black.cgColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.red
    }
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        redColor = redSlider.value
        greenColor = greenSlider.value
        blueColor = blueSlider.value
        redArr[indexPath.item] = Int(round(redColor*255))
        greenArr[indexPath.item] = Int(round(greenColor*255))
        blueArr[indexPath.item] = Int(round(blueColor*255))
        cell?.backgroundColor = UIColor(displayP3Red: CGFloat(redColor), green: CGFloat(greenColor), blue: CGFloat(blueColor), alpha: 1.0)
        print(redArr)
        print(greenArr)
        print(blueArr)
    }
    
    func changeDisplayLabelColor() {
        displayView.backgroundColor = UIColor(displayP3Red: CGFloat(redColor), green: CGFloat(greenColor), blue: CGFloat(blueColor), alpha: 1.0)
        redView.backgroundColor = UIColor(displayP3Red: CGFloat(redColor), green: 0, blue: 0, alpha: 1.0)
        greenView.backgroundColor = UIColor(displayP3Red: 0, green: CGFloat(greenColor), blue: 0, alpha: 1.0)
        blueView.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: CGFloat(blueColor), alpha: 1.0)
    }
    
    func changeColor() {
        redColor = redSlider.value
        greenColor = greenSlider.value
        blueColor = blueSlider.value
        changeDisplayLabelColor()
    }
}
