// Eletronico.ts
import { Produtos } from '../Interfaces/Produtos';

export class Eletronico implements Produtos {
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
        
        return this.preco
    }

    
    ligar(): void {
        console.log(`Ligando o ${this.nome}...`)
    }
}
