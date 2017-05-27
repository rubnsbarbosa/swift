//
//  Pessoa.swift
//  firstApp
//
//  Created by Rubens Santos Barbosa on 22/05/17.
//  Copyright © 2017 Rubens Santos Barbosa. All rights reserved.
//

import UIKit

class Pessoa: NSObject {

    let nome: String
    let idade: Int
    let altura: Double
    
    init(nome: String, idade: Int, altura: Double) {
        self.nome = nome
        self.idade = idade
        self.altura = altura
    }
    
}
