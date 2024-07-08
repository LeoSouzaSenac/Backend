// Definição da classe Guerreiro
class Guerreiro {
    nome: string;
    tipo: string;
    forca: number;
    saude: number;

    constructor(nome: string, tipo: string, forca: number) {
        this.nome = nome;
        this.tipo = tipo;
        this.forca = forca;
        this.saude = 100;
    }


    atacarMonstro(monstro: Monstro):void {
        console.log(`${this.nome} ataca ${monstro.nome}!`);
        monstro.receberDano(this.forca);
    }

    receberDano(dano: number):void {
        this.saude -= dano;
        console.log(`${this.nome} recebe ${dano} de dano.`);
        if (this.saude <= 0) {
            console.log(`${this.nome} foi derrotado!`);
        }
    }

    info():void {
        console.log(`O guerreiro ${this.nome} do tipo ${this.tipo} tem ${this.saude}.`)
    }
}


class Monstro {
    nome: string;
    forca: number;
    saude: number;

    constructor(nome: string) {
        this.nome = nome;
        this.forca = 50;
        this.saude = 10;
    }

   
    atacarGuerreiro(guerreiro: Guerreiro):void {
        console.log(`${this.nome} ataca ${guerreiro.nome}!`);
        guerreiro.receberDano(this.forca);
    }

 
    receberDano(dano: number):void {
        this.saude -= dano;
        console.log(`${this.nome} recebe ${dano} de dano.`);
        if (this.saude <= 0) {
            console.log(`${this.nome} foi derrotado!`);
        }
    }

    info():void {
        console.log(`O monstro ${this.nome} tem ${this.saude} de saude.`)
    }
}


let meuGuerreiro = new Guerreiro("Conan", "Bárbaro", 100);
let monstro = new Monstro("Dragão")


meuGuerreiro.atacarMonstro(monstro)
monstro.info()
