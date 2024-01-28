#INCLUDE 'protheus.ch'
#INCLUDE "TOTVS.CH"

 /*{Protheus.doc} M410STTS
    @type  Function
    @author wesley.franca
    @since 27/01/2024
    @version 1.0
    @param nOper, 
    @Description: PONTO DE ENTRADA PARA EXECUÇÃO APÓS OPERAÇÃO NO PEDIDO DE VENDA 

Parâmetros:
nOper --> Tipo: Numérico - Descrição: Operação que está sendo executada, sendo:

3 - Inclusão
4 - Alteração
5 - Exclusão
6 - Cópia
7 - Devolução de Compras

*/

User Function M410STTS()

	Local aArea := SC5->(GetArea())
	Local nOper := ParamIXB[1]

	If  (nOper == 5)
	
		CMsg := AllTrim(C5_ZZOBSE) + "Usuário da Exclusão do Pedido.: " + cValToChar(UsrRetName(__cUserID)) + " " ;
									  + cValToChar(Date()) + " " + cValToChar(Time() + Chr(13) + Chr(10))

				dbSelectArea('SC5')
				Reclock('SC5', .F.)
				Replace C5_ZZOBSE With cMsg
				SC5->(MsUnLock())
				DbCloseArea()

	EndIf

RestArea(aArea)

Return
