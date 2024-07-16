import { MetodoDePagamento } from "../Interfaces/MetodoDePagamento";


export class PagamentoPix implements MetodoDePagamento {
    pagar(valor: number): string {
        return `Pagamento de R$${valor.toFixed(2)} realizado com Pix.`;
    }
}