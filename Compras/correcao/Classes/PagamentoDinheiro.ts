import { MetodoDePagamento } from "../Interfaces/MetodoDePagamento";


export class PagamentoDinheiro implements MetodoDePagamento {
    pagar(valor: number): string {
        return `Pagamento de R$${valor.toFixed(2)} realizado com Dinheiro.`;
    }
}
