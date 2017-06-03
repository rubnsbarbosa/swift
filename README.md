![swift_logo](https://cloud.githubusercontent.com/assets/17646546/26754296/6db4ef78-484e-11e7-81b3-f32a838140f7.png)

# Swift
  
É a nova linguagem de programação para iOS, OS X, Watch OS e tvOS. Foi criada por [Chris Lattner](https://en.wikipedia.org/wiki/Chris_Lattner) e apresentada em 2014 durante a WWDC. É uma linguagem **multiparadigma** e tem como influência linguagens como: Objective-C, Rust, Haskell entre outras.

# Hands on

![xcode](https://cloud.githubusercontent.com/assets/17646546/26754315/e82ecb7a-484e-11e7-89cc-2deeeb9e9318.png)  
  
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
> Sempre que o valor de uma variável não for ser alterado devemos declarar ela como constante com a palavra reservada *let*. Use variáveis somente para armazenar valores que precisam ser alterados.  
> **Prática:** Vamos criar a constante *nomeCurso* com o nome do seu curso.
  
```swift
let nomeCurso = "Engenharia da Computação"
```
  
> Você pode declarar múltiplas constantes ou múltiplas variáveis em uma única linha, separadas por vírgulas.  
```swift
let x = 1, y = 2, z = 3
```
  
  
## Anotação de tipos e Inferência de tipos
  
**Swift** é uma linguagem fortemente tipada e de verificação estática de tipos, por isso o tipo de uma variável não é alterado depois de sua atribuição inicial. Como pode ser observado nos exemplos acima, devido ao mecanismo de *inferência de tipos* não presicamos declarar explicitamente o tipo de cada variável que criamos.

> Na grande maioria das vezes o mecanismo de *inferência de tipos* é capaz de descobrir o tipo correto de uma variável.  
> **Prática:** Vamos declarar uma constante do tipo String explicitando seu tipo.
  
```swift
let meuGithub: String = "rubnsbarbosa"
```
  
> Podemos definir múltiplas variáveis com o mesmo tipo em uma única linha, separadas por vírgulas, com o único tipo de anotação.
  
```swift
var nomeCompleto, nomeCurso, nomeGit: String
```
