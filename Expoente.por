programa {
  funcao inteiro base_expo (inteiro base, inteiro expoente){
      se (expoente==0){
        retorne 1
      }senao {
        retorne base  * base_expo (base, expoente -1)
      }


  }
  funcao inicio() {
    inteiro ba, ex

    escreva ("Digite a base:\n ")
    leia (ba)
    escreva ("Digite o expoente:\n ")
    leia (ex)
    escreva (base_expo(ba, ex))
     
    
  }
}
