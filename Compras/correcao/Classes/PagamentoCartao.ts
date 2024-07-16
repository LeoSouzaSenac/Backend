import { MetodoDePagamento } from "../Interfaces/MetodoDePagamento";


export class PagamentoCartao implements MetodoDePagamento {
    pagar(valor: number): string {
        return `Pagamento de R$${valor.toFixed(2)} realizado com Cartão.`;
    }
}
