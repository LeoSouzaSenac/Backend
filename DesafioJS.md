# Jogo de Adivinhação Simples

## Descrição

Neste jogo, um número secreto entre 1 e 100 é gerado aleatoriamente. Seu objetivo é adivinhar qual é o número secreto. O jogo continuará pedindo para você tentar até que você adivinhe o número correto.

## Requisitos

- Node.js deve estar instalado em sua máquina.
- A biblioteca `readline-sync` deve estar instalada. Caso não esteja, você pode instalá-la com o comando `npm install readline-sync`.

## Instruções

1. **Crie um Arquivo**: Crie um arquivo chamado `game.js`.

2. **Instale a Biblioteca `readline-sync`**:
   Abra o terminal e execute:
   ```bash
   npm install readline-sync
   ```

3. **Execute o Jogo**:
   No terminal, navegue até o diretório onde o arquivo `simple_game.js` está localizado e execute:
   ```bash
   node game.js
   ```

4. **Jogue**:
   - O jogo pedirá para você adivinhar um número entre 1 e 100.
   - Você deve inserir seu palpite e pressionar Enter.
   - O jogo fornecerá dicas se o número secreto é maior ou menor que o seu palpite.
   - Continue tentando até acertar o número secreto.

## Exemplo de Execução

```
Bem-vindo ao Jogo de Adivinhação Simples!
Tente adivinhar o número secreto entre 1 e 100.
Digite seu palpite: 5
Tente um número maior.
Digite seu palpite: 7
Tente um número menor.
Digite seu palpite: 6
Parabéns! Você acertou o número secreto 6.
```

## Detalhes do Código

O código realiza as seguintes etapas:
1. Gera um número secreto aleatório entre 1 e 100.
2. Pede ao usuário para inserir palpites.
3. Fornece feedback sobre se o palpite deve ser maior ou menor.
4. Continua até que o número correto seja adivinhado.

### Código JavaScript

```javascript
const readlineSync = require('readline-sync');

// Função para gerar um número aleatório entre min e max (inclusive)
function getRandomNumber(min, max) {
    return Math.floor(Math.random() * [alguma coisa];
}


