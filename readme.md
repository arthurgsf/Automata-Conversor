[![GitHub stars](https://img.shields.io/github/stars/arthurgsf/Automata-Conversor.svg)](https://github.com/arthurgsf/Automata-Conversor/stargazers)
# Automata Conversor

Uma ferramenta que converte [Autômatos Finitos Não Determinísticos - com movimentos vazios (AFe)](https://en.wikipedia.org/wiki/Nondeterministic_finite_automaton) para Autômatos Finitos Não Determinísticos simples.  
Feita em linguagem Lua.

## Utilizando
1. Na pasta principal, insira seus arquivos de entrada no formato do seguinte exemplo:
    abc _alfabeto
    q0q1q2 _conjunto de estados
    q7 _estado final
    q0 - a q0 , b q0 , c q0 , & q1 _transições de q0
    q1 - & q2 _transições de q1
    q2 - a q2 , b q2 , c q2 _transições de q2
Onde o símbolo "&" representa uma transição vazia.
A entrada sempre deve conter o estado q0, pois é considerado sempre como estado inicial.

2. Execute o programa com `lua main.lua`.

3. Insira o nome dos arquivos de entrada separados por espaço. Cada arquivo de entrada é um AFe e irá gerar um arquivo de saída que representa o seu AFN equivalente.

4. Verifique o arquivo de saída `nomedoinput-converted`, que está no mesmo formato do arquivo de entrada e é o resultado da coonversão AFe -> AFN.

## Autores

* **Arthur Guilherme** - [arthurgsf](https://github.com/arthurgsf)
* **Weverton Lucas** - [wevertor](https://github.com/wevertor)
