//
//  Cadastro.swift
//  DesafioiOS
//
//  Created by IFPB on 21/07/2018.
//  Copyright © 2018 IFPB. All rights reserved.
//

import Foundation

class Cadastro: NSObject, NSCoding {
    
    var lista: Array<Hero>!
    
    override init() {
        self.lista = Array<Hero>()
    }
    
//    coloca no arquivo
    required init?(coder aDecoder: NSCoder) {
        self.lista = aDecoder.decodeObject(forKey: "lista") as! Array<Hero>
    }
    
//    pega do arquivo
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.lista, forKey: "lista")
    }
    
    func add(hero: Hero) {
        self.lista.append(hero)
    }
    
    func count() -> Int {
        print ("------------CADASTRO.COUNT()->INT")
        return self.lista.count
    }
    
    func get(index: Int) -> Hero {
        print ("------------CADASTRO.GET(INDEX)->HERO")
        return self.lista[index]
    }
    
    func del(index: Int) {
        self.lista.remove(at: index)
    }
    
    func swap(origem: Int, destino: Int) {
        let hero = self.lista[origem]
        self.lista[origem] = self.lista[destino]
        self.lista[destino] = hero
    }
    
    func update(index: Int, hero:Hero) {
        self.lista[index] = hero
    }
}
