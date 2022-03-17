B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=9.1
@EndOfDesignText@
Sub Class_Globals
	Private fx As JFX
	Private xui As XUI
	Private btnAcao, btn0 As Button
	Private lblComentarios As Label
	Private lblNumero1 As Label
	Private lblNumero2 As Label
	Private lblOperador As Label
	Private lblResultado As Label
	Private Numero1, Numero2 As Int
	Private btnAcao As Button
	Private pnlCalcu As Pane
	Private txtOperacao As String
	Dim p_painel As TabPane
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize(p_txtOperacao As String, Painel As TabPane)
	txtOperacao = p_txtOperacao
	p_painel = Painel
	
	If p_painel.IsInitialized Then
		p_painel.LoadLayout("Calcu", "Calculadora Boa Demais")
		p_painel.SelectedIndex = p_painel.Tabs.Size - 1
		p_painel.SelectedItem.Tag = p_txtOperacao
	End If
	
	NewProblem
	
End Sub

Private Sub NewProblem 'Gera um novo problema com números aleátorios
	lblOperador.Text = txtOperacao
	Numero1 = Rnd(1, 10)
	Numero2 = Rnd(1, 10)
	lblNumero1.Text = Numero1
	lblNumero2.Text = Numero2
	lblComentarios.Text = "Insira o Resultado" & CRLF & "Clique em OK"
	CSSUtils.SetBackgroundColor(lblComentarios, fx.Colors.RGB(255,235,128))
	lblResultado.Text = ""
End Sub

Private Sub CheckResultado  'Checa se o resultado está correto
	
	lblOperador.Text = txtOperacao
	
	If txtOperacao == "+" Then
		If  lblResultado.Text = Numero1 + Numero2 Then
			CSSUtils.SetBackgroundColor(lblComentarios, fx.Colors.RGB(128,255,128))
			lblComentarios.Text = "MUITO BOM" & CRLF & "Clique em Novo"
			btnAcao.Text = "Novo"
		Else
			CSSUtils.SetBackgroundColor(lblComentarios, fx.Colors.RGB(255,128,128))
			lblComentarios.Text = "ERRADO" & CRLF & "Insira um novo resultado" & CRLF & "E clique em OK"
		End If
	Else If txtOperacao == "-" Then
		If lblResultado.Text = Numero1 - Numero2 Then
			CSSUtils.SetBackgroundColor(lblComentarios, fx.Colors.RGB(128,255,128))
			lblComentarios.Text = "MUITO BOM" & CRLF & "Clique em Novo"
			btnAcao.Text = "Novo"
		Else
			CSSUtils.SetBackgroundColor(lblComentarios, fx.Colors.RGB(255,128,128))
			lblComentarios.Text = "ERRADO" & CRLF & "Insira um novo resultado" & CRLF & "E clique em OK"
		End If
	Else If txtOperacao == "*" Then
		If lblResultado.Text = Numero1 * Numero2 Then
			CSSUtils.SetBackgroundColor(lblComentarios, fx.Colors.RGB(128,255,128))
			lblComentarios.Text = "MUITO BOM" & CRLF & "Clique em Novo"
			btnAcao.Text = "Novo"
		Else
			CSSUtils.SetBackgroundColor(lblComentarios, fx.Colors.RGB(255,128,128))
			lblComentarios.Text = "ERRADO" & CRLF & "Insira um novo resultado" & CRLF & "E clique em OK"
		End If
	Else if txtOperacao == "/" Then
		If lblResultado.Text = Numero1 / Numero2 Then
			CSSUtils.SetBackgroundColor(lblComentarios, fx.Colors.RGB(128,255,128))
			lblComentarios.Text = "MUITO BOM" & CRLF & "Clique em Novo"
			btnAcao.Text = "Novo"
		Else
			CSSUtils.SetBackgroundColor(lblComentarios, fx.Colors.RGB(255,128,128))
			lblComentarios.Text = "ERRADO" & CRLF & "Insira um novo resultado" & CRLF & "E clique em OK"
		End If
	End If
End Sub

Private Sub btnAcao_Click  'Botão de ação
	If btnAcao.Text = "OK" Then
		If lblResultado.Text = "" Then
			lblComentarios.Text = "Nenhum resultado inserido" & CRLF & "Insira um Resultado" & CRLF & "E clique em OK"
		Else
			CheckResultado
		End If
	Else
		NewProblem
		btnAcao.Text = "OK"
	End If
End Sub

Private Sub btnEvent_MouseClicked (EventData As MouseEvent)
	Private btnSender As Button
	btnSender = Sender
	Select btnSender.Tag
		Case "BS"
			If lblResultado.Text.Length > 0 Then
				lblResultado.Text = lblResultado.Text.SubString2(0,lblResultado.Text.Length -1) ''Retira o ultimo numero se tamanho > 0
			End If
		Case Else
			lblResultado.Text = lblResultado.Text & btnSender.Text ''Incrementa no resultado o valor do botao
	End Select
End Sub