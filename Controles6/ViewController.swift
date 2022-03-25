//
//  ViewController.swift
//  Controles6
//
//  Created by nicholas holden on 3/24/22.
//

import UIKit

class ViewController: UIViewController {
    //Outlets
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var segmento: UISegmentedControl!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var pagecontrol: UIPageControl!
    @IBOutlet weak var boton: UIButton!
    //Datos
    let datos = ["Rojo","Verde","Amarillo","Azul","Negro"]

    override func viewDidLoad() {
        super.viewDidLoad()
        //Boton
        boton.setTitle("Clik Aqui", for: .normal)
        boton.backgroundColor = .blue
        boton.setTitleColor(.black, for: .normal)
        //PickerView
        picker.backgroundColor = .green
        picker.dataSource = self
        picker.delegate = self
        //PageControl
        pagecontrol.numberOfPages = datos.count
        pagecontrol.currentPageIndicatorTintColor = .red
        pagecontrol.pageIndicatorTintColor = .blue
        //SegmentControl
        segmento.removeAllSegments()
        for (index,value) in datos.enumerated(){
            segmento.insertSegment(withTitle: value, at: index, animated: true)
        }
        //slider
        slider.minimumTrackTintColor = .red
        slider.maximumTrackTintColor = .green
        slider.minimumValue = 0
        slider.maximumValue = Float(datos.count)
        slider.value = 0
        
        
    }
//Actions
    
    @IBAction func sliderclick(_ sender: Any) {
        print(slider.value)
        switch slider.value {
        case 0..<1:
            segmento.selectedSegmentIndex = 0
            picker.selectRow(0, inComponent: 0, animated: true)
        case 1..<2:
            segmento.selectedSegmentIndex = 1
            picker.selectRow(1, inComponent: 0, animated: true)
        case 2..<3:
            segmento.selectedSegmentIndex = 2
            picker.selectRow(2, inComponent: 0, animated: true)
        case 3..<4:
            segmento.selectedSegmentIndex = 3
            picker.selectRow(3, inComponent: 0, animated: true)
        default:
            segmento.selectedSegmentIndex = 4
            picker.selectRow(4, inComponent: 0, animated: true)
        }
    }
    @IBAction func segmentoClick(_ sender: Any) {
        picker.selectRow(segmento.selectedSegmentIndex, inComponent: 0, animated: true)
        pagecontrol.currentPage = segmento.selectedSegmentIndex
        let cadena = datos[segmento.selectedSegmentIndex]
        boton.setTitle(cadena, for: .normal)
        
    }
    @IBAction func pagecontrolClick(_ sender: Any) {
        picker.selectRow(pagecontrol.currentPage, inComponent: 0, animated: true)
        let cadena = datos[pagecontrol.currentPage]
        boton.setTitle(cadena, for: .normal)
        segmento.selectedSegmentIndex = pagecontrol.currentPage
    }
    @IBAction func botonClick(_ sender: Any) {
        if boton.backgroundColor == .blue {
            boton.backgroundColor = .red
        }else{
            boton.backgroundColor = .blue
        }
    }
    

}

extension ViewController: UIPickerViewDataSource,UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return datos.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return datos[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let cadena = datos[row]
        boton.setTitle(cadena, for: .normal)
        pagecontrol.currentPage = row
        segmento.selectedSegmentIndex = row
    }
    
}
