programa
{
	inteiro  linha, coluna, contAtqJ1= 0,contAtqJ2=0, cont
	real  atacadosJ1[20], atacadosJ2[20]
	logico tabuleiroJ1[4][3], tabuleiroJ2[4][3]
	cadeia op, j1, j2, vencedor= "Nenhum"
	
	
	funcao inicializarTabuleiros(){

		para (linha = 1; linha < 4; linha++){
		    para (coluna = 1; coluna < 3; coluna++){
		        tabuleiroJ1[linha][coluna] = falso
		        tabuleiroJ2[linha][coluna] = falso
		    }
		}

		para(linha = 0; linha<20; linha++){
			atacadosJ1[linha] = 0 
			atacadosJ2[linha] = 0
		}
	}

	funcao exibirTabuleiro(logico tabuleiro[][]){
	    escreva("\n      1     2\n\n")
	    para (linha = 1; linha < 4; linha++){
	    	 escreva(linha + "  |")
		    para (coluna = 1; coluna < 3; coluna++){
	            se (tabuleiro[linha] [coluna]){
	            	 escreva("  O  ")
	                escreva("|")
	            }	               
	            senao{
	                escreva("  ~  ")
	                escreva("|")
	            }
	           
	       }
	       escreva("\n    ------------\n\n")
	    }
	    escreva("\nO = Barco  ~ = Água ")
	    escreva("\n\n\nPressione qualquer tecla para continuar...")
	    leia(op)
	    limpa()
	}

	funcao inteiro verificarLinha(){
		leia(linha)
		enquanto(linha < 1 ou linha>3){
			 escreva("\n\nDigite um VALOR VÁLIDO! PARA LINHA! (1 a 3):")
			 leia(linha)
		}
		retorne linha
	}

	funcao inteiro verificarColuna(){
		leia(coluna)
		enquanto(coluna < 1 ou coluna
		>2){
			 escreva("\n\nDigite um VALOR VÁLIDO PARA COLUNA!(1 a 2):")
			 leia(coluna)
		}
		retorne coluna
	}


	funcao posicionarBarcos(cadeia jogador, logico tabuleiro[][]){
	   
	   para (cont = 1; cont < 3; cont++){
	   		 faca{
	   		 	
		        	escreva("\n" + jogador + ", posicione o ", cont, " o barco:\n")
			   	escreva("\n\nDigite a LINHA (1 a 3): ")
			   	linha = verificarLinha()
			   	escreva("\nDigite a COLUNA (1 a 2):")
			   	coluna = verificarColuna()
			   	
			   }enquanto(jaTemBarco(linha, coluna, tabuleiro))
		        
		        tabuleiro[linha][coluna] = verdadeiro
		        limpa()
	        }
	}

	funcao logico jaTemBarco(inteiro l, inteiro c, logico tabuleiro[][]){
		se(tabuleiro[l][c] == verdadeiro){
			escreva("\n\nJá existe um barco nessa posição! Digite a posição Novamente.")
			retorne verdadeiro
			
		}
		senao
			retorne falso
	}


	funcao realizarAtaque(cadeia jogador, logico tabuleiro[][]){
	   
	    escreva("\n\n " + jogador + ",  sua vez de atacar:\n")
	    escreva("\n\nDigite a LINHA (1 a 3): ")
	    linha = verificarLinha()
	    escreva("\nDigite a COLUNA (1 a 2):")
	    coluna = verificarColuna()
	    limpa()
	    se (tabuleiro[linha][coluna]){
	        escreva("BOOOOOOOM!!!! BARCO DESTRUIDO!!!!!")
	        tabuleiro[linha][coluna] = falso
	    }	        
	    senao
	        escreva("Errooooouu! Bomba na Ã¡gua!")

	}

	funcao guardarAtaquesJ1(inteiro l, inteiro c){
		real aux
		aux = l*100 + c
		aux = aux/100
		atacadosJ1[contAtqJ1] = aux
		contAtqJ1++
		
	}

	funcao guardarAtaquesJ2(inteiro l, inteiro c){
		real aux
		aux = l*100 + c
		aux = aux/100
		atacadosJ2[contAtqJ2] = aux
		contAtqJ2++
	}

	funcao exibirAtacados(real atacados[]){
	    escreva("\n\n\n")
	    para (linha = 0; linha < 12; linha++){
	    	se(atacados[linha] != 0)
		  escreva(atacados[linha] + "  |  ")
	    }
	    escreva("\n\n\n\nPressione qualquer tecla para continuar...")
	    leia(op)
	}


	funcao cadeia verificarVencedor(cadeia jogador, logico tabuleiro[][]){
	    inteiro barcosRestantes = 0

		 para (linha = 1; linha < 4; linha++){
		    para (coluna = 1; coluna < 3; coluna++){
	          se (tabuleiro[linha] [coluna])
	                barcosRestantes += 1
	           
	        }
		 }
	
	    se (barcosRestantes == 0) 
	        retorne jogador
	    senao 
	    	   retorne "Nenhum"
	}

	
	funcao inicio()
	{
		
		//Inicializando o ambos Tabuleiros com posicÃµes falso para indicar que nÃ£o hÃ¡ barco.
		 inicializarTabuleiros()

		//Incializando os Jogadores e as posicÃµes dos BArcos
		escreva("Digite o nome do Jogador 1: ")
		leia(j1)
		posicionarBarcos(j1, tabuleiroJ1)
		exibirTabuleiro(tabuleiroJ1)

		
		escreva("\nDigite o nome do Jogador 2: ")
		leia(j2)
		posicionarBarcos(j2, tabuleiroJ2)
		exibirTabuleiro(tabuleiroJ2)

	
		
		faca{
		    
		    escreva("\n\nTURNO DO JOAGADOR "+ j1 +" . \n\nPrecione qualquer tecla para continuar...")
	   	    leia(op)
	   	    limpa()
	    	    escreva("\n\nO tabuleiro do " +j1+ " no momento é:\n\n")
		    exibirTabuleiro(tabuleiroJ1)
		    escreva("\n\nAté o momento, " +j1+ " atacou as seguintes posições(linhaXcoluna, excluindo o zero):")
		    exibirAtacados(atacadosJ1)
		    realizarAtaque(j1,tabuleiroJ2)
		    guardarAtaquesJ1(linha,coluna)
		    vencedor= verificarVencedor(j1, tabuleiroJ2)
		    se ( vencedor != "Nenhum")
		    	pare

		
		    escreva("\n\nTURNO DO JOAGADOR "+ j2 +" .\n\n Precione qualquer tecla para continuar...")
	   	    leia(op)
		    limpa()
 		    escreva("\n\nO tabuleiro do " +j2+ " no momento é: \n\n")
		    exibirTabuleiro(tabuleiroJ2)
		    escreva("\n\nAté o momento, " +j2+ " atacou as seguintes posições(linhaXcoluna):")
		    exibirAtacados(atacadosJ2)
		    realizarAtaque(j2,tabuleiroJ1)
		    guardarAtaquesJ2(linha,coluna)
		    vencedor= verificarVencedor(j2, tabuleiroJ1)

		    
		}enquanto(vencedor == "Nenhum")

		limpa()
		escreva("O "+ vencedor +" VENCEU!!!!")

		escreva("\nObrigado por jogar!!!")
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1727; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */