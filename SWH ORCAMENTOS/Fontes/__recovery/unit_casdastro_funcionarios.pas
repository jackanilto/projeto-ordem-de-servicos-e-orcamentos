unit unit_casdastro_funcionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unit_cadastro_padrao, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask, unit_mensagem, unit_funcoes;

type
  Tform_cadastro_funcionarios = class(Tform_cadastro_padrao)
    pnl_nome: TPanel;
    edt_nome: TEdit;
    Label1: TLabel;
    pnl_funcao: TPanel;
    edt_funcao: TEdit;
    Label2: TLabel;
    pnl_telefone: TPanel;
    edt_telefone: TMaskEdit;
    Label3: TLabel;
    procedure edt_telefoneExit(Sender: TObject);
    procedure edt_telefoneEnter(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_cadastro_funcionarios: Tform_cadastro_funcionarios;

implementation

{$R *.dfm}

uses unit_consulta_funcionarios;


procedure Tform_cadastro_funcionarios.btn_salvarClick(Sender: TObject);
var
  Erro : String;
begin
  inherited;
  //Salva os Dados Digitados na Tabela de Funcionários

  //Jogando os Dados dos Edits Para as Propriedades da Classe
  form_consulta_funcionarios.Funcionarios.ds_nome     :=  edt_nome.text;
  form_consulta_funcionarios.Funcionarios.ds_funcao   :=  edt_funcao.text;
  form_consulta_funcionarios.Funcionarios.nr_telefone :=  edt_telefone.text;

  //Chamando a Operação de Acordo com o Parametro
  if  form_consulta_funcionarios.sTipoOperacao  = 'INSEIR' then
    Erro := form_consulta_funcionarios.Funcionarios.Inserir
  else if  form_consulta_funcionarios.sTipoOperacao  = 'ALTERAR' then
    Erro := form_consulta_funcionarios.Funcionarios.Alterar;

  //Verificando a Ocorrência de Erros
  if erro = '' then
     CriarMensagem( 'AVISO', 'Dados Inseridos/ Alterados com Sucesso!' )
  else
     CriarMensagem( 'ERRO', 'Ocorreu um, ERRO na Operação: ' + erro );
end;

procedure Tform_cadastro_funcionarios.edt_telefoneEnter(Sender: TObject);
begin
  inherited;
  //Limpa a mascara do Telefone
  edt_telefone.EditMask := '';

  //Seleciona todo conteudo do edit
  edt_telefone.SelectAll;
end;

procedure Tform_cadastro_funcionarios.edt_telefoneExit(Sender: TObject);
var
  nTelefone  : String;

begin
   //Procedure que faz a verificação do telefone

  //Remove os espaços e caracterer deixando somente os número do telefone
  nTelefone := Trim( RemoveCaracteres( edt_telefone.Text  ) );

  //Se o telefone for vazio entao sai fora do pocedimento
  if nTelefone = '' then
    Exit;

  //Verifica se o tamanho da string é 11 ou 10 digitos(celular ou fixo)
  if ( Length ( nTelefone ) < 10) or ( Length ( nTelefone ) > 11 ) then
  begin
    CriarMensagem ( 'ERRO', 'Número de Telefone Inválido!' );
    edt_telefone.SetFocus;
    Abort;
  end;

  //Atribuindo a mascara de acordo com tamanho da string
  if ( Length ( nTelefone ) = 10 ) then
    edt_telefone.EditMask :=  '\(99\) 9999\-9999'
  else if ( Length ( nTelefone ) = 11 ) then
    edt_telefone.EditMask :=  '\(99\) 9 9999\-9999';

end;

procedure Tform_cadastro_funcionarios.FormShow(Sender: TObject);
begin
  inherited;

//Se for alteração ele carregou o número do fone então preciso tratar a mascara
  if  form_consulta_funcionarios.sTipoOperacao  = 'ALTERAR' then
    edt_telefoneExit( Self );
end;

end.
