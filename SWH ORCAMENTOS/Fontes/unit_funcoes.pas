unit unit_funcoes;

interface

uses
  System.Types, Winapi.Windows, System.SysUtils, Vcl.Forms, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Graphics, Vcl.DBGrids, Vcl.Grids, Data.DB, Vcl.Controls, Vcl.Dialogs, Vcl.Mask;

  function RemoveCaracteres( AString: String): String;
  function SomenteNumeros( AString: String): String;
  function CriarMensagem ( Tipo, Mensagem : String ): Boolean;
  function GetVersaoArq: string;
  procedure prcValidarCamposObrigatorios( Form: Tform );

type
  TDBGridPadrao = class( TCustomGrid );

var
  var_gbl_versao :String;
  var_gbl_resposta_msg : boolean;

implementation

uses unit_mensagem;

function CriarMensagem ( Tipo, Mensagem : String ): Boolean;
begin

  //Atribui o valor inicial ao retorno da funcao
  Result := False;

  Try
    //Cria o form de mensagem
    form_mensagem  := Tform_mensagem.Create( nil );

    //Parametro para montar a mensagem corretamente
    form_mensagem.sTipoMsg := Tipo;
    form_mensagem.lbl_descricao.Caption := Mensagem;

    //Mostra o form
    form_mensagem.ShowModal;

    //Pega o retorno do usuario
    Result := var_gbl_resposta_msg;

    //Zera a resposta para proxima vez
    var_gbl_resposta_msg := False;
  Finally
    // Libera o form da memoria
    FreeAndNil( form_mensagem );
  End;
end;

//funcao que pega o valor da versao do executavel
function GetVersaoArq: string;

var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;

begin
  VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);

  with VerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionMS and $FFFF);
    Result := Result + '.' + IntToStr(dwFileVersionLS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionLS and $FFFF);
  end;

  FreeMem(VerInfo, VerInfoSize);

end;

// Fun��o Pra Validar Campos Obrigat�rios
procedure prcValidarCamposObrigatorios( Form: Tform );

var
  i : Integer;

begin

  for I := 0 to Form.ComponentCount - 1 do
  begin

    if Form.Components[i].Tag =  5 then
    begin
      //Testando o Tedit
      if Form.Components[i] is Tedit then
      begin

        if ( ( Form.Components[i] as Tedit ).Hint <> '' ) and
           ( ( Form.Components[i] as Tedit ).Text = ''  ) then
        begin
          CriarMensagem ( 'AVISO','O Campo ' + ( Form.Components[i] as Tedit ).Hint  +
                              ' � de preencimento obrigat�rio!');
          Abort;
        end;

      end;

    end;

  end;

end;

function RemoveCaracteres ( AString: String ): String;
var
  I : Integer;
  Limpos  : String;
begin

  Limpos  :=  '';

  //Percorra a String caracter por caracter
  for I := 1 to Length( AString ) do
  begin

  //Verifico se � um caracter especial
    if Pos( Copy( AString, I, 1 ), '"!%$#@&�*().,;:/<>[]{}=+-_\|') = 0 then
      Limpos  :=  Limpos  + Copy( AString, i, 1 );

  end;

  //Retorno para fun��o
  Result  :=  Limpos;
end;

function SomenteNumeros(AString: String): String;
var
  I : Integer;
  Limpos  : String;
begin

  Limpos  :=  '';

  //Percorra a String caracter por caracter
  for I := 1 to Length( AString ) do
  begin

  //Verifico se � um caracter especial
    if Pos( Copy( AString, I, 1 ), '0123456789') > 0 then
      Limpos  :=  Limpos  + Copy( AString, i, 1 );

  end;

  //Retorno para fun��o
  Result  :=  Limpos;
end;

end.
