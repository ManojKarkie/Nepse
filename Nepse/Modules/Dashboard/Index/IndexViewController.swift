//
//  IndexViewController.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 1/25/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Charts

class IndexViewController: UIViewController, IndicatorInfoProvider {

    @IBOutlet weak var codeListField: UITextField!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var monthBtn: UIButton!
    @IBOutlet weak var month3Btn: UIButton!
    @IBOutlet weak var month6Btn: UIButton!
    @IBOutlet weak var month12Btn: UIButton!
    @IBOutlet weak var chartView: LineChartView!
    
    fileprivate let service = DashboardService()
    fileprivate var codeArray = [String]()
    fileprivate let codeListPicker = UIPickerView()
    fileprivate var indexData = IndexArray()
    fileprivate var currentDate = "1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchIndexList()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Index")
    }

    private func setup() {
        self.contentView.getBorder()
        self.monthBtn.setButton()
        self.month3Btn.setButton()
        self.month6Btn.setButton()
        self.month12Btn.setButton()
        self.codeListPicker.dataSource = self
        self.codeListPicker.delegate = self
        self.codeListField.inputView = codeListPicker
    }
    
    private func fetchIndexList() {
        service.fetchIndexList { (data) in
            if let array = data.indices {
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
                chartDataSet.drawFilledEnabled = true
                chartDataSet.cubicIntensity = 5
                chartView.drawGridBackgroundEnabled = false
        
                chartDataSet.valueTextColor = NSUIColor.white
                chartDataSet.drawCirclesEnabled = false
                chartDataSet.mode = .horizontalBezier
                let chartData = LineChartData(dataSet: chartDataSet)
                chartView.data = chartData
        }
    }
}

extension IndexViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.codeArray.count
    }
}

extension IndexViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.codeArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.codeListField.text = self.codeArray[row]
        fetchData()
    }
}

extension UIView {
    
    func getBorder() {
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
    }
}

extension UIButton {
    
    func setButton() {
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.init(hex: "#234E66").cgColor
        self.layer.borderWidth = 2
    }
    
    func unSelectBtn() {
        self.backgroundColor = UIColor.white
        self.setTitleColor(UIColor.init(hex: "#234E66"), for: .normal)
    }
    
    func selectBtn() {
        self.backgroundColor = UIColor.init(hex: "#234E66")
        self.setTitleColor(UIColor.white, for: .normal)
    }
}
