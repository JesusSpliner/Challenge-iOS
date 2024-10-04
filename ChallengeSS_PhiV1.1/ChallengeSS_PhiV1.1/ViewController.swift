//
//  ViewController.swift
//  ChallengeSS_PhiV1.1
//
//  Created by Guillermo Castañeda Mónico on 25/09/24.
//

import UIKit

class ViewController: UIViewController
{
    
    
// conectamos los objetos en la vista para modificar sus propiedades
    // imagenes
    @IBOutlet weak var imagenMascota: UIImageView!
    @IBOutlet weak var fondoPantalla: UIImageView! // para evitar que el fondo se desplace
    //botones
    @IBOutlet weak var botonAnimal: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        botonAnimal.setTitle("", for: .normal) //quitamos el texto del  boton
        imagenAnimal()
        
        // esto lo tuve que agregar porque al ejecutar la app en el iphone, el fondo se desplazaba:
        
        // Ajustar la imagen para que se escale adecuadamente
        fondoPantalla.contentMode = .scaleAspectFill
            
            // Asegurarse de que la vista cubra toda la pantalla
        fondoPantalla.frame = self.view.bounds
        // Do any additional setup after loading the view.
    }
// otros métodos/funciones de utilidad
    func imagenAnimal()
    {
        
        let eleccion = UserDefaults.standard.integer(forKey: "AElegido")
        switch eleccion
        {
            case 1:
                imagenMascota.image = UIImage(named: "tigre")
            case 2:
                imagenMascota.image = UIImage(named: "panda")
            case 3:
                imagenMascota.image = UIImage(named: "lobo")
            default:
            imagenMascota.image = UIImage(systemName: "plus.circle")
            imagenMascota.tintColor = UIColor.black
            imagenMascota.alpha = 0.7
        }
    }
//Acciones enlazadas a botones en la pantalla

    @IBAction func Interactuar(_ sender: UIButton)
    {
        let seleccion=UserDefaults.standard.bool(forKey: "Aseleccionado")
        if seleccion != true
        {
            performSegue(withIdentifier: "rutaAnimal", sender: self)
        }
        else
        {
            let alerta=UIAlertController(title: "alerta", message: "ya haz elegido un animal", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            self.present(alerta,animated: true ,completion: nil)
        }
    }
    
    
    @IBAction func botonAlimentar(_ sender: UIButton)
    {
        UserDefaults.standard.set(false,forKey:"Aseleccionado")
    }
    
    
    
    
}

