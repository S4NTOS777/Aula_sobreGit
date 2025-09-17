programa {
inclua biblioteca Util --> u
const inteiro MAX_DONOS = 5
inteiro total_donos = 0
cadeia usuario[MAX_DONOS][3]
inteiro energias[MAX_DONOS]
cadeia usuario_atual, pet_atual
logico logado = falso

//CADASTRO DO USUÁRIO
funcao cadastrar_donos() {
  se (total_donos >= MAX_DONOS) {
    escreva ("\n❌ LIMITE DE CADASTROS ATINGIDO!")
  } senao {
      limpa()
      escreva ("\n---------- Cadastro ----------\n")
      escreva ("Escolha o nome de usuario: ")
      leia (usuario[total_donos][0])
      escreva ("Digite o nome do seu pet: ")
      leia (usuario[total_donos][1])
      escreva ("Escreva sua senha para cadastro: ")
      leia (usuario[total_donos][2])
      energias[total_donos] = 50
      total_donos = total_donos + 1
      escreva ("\n✅ Usuário cadastrado com sucesso!\n")
      u.aguarde(1000) // Pausa para o usuário ler a mensagem
    }
}

//LOGIN 
funcao logico login() {
cadeia nome, senha

  para (inteiro tentativas = 1; tentativas <= 3; tentativas++) {
    limpa()
    escreva ("\n---------- LOGIN ----------\n")
    escreva ("\nDigite seu nome de usuario: ")
    leia (nome)
    escreva ("Digite sua senha: ")
    leia (senha)

// VERIFICACAO DO USUARIO
  para (inteiro i = 0; i < total_donos; i++) {
    se (usuario[i][0] == nome e usuario[i][2] == senha) {
      usuario_atual = usuario[i][0]
      pet_atual = usuario[i][1]
      logado = verdadeiro
      escreva ("\n✅ Login realizado com sucesso! Bem-vindo, ", usuario_atual, "!\n")
      retorne verdadeiro
    }
  }
    se (tentativas == 1) {
      escreva ("\n❌ Usuário ou senha incorretos. Seu pet está com fome, ele precisa de você!")
      escreva("\nTentativa ", tentativas, " de 3\n")
      u.aguarde(3000)
    } senao se (tentativas == 2) {
        escreva ("\n❌ Seu Pet está ficando fraco, faca o login necessario para alimenta-lo ")
        u.aguarde(3000)
    } senao {
        escreva ("\n❌ Suas tentativas acabaram... Você perdeu seu pet :(\n")
        u.aguarde(3000)
        retorne falso
    }
  }
}

funcao inteiro encontrarIndiceUsuario(cadeia nome) {
    para (inteiro i = 0; i < total_donos; i++) {
        se (usuario[i][0] == nome) {
            retorne i
        }
    }
    retorne -1
}

//ENERGIA DO PET
funcao inteiro gerenciaEnergia(inteiro qtdEnergia) {
inteiro indice = encontrarIndiceUsuario(usuario_atual)
inteiro segs = 30
    
    se (indice == -1){
      escreva ("❌ ERRO: Usuário não encontrado.\n") //localiza usuário para administrar as energias de cada pet
      retorne 0
    }
    se (energias[indice] <= 20){
      escreva ("❗Sua energia está baixa, durma ou se alimente para continuar jogando \n")
    } senao se (energias[indice] >= 100){
        escreva ("❗Nivel crítico, seu Pet esta muito cansado!\n")
      }

    energias[indice] = energias[indice] + qtdEnergia

//CASOS DE NÍVEIS EXTREMOS DE ENERGIA
    se (energias[indice] > 100){
        escreva ("\nVocê chegou ao limite de Energia\n")
        energias[indice] = 100
    }senao se (energias[indice] < 0){
        escreva ("\n❗Seu Pet está esgotado! Ele precisa de uma soneca.\n")
        para (inteiro i = 0; i > -0; i--) {
          limpa()
          escreva("\nZzz...")
          u.aguarde(3000)
        }
        energias[indice] = 30 // Valor de energia após uma soneca
    }
    retorne energias[indice]
}

//INTERAÇÃO COM O PET
funcao interagir() {
inteiro opcao
  faca {
    escreva ("\nOlá, me chamo ", pet_atual, ". Vamos fazer algo juntos, " + usuario_atual + "?\n")
    escreva ("\nEnergia atual: [", energias[encontrarIndiceUsuario(usuario_atual)], "/100]\n") //ENERGIA ATUAL DO USUÁRIO

// MENU INTERACAO
    escreva ("\n---------- MENU DE INTERAÇÃO ----------\n")
    escreva ("1. Alimentar (+10) 😋\n")
    escreva ("2. Beber água (+5) 💧\n")
    escreva ("3. Brincar (-20) 🤸\n")
    escreva ("4. Ouvir música e dançar (-20) 🎶\n")
    escreva ("5. Me leve para passear (-10) 🚶\n")
    escreva ("6. Tirar uma soneca (+20) 😴\n")
    escreva ("7. Retornar ao Menu Principal 🔙\n")
    escreva ("\n---------------------------------------\n")
    escreva ("\nEscolha uma opção: ")
    leia (opcao)

    limpa()
    escolha(opcao){
      caso 1:
        escreva ("\n", pet_atual, " adorou a comidinha\n")
        u.aguarde(2000)
        gerenciaEnergia(10)
        pare
      caso 2:
        escreva ("\n", pet_atual, " Muito obrigado pela água\n")
        u.aguarde(2000)
        gerenciaEnergia(5)
        pare
      caso 3:
        escreva ("\n", pet_atual, " gostou de brincar com você!\n")
        u.aguarde(2000)
        gerenciaEnergia(-20)
        pare
      caso 4:
        escreva ("\n", pet_atual, " amou seu gosto musical\n")
        u.aguarde(2000)
        gerenciaEnergia(-20)
        pare
      caso 5:
        escreva ("\n", pet_atual, " adorou ver os patinhos no lago durante o passeio \n")
        u.aguarde(2000)
        gerenciaEnergia(-10)
        pare
      caso 6:
        escreva ("\n", pet_atual, "está com sono. Hora de dormir...\n")
        para (inteiro i = 0; i > -0; i--) {
          limpa()
          escreva("\nZzz...")
          u.aguarde(3000)
        }
        gerenciaEnergia(20)
        pare
      caso 7:
        limpa()
        retorne
      caso contrario:
        escreva ("❌ Opção inválida, tente novamente")
    }
      u.aguarde(2000) // Pausa para o usuário ver a mensagem
    } enquanto (verdadeiro)
}

funcao inicio() {
    cadeia opcaoMenu
    faca {
      limpa()
      escreva ("\n========== BEM-VINDO AO TAMAGOTCHI ==========\n")
      escreva ("\n------------------ MENU PRINCIPAL ------------------")
      escreva ("\n1. Cadastrar novo usuário")
      escreva ("\n2. Fazer login")
      escreva ("\n3. Encerrar o programa\n")
      escreva ("----------------------------------------------------\n")
      escreva ("\nEscolha uma opção: ")
      leia (opcaoMenu)

      escolha (opcaoMenu){
        caso "1":
          cadastrar_donos()
          pare
        caso "2":
          se (login()) {
            interagir()
          }
          pare
        caso "3":
          escreva ("\nAté a próxima! 👋\n")
          pare
        caso contrario:
        escreva ("\n❌ Opção inválida. Por favor, digite 1, 2 ou 3.\n")
        u.aguarde(2000)
      }
    } enquanto (opcaoMenu != "3")
}
}
