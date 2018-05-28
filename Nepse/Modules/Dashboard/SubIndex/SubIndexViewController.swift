//
//  SubIndexViewController.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 1/25/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Charts

class SubIndexViewController: UIViewController, IndicatorInfoProvider {

    @IBOutlet weak var chartView: LineChartView!
    @IBOutlet weak var codeListField: UITextField!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var monthBtn: UIButton!
    @IBOutlet weak var month3Btn: UIButton!
    @IBOutlet weak var month6Btn: UIButton!
    @IBOutlet weak var month12Btn: UIButton!
    
    fileprivate let service = DashboardService()
    fileprivate var codeArray = [String]()
    fileprivate let codeListPicker = UIPickerView()
    fileprivate var indexData = IndexArray()
    fileprivate var currentDate = "1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchSubIndexList()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Sub Index")
    }

    private func setup() {
//        self.contentView.getBorder()
        self.monthBtn.setButton()
        self.month3Btn.setButton()
        self.month6Btn.setButton()
        self.month12Btn.setButton()
        self.codeListPicker.dataSource = self
        self.codeListPicker.delegate = self
        self.codeListField.inputView = codeListPicker
    }
    
    private func fetchSubIndexList() {
        service.fetchIndexList { (data) in
            if let array = data.subIndices {
                self.codeArray = array
                self.codeListField.text = self.codeArray[0]
                self.fetchData()
            }
        }
    }
    
    fileprivate func fetchData() {
        service.fetchIndexGraph(date: currentDate, code: self.codeListField.text ?? "") { (data) in
            self.indexData = data
            self.drawChart()
        }
    }
    
    @IBAction func monthBtnAction(_ sender: UIButton) {
        switch sender {
        case monthBtn:
            currentDate = "1"
            sender.selectBtn()
            month3Btn.unSelectBtn()
            month6Btn.unSelectBtn()
            month12Btn.unSelectBtn()
            fetchData()
            break
        case month3Btn:
            currentDate = "3"
            sender.selectBtn()
            monthBtn.unSelectBtn()
            month6Btn.unSelectBtn()
            month12Btn.unSelectBtn()
            fetchData()
            break
        case month6Btn:
            currentDate = "6"
            sender.selectBtn()
            monthBtn.unSelectBtn()
            month3Btn.unSelectBtn()
            month12Btn.unSelectBtn()
            fetchData()
            break
        case month12Btn:
            currentDate = "12"
            sender.selectBtn()
            monthBtn.unSelectBtn()
            month3Btn.unSelectBtn()
            month6Btn.unSelectBtn()
            fetchData()
            break
        default:
            break
        }
    }
    
    
    func drawChart() {
        var chartEntries: [ChartDataEntry] = []
        if let data = indexData.data {
            for i:Int in 0 ..< data.count {
                let string = data[i].value ?? ""
                let chartData = ChartDataEntry(x: Double(i), y: Double(string) ?? 0)
                chartEntries.append(chartData)
            }
            let chartDataSet = LineChartDataSet(values: chartEntries, label: self.codeListField.text ?? "")
//            chartDataSet.drawFilledEnabled = true
            chartDataSet.cubicIntensity = 5
            chartView.drawGridBackgroundEnabled = false
            
            chartDataSet.valueTextColor = NSUIColor.white
            chartDataSet.mode = .horizontalBezier
            chartDataSet.setColor(NSUIColor.init(hex: "#FDBD2C"))
            chartDataSet.circleRadius = 3
            chartDataSet.circleHoleRadius = 0
            chartDataSet.setCircleColor(NSUIColor.init(hex: "#FDBD2C"))
            chartDataSet.drawCirclesEnabled = true
            let chartData = LineChartData(dataSet: chartDataSet)

            chartView.data = chartData
        }
    }
}

extension SubIndexViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.codeArray.count
    }
}

extension SubIndexViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.codeArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.codeListField.text = self.codeArray[row]
        fetchData()
    }
}
