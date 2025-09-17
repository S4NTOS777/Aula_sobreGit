 /**Crie uma matriz 3x3 de números inteiros.

Preencha essa matriz com valores fornecidos pelo usuário.

Calcule a soma de todos os elementos da matriz.

Exiba a soma final. */

programa {
  const inteiro C=3, L=3
 
  funcao inicio() {
    inteiro num[C][L]
    inteiro soma=0
    para (inteiro i=0;i<L;i++){
      para (inteiro j=0;j<C; j++){
        escreva ("Digite a ",i+1, "ª coluna da ", j+1,"ª linha: ")
        leia (num[i][j])
        soma=soma+num[i][j]
      }
      escreva("\n")
    }
      escreva("A soma da matriz é ", soma)



    
  }
}
