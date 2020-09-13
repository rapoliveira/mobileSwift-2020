import UIKit

// Definir uma classe Veículo com cor, preço e quantidade de passageiros, depois
// defina as classes Carro que tem tamanho das rodas, e Avião que tem piloto e
// companhia aérea. Queremos descobrir a quantidade de combustível que cada um dos
// veículos gasta por viagem, defina um método que recebe como parâmetro a distancia
// em Km e calcule a quantidade de combustível.
// Carro: tamanho das rodas * quantidade de passageiros * distancia
// Avião quantidade de passageiros * distancia


class Veiculo {
    var cor: String
    var preco: Double
    var quantPassageiros: Int
    
    init(cor: String, preco: Double, quantPassageiros: Int) {
        self.cor = cor
        self.preco = preco
        self.quantPassageiros = quantPassageiros
    }
    
    func getQtdCombustivel(dist: Double) -> Double {
        return (Double(quantPassageiros) * dist)/1000   // mL para L
    }
    
}

class Carro: Veiculo {
    var tamanhoRodas: Int
    
    init(cor: String, preco: Double, quantPassageiros: Int, tamanhoRodas: Int) {
        self.tamanhoRodas = tamanhoRodas
        super.init(cor: cor, preco: preco, quantPassageiros: quantPassageiros)
        let printPreco = String(format: "%.2f", preco)
        print("- O carro \(cor) custa R$ \(printPreco), comporta \(quantPassageiros) " +
            "passageiros e tem rodas aro \(tamanhoRodas).")
    }
    
    // polimorfismo
    override func getQtdCombustivel(dist: Double) -> Double {
        let quant = super.getQtdCombustivel(dist: dist) * Double(tamanhoRodas)
        let autonomia: Double = dist/quant // em km/L
        print ("O carro \(cor) gasta \(String(format: "%.2f", quant)) L de combustível " +
            "para percorrer \(dist) km.")
        print ("Ele tem uma autonomia de \(String(format:"%.2f", autonomia)) km/L.\n")
        return quant
    }
    
}

class Aviao: Veiculo {
    var piloto: String
    var ciaAerea: String
    
    init(cor: String, preco: Double, quantPassageiros: Int, piloto: String, ciaAerea: String) {
        self.piloto = piloto
        self.ciaAerea = ciaAerea
        super.init(cor: cor, preco: preco, quantPassageiros: quantPassageiros)
        let printPreco = String(format: "%.2f", preco)
        print("- O avião da \(ciaAerea) custa R$ \(printPreco), comporta \(quantPassageiros)" +
            " passageiros e é pilotado pelo \(piloto).")
    }
    
    override func getQtdCombustivel(dist: Double) -> Double {
        let quant = super.getQtdCombustivel(dist: dist)
        let autonomia: Double = dist/quant
        print ("O avião \(cor) gasta \(String(format: "%.2f", quant)) L de combustível " +
            "para percorrer \(dist) km.")
        print ("Ele tem uma autonomia de \(String(format:"%.2f", autonomia)) km/L.\n")
        return quant
    }
}


// Declarando três carros diferentes e chamando o método:
let golAmarelo = Carro(cor: "Amarelo", preco: 29500.95, quantPassageiros: 5, tamanhoRodas: 14)
golAmarelo.getQtdCombustivel(dist: 50)

let dobloPrata = Carro(cor: "Prata", preco: 35000.66, quantPassageiros: 7, tamanhoRodas: 15)
dobloPrata.getQtdCombustivel(dist: 25)

let busaoAzul = Carro(cor: "Azul", preco: 80687.19, quantPassageiros: 30, tamanhoRodas: 30)
busaoAzul.getQtdCombustivel(dist: 100)

// Declarando um avião e chamando o método:
let boeing = Aviao(cor: "Branco", preco: 1e7, quantPassageiros: 500, piloto: "Cmdt Hamilton",
                   ciaAerea: "Delta")
boeing.getQtdCombustivel(dist: 1000)

