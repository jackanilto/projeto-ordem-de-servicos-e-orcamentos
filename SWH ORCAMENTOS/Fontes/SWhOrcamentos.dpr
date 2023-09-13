

program SWhOrcamentos;

uses
  Vcl.Forms,
  unit_login in 'unit_login.pas' {form_login},
  unit_principal in 'unit_principal.pas' {form_principal},
  unit_funcoes in 'unit_funcoes.pas',
  unit_conexao in 'unit_conexao.pas' {form_conexao: TDataModule},
  unit_consulta_padrao in 'unit_consulta_padrao.pas' {form_consulta_padrao},
  unit_mensagem in 'unit_mensagem.pas' {form_mensagem},
  unit_consulta_funcionarios in 'unit_consulta_funcionarios.pas' {form_consulta_funcionarios},
  classe_funcionarios in 'Classes\classe_funcionarios.pas',
  unit_cadastro_padrao in 'unit_cadastro_padrao.pas' {form_cadastro_padrao},
  unit_casdastro_funcionarios in 'unit_casdastro_funcionarios.pas' {form_cadastro_funcionarios};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  //Ativa a verifica��o de vazamento de memoria
  ReportMemoryLeaksOnShutdown  := True;

  //pega a versao do executavel e armazena na variavel global
  var_gbl_versao := GetVersaoArq;

  Application.CreateForm(Tform_conexao, form_conexao);

  if form_conexao.FDConnection.Connected  then
  begin

    //cria o form login
    form_login := Tform_login.Create( nil );
    form_login.ShowModal;

    //cria o form principal
    Application.CreateForm(Tform_principal, form_principal);

    //esconde o form login e limpa ele da memoria
    form_login.Hide;
    form_login.Free;

    Application.Run;
  end else
  begin
    CriarMensagem ( 'ERRO', 'N�O FOI POSSIVEL CONECTAR AO BANCO DE DADOS. VERIFIQUE!');
    Application.Terminate;
  end;

end.

