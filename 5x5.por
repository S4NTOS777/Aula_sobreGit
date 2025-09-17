programa {
  const inteiro C=5, L=5
  funcao inicio() {
    inteiro num [C][L]
    inteiro pes
    inteiro qtd=0
    
  
    para (real i=0; i<C; i++){
      para (real j=0;j<L;j++){
        escreva ("Digite o ", i+1, "º número da ",j+1,"ª linha: ")
        leia (num[i][j])
      }
      escreva("\n")
     }
     escreva ("Escolha um número para ser encontrado: ")
     leia (pes)
       para (inteiro i=0; i<C; i++){
        para (inteiro j=0;j<L;j++){
          se (pes==num[i][j]){
            qtd++
          }
         }
        }
        escreva ("O número apareceu ",qtd, " vezes, nas posiçôes: ","\n")
        para (inteiro i=0; i<C; i++){
        para (inteiro j=0;j<L;j++){
          se (pes==num[i][j]){
            escreva ("[ ", i, " ] ", " [ ", j," ]", "\n")
          }
         }
        }

       
        
 
          




  }
}

     



    
