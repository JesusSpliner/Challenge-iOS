//
//  AnimalesVC.swift
//  ChallengeSS_PhiV1.1
//
//  Created by Guillermo Castañeda Mónico on 25/09/24.
//

import UIKit



class AnimalesVC: UIViewController
{
// enlazamos los 3 botones (como outlets)
    
    @IBOutlet weak var tigre: UIButton!
    
    @IBOutlet weak var panda: UIButton!
    
    @IBOutlet weak var lobo: UIButton!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
    }
    
    // enlazamos los  botones para ejecutar acciones al presionarlos
    
    @IBAction func ElegirTigre(_ sender: UIButton)
    {
        UserDefaults.standard.set(1, forKey: "AElegido")
        actualizarAnimal()
        eleccionHecha()
    }
    
    @IBAction func ElegirPanda(_ sender: UIButton)
    {
        UserDefaults.standard.set(2, forKey: "AElegido")
        actualizarAnimal()
        eleccionHecha()
    }
    
    @IBAction func ElegirLobo(_ sender: UIButton)
    {
        UserDefaults.standard.set(3, forKey: "AElegido")
        actualizarAnimal()
        eleccionHecha()
    }
    
    // funciones
    func actualizarAnimal()
    {
        if let navigationController = self.navigationController
        {
            if let targetViewController = navigationController.viewControllers.first(where: { $0 is ViewController }) as? ViewController
            {
                targetViewController.imagenAnimal()
                    navigationController.popToViewController(targetViewController, animated: true)
            }
        }
    }
    
    func eleccionHecha()
    {
        UserDefaults.standard.set(true,forKey:"Aseleccionado")
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
