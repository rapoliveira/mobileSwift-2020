import UIKit

// ENUNCIADO:
// Um vendedor de loja que possui nome, idade, cpf e saldo em conta, vende em sua
// loja, ternos, vestidos e bonés. Definir um método vender(quantidadeDePecas: Int,
// tipoDePeca: String).
// - Cada terno custa 400 reais, caso o cliente compre 3 ou mais ternos, ele recebe
// 50 reais de desconto para cada terno;
// - Cada vestido custa 900 reais, caso o cliente compre 5 vestidos ele ganha um véu
// de noiva de brinde. O véu custa R$ 250,00.
// - Cada boné custa 50 reais, e para cada 2 bonés vendidos, o terceiro é grátis, logo
// não haverá lucro.

public class Produto {
    var nomeProduto: String
    var preco: Float
    
    init (nomeProduto: String, preco: Float) {
        self.nomeProduto = nomeProduto
        self.preco = preco
    }
    
    // metodo vender produto depende da classe
    func venderProduto(quantidade: Int) -> Float {
        return 0
    }
}

class Terno: Produto {
    // - Cada terno custa 400 reais, caso o cliente compre 3 ou mais ternos, ele recebe
    // 50 reais de desconto para cada terno;
    var desconto: Float
    var qtdMinimaDesconto: Int
    
    init(nomeProduto: String, preco: Float, desconto: Float, qtdMinimaDesconto: Int) {
        self.desconto = desconto
        self.qtdMinimaDesconto = qtdMinimaDesconto
        super.init(nomeProduto: nomeProduto, preco: preco)
    }
    
    override func venderProduto(quantidade: Int) -> Float {
        var valorVenda: Float = preco * Float(quantidade)
        
        if quantidade >= qtdMinimaDesconto {
            valorVenda -= Float(quantidade) * desconto
        }
        print ("Vendeu \(quantidade) ternos por R$ \(valorVenda)")
        return valorVenda
    }
}

class Vestido: Produto {
    // - Cada vestido custa 900 reais, caso o cliente compre 5 vestidos ele ganha um
    // véu de noiva de brinde. O véu custa R$ 250,00.
    var qtdMinimaDesconto: Int
    
    init(nomeProduto: String, preco: Float, qtdMinimaDesconto: Int) {
        //self.veuNoiva = veuNoiva
        self.qtdMinimaDesconto = qtdMinimaDesconto  // 5
        super.init(nomeProduto: nomeProduto, preco: preco)
    }
    
    override func venderProduto(quantidade: Int) -> Float {
        var valorVenda: Float = preco * Float(quantidade)
        
        if quantidade >= qtdMinimaDesconto {
            let brindeVeu = Int(quantidade/qtdMinimaDesconto)
            print ("Ganhou \(brindeVeu) véu(s) de R$250 (cada) grátis!")
            valorVenda -= Float(brindeVeu * 250)
            print ("Vendeu \(quantidade) vestidos por R$ \(valorVenda)")
        }
        
        return valorVenda
    }
    
}

class Bone: Produto {
    // - Cada boné custa 50 reais, e para cada 2 bonés vendidos, o terceiro é grátis, logo
    // não haverá lucro.
    var qtdMinimaDesconto: Int
    
    init (nomeProduto: String, preco: Float, qtdMinimaDesconto: Int) {
        self.qtdMinimaDesconto = qtdMinimaDesconto // 3
        super.init(nomeProduto: nomeProduto, preco: preco)
    }
    
    override func venderProduto(quantidade: Int) -> Float {
        var valorVenda: Float = preco * Float(quantidade)
        
        if quantidade >= qtdMinimaDesconto {
            let brindeBone = Int(quantidade/qtdMinimaDesconto)
            print ("Levou \(quantidade), pagou \(quantidade-brindeBone) bonés!")
            valorVenda -= Float(brindeBone) * preco
            print ("Vendeu \(quantidade) bonés por R$ \(valorVenda)")
        }
        
        return valorVenda
    }
}

class Vendedor {
    var nome: String
    var idade: Int
    var cpf: String
    var saldoEmConta: Float
    
    init(nome: String, idade: Int, cpf: String, saldoEmConta: Float) {
        self.nome = nome
        self.idade = idade
        self.cpf = cpf
        self.saldoEmConta = saldoEmConta
    }
    
    func vender(quantidadeDePecas: Int, tipoDePeca: String) -> Float {
        if (tipoDePeca.lowercased() == "terno") {
            let vendaTerno = Terno(nomeProduto: tipoDePeca, preco: 400, desconto: 50,
                                   qtdMinimaDesconto: 3)
            saldoEmConta += vendaTerno.venderProduto(quantidade: quantidadeDePecas)
        }
        
        if (tipoDePeca.lowercased() == "vestido") {
            let vendaVestido = Vestido(nomeProduto: tipoDePeca, preco: 900,
                                       qtdMinimaDesconto: 5)
            saldoEmConta += vendaVestido.venderProduto(quantidade: quantidadeDePecas)
        }
        
        if (tipoDePeca.lowercased() == "boné") {
            let vendaBone = Bone(nomeProduto: tipoDePeca, preco: 50,
                                 qtdMinimaDesconto: 3)
            saldoEmConta += vendaBone.venderProduto(quantidade: quantidadeDePecas)
        }
        
        print ("- Saldo atual: R$ \(saldoEmConta)\n")
        return saldoEmConta
    }
    
}

// Declarando três carros diferentes e chamando o método:
let adolfo = Vendedor(nome: "Adolfo", idade: 25, cpf: "111.222.333-44", saldoEmConta: 0.15)
print ("* Saldo inicial do vendedor \(adolfo.nome): R$ \(adolfo.saldoEmConta) *\n")
let venda1 = adolfo.vender(quantidadeDePecas: 10, tipoDePeca: "Terno")
let venda2 = adolfo.vender(quantidadeDePecas: 13, tipoDePeca: "Vestido")
let venda3 = adolfo.vender(quantidadeDePecas: 32, tipoDePeca: "Boné")
//print (adolfo.saldoEmConta)
