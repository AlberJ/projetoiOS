//
//  FormViewController.swift
//  DesafioiOS
//
//  Created by IFPB on 21/07/2018.
//  Copyright © 2018 IFPB. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {
    
    @IBOutlet weak var tfNome: UITextField!
    @IBOutlet weak var tfNota: UILabel!
    @IBOutlet weak var stNota: UIStepper!
    @IBOutlet weak var stPoder: UISwitch!
    
    var index: Int!
    var cadastro: Cadastro!
    
    @IBAction func salvar(_ sender: Any) {
        let nome = self.tfNome.text!
//        let nota = Int(self.tfNota.text)
//        let poder = self.stPoder
        let hero = Hero(nome: nome)
        
//        print("\(nome!)-\(nota!)")
        
        if(self.index != nil){
            self.cadastro.update(index: self.index, hero: hero)
        }else{
            self.cadastro.add(hero: hero)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let delegate = UIApplication.shared.delegate as! AppDelegate
        self.cadastro = delegate.cadastro
    }

//    FALTA ADICIONAR AS DEMAIS VARIAVIES
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if(self.index != nil){
            let hero = self.cadastro.get(index: self.index)
            self.tfNome.text = hero.nome
        }
        
        self.tfNome.becomeFirstResponder()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
