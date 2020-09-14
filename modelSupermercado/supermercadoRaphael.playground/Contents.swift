import UIKit

// Declarando as três classes:

// Classe 1:
class Mercado {
    var nomeMercado: String
    var endereco: String
    var horarioAberto: String       // format: "hh:mm-hh:mm"
    var telefone: String
    var site: String
    var numeroFuncionarios: Int32
    
    init (nomeMercado: String, endereco: String, horarioAberto: String,
          telefone: String, site: String, numeroFuncionarios: Int32,
          hour: Int, minute: Int) {
        self.nomeMercado = nomeMercado
        self.endereco = endereco
        self.horarioAberto = horarioAberto
        self.telefone = telefone
        self.site = site
        self.numeroFuncionarios = numeroFuncionarios
    }
    
    // Método checa se está aberto ou fechado:
    func estaAberto(_ horaA: String, hour: Int) {
        let hourOpen = horaA.prefix(2)
        let hourClose = horaA.suffix(5).prefix(2)
        if (hour > Int(hourOpen)! && hour < Int(hourClose)!) {
            print ("Supermercado está aberto!")
        } else {
            print ("Supermercado está fechado!")
        }
    }
}

// Classe 2:
class Funcionario: Mercado {
    var nomeFuncionario: String
    var foneFuncionario: String
    var cpf: String
    var cargo: String
    var matricula: Int32
    var anosExperiencia: Double

    init(nomeMercado: String, endereco: String, horarioAberto: String,
         telefone: String, site: String, numeroFuncionarios: Int32,
         hour: Int, minute: Int,
         nomeFuncionario: String, foneFuncionario: String, cpf: String,
         cargo: String, matricula: Int32, anosExperiencia: Double){
        self.nomeFuncionario = nomeFuncionario
        self.foneFuncionario = foneFuncionario
        self.cpf = cpf
        self.cargo = cargo
        self.matricula = matricula
        self.anosExperiencia = anosExperiencia
        
        // Exemplo de herança (inheritance)
        super.init(nomeMercado: nomeMercado, endereco: endereco, horarioAberto: horarioAberto,
                   telefone: telefone, site: site, numeroFuncionarios: numeroFuncionarios,
                   hour: hour, minute: minute)
    }
}

// Classe 3:
class Produto {
    var nomeProduto: String
    var preco: Double
    var identificador: String
    var categoria: String
    var validade: String
    var emEstoque: Bool
    
    init(nomeProduto: String, preco:Double, categoria: String, identificador: String,
         validade: String, emEstoque: Bool) {
        self.nomeProduto = nomeProduto
        self.preco = preco
        self.categoria = categoria
        self.identificador = identificador
        self.validade = validade
        self.emEstoque = emEstoque
    }
    
    // 5 métodos simples com print
    func refrigerar() {
        print ("Refrigerando")
    }
    func checarVencimento() {
        print ("Vencimento checado!")
    }
    func vender() {
        print ("OK")
    }
    func repor() {
        print ("Reposto")
    }
    func destacar () {
        print ("Produto foi colocado no Corredor Principal.")
    }
}

// --------------
//

let date = Date()
let hours = Calendar.current.component(.hour, from: date)
let minutes = Calendar.current.component(.minute, from: date)
//print (type(of:hours), type(of:minutes))

let extra = Mercado(nomeMercado: "Extra", endereco: "Campolim", horarioAberto: "06:00-24:00",
                    telefone: "(15) 3234-9300", site: "extra.com.br", numeroFuncionarios: 967,
                    hour: hours, minute: minutes)
extra.estaAberto("06:00-24:00", hour: hours)

print ("-----")
let luan = Funcionario(nomeMercado: "Carrefour", endereco: "ZN", horarioAberto: "12:00-18:00",
                       telefone: "3221-0000", site: "carrefour.com.br", numeroFuncionarios: 1345,
                       hour: hours, minute: minutes, nomeFuncionario: "Luan da Silva",
                       foneFuncionario: "99821-0000", cpf: "000.302.201-90", cargo: "Gerente",
                       matricula: 90765356, anosExperiencia: 3.8)
print("\(luan.nomeFuncionario) trabalha no \(luan.nomeMercado) há \(luan.anosExperiencia) anos.")

print ("-----")
let shampoo = Produto(nomeProduto: "Shampoo Dove", preco: 13.45, categoria: "Higiene",
                      identificador: "HX938420002", validade: "25/12/20", emEstoque: true)
print("O produto \(shampoo.nomeProduto) custa R$ \(shampoo.preco) e vence em \(shampoo.validade).")
shampoo.destacar()
shampoo.checarVencimento()

