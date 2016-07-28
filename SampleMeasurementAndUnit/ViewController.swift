//
//  ViewController.swift
//  SampleMeasurementAndUnit
//
//  Created by Uchida Atsushi on 2016/07/28.
//  Copyright © 2016年 Uchida Atsushi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var fuelEfficientLabel: UILabel!
    @IBOutlet weak var gasPriceLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!

    override func loadView() {
        super.loadView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let aa = UnitFuelEfficiency.baseUnit()

        var fuelEfficent = Measurement(value: 5, unit: UnitFuelEfficiency.litersPer100Kilometers)
        let mpg = fuelEfficent.converted(to: UnitFuelEfficiency.milesPerGallon)
        fuelEfficientLabel.text = mpg.description

        let newUnit = UnitFuelEfficiency(symbol: "km/L", converter: KilometerPerLitterUnitConverter())
        let kl = fuelEfficent.converted(to: newUnit)
        fuelEfficientLabel.text = kl.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

class KilometerPerLitterUnitConverter: UnitConverter, NSCopying {
    override func baseUnitValue(fromValue value: Double) -> Double {
        return value * 1000
    }

    override func value(fromBaseUnitValue baseUnitValue: Double) -> Double {
        return baseUnitValue / 1000
    }

    func copy(with zone: NSZone? = nil) -> AnyObject {
        return KilometerPerLitterUnitConverter()
    }

}
