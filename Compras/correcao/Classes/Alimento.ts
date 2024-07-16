import { Produtos } from "../Interfaces/Produtos"



export class Alimento implements Produtos {
    tipo: string
    preco: number
    nome: string
    peso: number

    constructor(tipo: string, preco: number, nome: string, peso: number) {
        this.tipo = tipo
        this.preco = preco
        this.nome = nome
        this.peso = peso
    }

    calcularValorTotal(): number {
        
        return this.preco * 1.1
    }

   
    cozinhar(): void {
        console.log(`Cozinhando o ${this.nome}...`)
    }
}
