//
//  BMICalculatorViewController.swift
//  BMI_App
//
//  Created by Apple on 11/8/20.
//  Copyright © 2020 trunghieu. All rights reserved.
//

import UIKit

class BMICalculatorViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var maleView: UIView!
    @IBOutlet weak var femaleView: UIView!
    
    @IBOutlet weak var heightView: UIView!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightViewSlider: UISlider!
    
    @IBOutlet weak var weightView: UIView!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var decreaseWeightViewButton: UIButton!
    @IBOutlet weak var increaseWeightViewButton: UIButton!
    
    @IBOutlet weak var ageView: UIView!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var decreaseAgetViewButton: UIButton!
    @IBOutlet weak var increaseAgeViewButton: UIButton!
    
    @IBOutlet weak var caculatorViewButton: UIButton!
    

    
    var height: Float = 150
    var weight: Float = 50
    var age: Float = 20
    var bmi: Float = 0
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addGesturesForButtons()
        autoLayoutBMICaculator()
        chooseMale()
        chooseFemale()
    }
    
    
    
    //MARK:- AutoLayout BMIcaculator
    //statusBar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //autoLayout
    func autoLayoutBMICaculator(){
        heightLabel.text = "150cm"
        weightLabel.text = "50"
        ageLabel.text = "20"
        maleView.layer.cornerRadius = 10
        femaleView.layer.cornerRadius = 10
        heightView.layer.cornerRadius = 10
        weightView.layer.cornerRadius = 10
        ageView.layer.cornerRadius = 10
        caculatorViewButton.layer.cornerRadius = 8

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        let radius = decreaseWeightViewButton.frame.size.height/2
//        print("Radius X: \(radius)")
        decreaseWeightViewButton.layer.cornerRadius = decreaseWeightViewButton.frame.size.height/2
        increaseWeightViewButton.layer.cornerRadius = increaseWeightViewButton.frame.size.height/2
        decreaseAgetViewButton.layer.cornerRadius = decreaseAgetViewButton.frame.size.height/2
        increaseAgeViewButton.layer.cornerRadius = increaseAgeViewButton.frame.size.height/2
    }
    
    //MARK:- action BMIcaculator
    //tap choose male
    private func chooseMale(){
        let tapgetureMale = UITapGestureRecognizer(target: self, action: #selector(tapMaleView))
        maleView.addGestureRecognizer(tapgetureMale)
    }
    
    @objc func tapMaleView(){
        maleView.backgroundColor = UIColor.gray
        femaleView.backgroundColor = UIColor(red:0.192, green:0.200, blue:0.259, alpha: 1.000)
    }
    
    //tap choose Female
    private func chooseFemale(){
        let tapgetureFemale = UITapGestureRecognizer(target: self, action: #selector(tapFemaleView))
        femaleView.addGestureRecognizer(tapgetureFemale)
    }
    @objc func tapFemaleView(){
        femaleView.backgroundColor = UIColor.gray
        maleView.backgroundColor = UIColor(red:0.192, green:0.200, blue:0.259, alpha: 1.000)
    }
    
    
    // Chọn chiều cao
    @IBAction func heightSlider(_ sender: UISlider) {
        heightLabel.text = String(Int(sender.value))+"cm"
        height = sender.value
        
    }
    
    // Giảm cân nặng
    @IBAction func decreaseWeightButton(_ sender: UIButton) {
        weightLabel.text = String(Int(weightLabel.text!)!-1)
        weight = Float(Int(weightLabel.text!)!)
    }
    
    
    // Tăng cân nặng
    @IBAction func increaseWeightButton(_ sender: UIButton) {
        weightLabel.text = String(Int(weightLabel.text!)!+1)
        weight = Float(Int(weightLabel.text!)!)
        
    }
    
    // Giảm tuổi
    @IBAction func decreaseAgeButton(_ sender: UIButton) {
        ageLabel.text = String(Int(ageLabel.text!)!-1)
        age = Float(Int(ageLabel.text!)!)
    }
    
    // Tăng tuổi
    @IBAction func increaseAgeButton(_ sender: UIButton) {
        ageLabel.text = String(Int(ageLabel.text!)!+1)
        age = Float(Int(ageLabel.text!)!)
    }
    

    
    @IBAction func caculatorButton(_ sender: UIButton) {
        bmi = weight/(powf(height/100, 2))
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vcResult = mainStoryboard.instantiateViewController(withIdentifier: "ResultBMIViewController") as! ResultBMIViewController
        
        switch bmi {
        case 0..<16:
            vcResult.evaluate = "Severe Thinness"
            vcResult.descriptionYourBody = "Bạn hãy ăn uống nhiều lên, bạn gầy quá"
            break
        case 16..<17:
            vcResult.evaluate = "Moderate Thinness"
            vcResult.descriptionYourBody = "Bạn hãy ăn uống nhiều lên, bạn gầy quá"
            break
        case 17..<18.5:
            vcResult.evaluate = "Mild Thinness"
            vcResult.descriptionYourBody = "Bạn hãy ăn uống nhiều lên, bạn gầy quá"
            break
        case 18.5..<25:
            vcResult.evaluate = "Normal"
            vcResult.descriptionYourBody = "Thân hình của bạn cân đối, hãy cố gắng duy trì nhé"
            break
        case 25..<30:
            vcResult.evaluate = "Overweight"
            vcResult.descriptionYourBody = "Bạn hơi béo 1 chút, hãy tập thể dục đi nhé "
            break
        case 30..<35:
            vcResult.evaluate = "Obese Class I"
            vcResult.descriptionYourBody = "Có vẻ bạn đã thừa cân"
            break
        case 35..<40:
            vcResult.evaluate = "Obese Class II"
            vcResult.descriptionYourBody = "Bạn hãy đi hút mỡ ngay đi nhé"
            break
        case 40..<100:
            vcResult.evaluate = "Obese Class III"
            vcResult.descriptionYourBody = "Bạn quá béo rồi, làm sao bây giờ"
            break
        default:
            vcResult.evaluate = "ERROR"
            vcResult.descriptionYourBody = "Thông số không phù hợp"
        }
        
        // lấy 2 chữ số sau dấu ","
        let numberOfPlaces = 2.0
        let multiplier = pow(10.0, numberOfPlaces)
        let rounded = round(Double(bmi) * multiplier) / multiplier
        
        vcResult.index = String(rounded)
        vcResult.modalPresentationStyle = .fullScreen
        
        // hứng dữ liệu từ màn Result
        vcResult.passData = { [weak self] data in
            guard self != nil else { return }
            print(data)
        }
        
        present(vcResult, animated: true, completion: nil)
        
    }
    
    // MARK: Long press actions
    private func addGesturesForButtons() {
        // Decrease weight button
        let longDecreaseWeightGesture = UILongPressGestureRecognizer(target: self, action: #selector(onLongPressDecreaseWeight(_:)))
        decreaseWeightViewButton.addGestureRecognizer(longDecreaseWeightGesture)
        
        // Increase weight button
        let longIncreaseWeightGesture = UILongPressGestureRecognizer(target: self, action: #selector(onLongPressIncreaseWeight(_:)))
        increaseWeightViewButton.addGestureRecognizer(longIncreaseWeightGesture);

        // Decrease Age button
        let longDecreaseAgeGesture = UILongPressGestureRecognizer(target: self, action: #selector(onLongPressDecreaseAge(_:)))
        decreaseAgetViewButton.addGestureRecognizer(longDecreaseAgeGesture)

        // Increase Age button
        let longIncreaseAgeGesture = UILongPressGestureRecognizer(target: self, action: #selector(onLongPressIncreaseAge(_:)))
        increaseAgeViewButton.addGestureRecognizer(longIncreaseAgeGesture)
    }
    
    @objc func onLongPressDecreaseWeight(_ gesture: UILongPressGestureRecognizer) {

        switch gesture.state {
        case .began:
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(decreaseWeightButton(_:)), userInfo: nil, repeats: true)
        case .ended:
            timer.invalidate()
        default:
            break
        }
    }
    
    @objc func onLongPressIncreaseWeight(_ gesture: UILongPressGestureRecognizer) {

        switch gesture.state {
        case .began:
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(increaseWeightButton(_:)), userInfo: nil, repeats: true)
        case .ended:
            timer.invalidate()
        default:
            break
        }
    }
    
    @objc func onLongPressDecreaseAge(_ gesture: UILongPressGestureRecognizer) {

        switch gesture.state {
        case .began:
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(decreaseAgeButton(_:)), userInfo: nil, repeats: true)
        case .ended:
            timer.invalidate()
        default:
            break
        }
    }
    
    @objc func onLongPressIncreaseAge(_ gesture: UILongPressGestureRecognizer) {

        switch gesture.state {
        case .began:
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(increaseAgeButton(_:)), userInfo: nil, repeats: true)
        case .ended:
            timer.invalidate()
        default:
            break
        }
    }
}
