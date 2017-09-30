//
//  ViewController.swift
//  practice
//
//  Created by Bryant on 2017/4/2.
//  Copyright © 2017年 Bryant. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate  {
    let _title = "aa"
    let subtitle = "cd"

    @IBOutlet weak var MapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(_title) { (ps, error) in
            guard let ps = ps else{
                print(error ?? "Unknow Error!")
                return
            }
            let place = ps.first
            let anotation = MKPointAnnotation()
            anotation.title = self.title
            anotation.subtitle = self.subtitle
            if let loc = place?.location{
                anotation.coordinate = loc.coordinate
                self.MapView.showAnnotations([anotation], animated: true)
                self.MapView.selectAnnotation(anotation, animated: true)
            }
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let id = "myId"
        var av = MapView.dequeueReusableAnnotationView(withIdentifier: id) as?MKPinAnnotationView
        if av == nil {
            av = MKPinAnnotationView(annotation: annotation, reuseIdentifier: id)
            av?.canShowCallout = true
        }
        let leftIcon = UIImageView()
        leftIcon.image = UIImage(named: "sdds")
        av?.leftCalloutAccessoryView = leftIcon
        return av
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

