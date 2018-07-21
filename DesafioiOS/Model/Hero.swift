//
//  File.swift
//  DesafioiOS
//
//  Created by IFPB on 21/07/2018.
//  Copyright © 2018 IFPB. All rights reserved.
//

import Foundation

class Hero: NSObject, NSCoding {
    var nome: String!
    var imagem: String!
    var poder: Bool!
    var nota: Int!
    
    override var description: String{
        return ("Hero: \(self.nome!) ")
    }
    
    // construtor memória
    init(nome: String) {
        self.nome = nome
//        self.nota = nota
    }
    
    // construtor memória
    init(nome: String, nota: Int, poder:Bool) {
        self.nome = nome
        self.nota = nota
        self.poder = poder
    }
    
    // construtor memória
    init(nome: String, nota: Int, poder:Bool, imagem:String) {
        self.nome = nome
        self.nota = nota
        self.poder = poder
        self.imagem = imagem
    }
    
    // seta no arquivo
    required init?(coder aDecoder: NSCoder) {
        self.nome = aDecoder.decodeObject(forKey: "nome") as! String
//        self.nota = aDecoder.decodeObject(forKey: "nota") as! Int
//        self.poder = aDecoder.decodeObject(forKey: "poder") as! Bool
//        self.imagem = aDecoder.decodeObject(forKey: "imagem") as! String
    }
    
//    pega do arquivo
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.nome, forKey: "nome")
//        aCoder.encode(self.nota, forKey: "nota")
//        aCoder.encode(self.poder, forKey: "poder")
//        aCoder.encode(self.imagem, forKey: "imagem")
    }
}
