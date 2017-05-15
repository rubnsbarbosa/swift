# Swift
  
É a nova linguagem de programação para iOS, OS X, Watch OS e tvOS. Foi criada por [Chris Lattner](https://en.wikipedia.org/wiki/Chris_Lattner) e apresentada em 2014 durante a WWDC. É uma linguagem **multiparadigma** e tem como influência linguagens como: Objective-C, Rust, Haskell entre outras.
  
  
## Constantes e Variáveis
  
 A declaração de constantes e variáveis associam um nome a um valor. O valor da constante não pode ser alterado uma vez que foi atribuido um valor, enquanto que a variável pode ter um valor diferente no futuro.
  
### Variáveis
> **Prática:**
> Vamos declarar uma variável chamada *nomeCompleto* e associar seu nome a ela.
  
```swift
var nomeCompleto = "Rubens Santos Barbosa"
```
  
Como sabemos as variáveis podem ter seu valor alterado.
  
> **Prática:** Vamos agora alterar o valor da variável *nomeCompleto*.
```swift
nomeCompleto = "Rubens Barbosa"
```
  
### Constantes
  
 Para declarar uma constante basta usarmos a palavra reservada *let* ao invés de *var*. Lembrando que as constantes não podem ter seu valor alterado depois de sua primeira atribuição.
> Sempre que o valor de uma variável não for ser alterado devemos declarar ela como constante.
> **Prática:** Vamos criar a constante *nomeCurso* com o nome do seu curso.
  
```swift
let nomeCurso = "Engenharia da Computação"
```
