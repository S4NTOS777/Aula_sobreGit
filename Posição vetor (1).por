programa {
  const inteiro QTD_NUMS=7
  funcao inicio() {
    real num[QTD_NUMS]
    real maior_num = 0
    inteiro pos 
    para (inteiro i=0; i<QTD_NUMS; i++){
      escreva ("Digite seu número : ")
      leia (num[i])
      se (num[i]>maior_num){
        maior_num= num[i]
        pos=i+1
      }
    }
        escreva("Seu maior número é: ",maior_num)
        escreva("\nA posição do seu maior número é no vetor ", pos)

        


 

  

    

    
 
    
  }
  }

