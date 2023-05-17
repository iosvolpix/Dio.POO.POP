import UIKit

//Programação Orientada a Objetos

struct Contato {
    let nome: String
    let telefone: String
}

class AgendaTelefonica {
    var contatos: [Contato] = []
    
    func adicionarContato(_ contato: Contato) {
        contatos.append(contato)
    }
    func buscarContatoPorNome(_ nome: String)-> Contato? {
        for contato in contatos {
            if contato.nome == nome {
                return contato
            }
        }
        return nil
    }
    func imprimirContatos() {
        for contato in contatos {
            print("\(contato.nome): \(contato.telefone)")
        }
    }
}

enum TipoContato {
    case pessoal
    case profissional
}

class ContatoCriador {
    func criarContato(nome: String, telefone: String, tipo: TipoContato) -> Contato {
        let contato = Contato(nome: nome, telefone: telefone)
        
        switch tipo {
        case .pessoal:
            print("Criado contato pessoal: \(nome)")
        case .profissional:
            print("Criado contato profissional: \(nome)")
        }
        return contato
    }
}
let contatoCriador = ContatoCriador()
let agendaTelefonica = AgendaTelefonica()

let contato = contatoCriador.criarContato(nome: "Angor", telefone: "992345551", tipo: .pessoal)
let contato1 = contatoCriador.criarContato(nome: "Fabio", telefone: "987626111", tipo: .profissional)

agendaTelefonica.adicionarContato(contato)
agendaTelefonica.adicionarContato(contato1)


agendaTelefonica.imprimirContatos()


let nomeBusca = "Angor"

if let contatoEncontrado = agendaTelefonica.buscarContatoPorNome(nomeBusca) {
    print("Contato encontrado: \(contatoEncontrado.nome) - \(contatoEncontrado.telefone)")
} else {
    print("Contato não encontrado: \(nomeBusca)")
}

//Programação Orientada a Protocol

protocol Transporte {
    var velocidade: Int { get }
    func mover()
}


struct Carro: Transporte {
    var velocidade: Int = 0
    
    func mover() {
        print("O carro está se movendo a uma velocidade de \(velocidade) km/h.")
    }
}


struct Aviao: Transporte {
    var velocidade: Int = 0
    
    func mover() {
        print("O avião está voando a uma velocidade de \(velocidade) km/h.")
    }
}


func moverTransporte(_ transporte: Transporte) {
    transporte.mover()
}

let meuCarro = Carro(velocidade: 100)
let meuAviao = Aviao(velocidade: 500)


moverTransporte(meuCarro)
moverTransporte(meuAviao)
