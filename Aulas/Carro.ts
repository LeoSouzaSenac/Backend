//Se precisar adicionar validação, por exemplo, garantir que velocidade seja positiva, vamos ter que modificar várias partes do código. 

//Se já construirmos as classes desde o início usando getters e setters, mesmo que futuramente adicionemos uma lógica de validação, não vamos precisar alterar nenhum código que usa esta classe.

class Carro {
    private velocidade: number

    constructor(velocidade: number) {
        this.velocidade = velocidade
    }

    //Mostrar o valor de velocidade
    //getter - pegar / obter / mostrar
    getVelocidade():number{
        return this.velocidade
    }

    //Setar o valor de velocidade
    //setter  - setar  /  definir  / modificar
    setVelocidade(novaVelocidade:number):number | string{
        if (this.velocidade > 0){
           return this.velocidade = novaVelocidade
        } else {
            return "A velocidade não pode ser 0 ou negativa."
        }

    }

}



const carro = new Carro(100)
console.log(carro.getVelocidade())//100
carro.setVelocidade(150)
console.log(carro.getVelocidade())//150
