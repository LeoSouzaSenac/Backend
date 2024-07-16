import { Produtos } from '../Interfaces/Produtos';

export class Livro implements Produtos {
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
       
        return this.preco * 1.2
    }

    
    abrir(): void {
        console.log(`Abrindo o livro ${this.nome}...`)
    }
}
