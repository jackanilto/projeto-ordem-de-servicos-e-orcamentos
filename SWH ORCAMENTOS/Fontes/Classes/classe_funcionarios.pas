unit classe_funcionarios;

interface

uses
  FireDAC.Comp.Client, FireDAC.DApt, System.SysUtils;

Type
  TFuncionarios = Class

  Private

    Fconexao        :TFDConnection;
    FId_funcionario :Integer;
    Fds_nome        :String;
    Fds_funcao      :String;
    Fnr_telefone    :String;
    Fqry_consulta   :TFDQuery;


  Public
    property  Conexao        :TFDConnection read Fconexao        write FConexao;
    property  Id_funcionario :Integer       read FId_funcionario write FId_funcionario;
    property  ds_nome        :String        read Fds_nome        write Fds_nome;
    property  ds_funcao      :String        read Fds_funcao      write Fds_funcao;
    property  nr_telefone    :String        read Fnr_telefone    write Fnr_telefone;
    property  qry_consulta   :TFDQuery      read Fqry_consulta   write Fqry_consulta;


    constructor Create ( Conexao : TFDConnection );
    Destructor Destroy; Override;

    function consultar ( Texto: String ): TFDQuery;
    function Inserir: String;
    function Alterar: String;
    procedure LerParametros ( QryParametros : TfdQuery  );

  End;

implementation

{ TFuncionarios }

{ TFuncionarios }

function TFuncionarios.Alterar: String;
var
  QryAlterar : TfdQuery;
begin
  //Função que atribui e realiza o sql de inserção na query da classe
  try
    //Criando, limpando o sql e atribuindo o novo sql a query
    QryAlterar := TFDQuery.Create(  nil );
    QryAlterar.Connection := Fconexao;

    QryAlterar.Close;
    QryAlterar.Sql.Clear;
    QryAlterar.Sql.Add('UPDATE FUNCIONARIOS SET ( ' +
                          'DS_NOME  = :DS_NOME,        ' +
                          'DS_FUNCAO  = :DS_FUNCAO,      ' +
                          'NR_TELEFONE  = :NR_TELEFONE     ' +
                          'WHERE ID_FUNCIONARIO = :P_CD_CODIGO');

    QryAlterar.ParamByName('P_CD_CODIGO').AsInteger := FId_funcionario;

    //Função que pega os valores das propriedades da classe e joga pra a query
    LerParametros (  QryAlterar  );

    //Executa o SQL
    QryAlterar.ExecSQL;

    Result := '';
    
    //Liberar a query da memória
    QryAlterar.Destroy;

  Except
    //No caso de Erros retornar esse erro para função
    on  e: EXCEPTION  do
      Result := e.Message;
  end;

end;

function TFuncionarios.consultar( Texto: String ): TFDQuery;
begin
  //Função que atribui e realiza o sql de consulta na query da classe
  try
    Fqry_consulta.Close;
    Fqry_consulta.Sql.Clear;
    Fqry_consulta.Sql.Add('SELECT ' +
                          'ID_FUNCIONARIO, ' +
                          'DS_NOME,        ' +
                          'DS_FUNCAO,      ' +
                          'NR_TELEFONE     ' +
                          'FROM FUNCIONARIOS ' +
                          'WHERE DS_NOME LIKE :TEXTO ' +
                          'ORDER BY DS_NOME ASC' );
    Fqry_consulta.ParamByName('TEXTO').AsString  :=  '%' + Texto + '%';
    Fqry_consulta.Open;
  finally

    Result  := Fqry_consulta;
  end;
end;

constructor TFuncionarios.Create( Conexao: TFDConnection  );
begin
  //Atribui o componente para a propriedade de conexao
  Fconexao := Conexao;

  //Cria e inicializa a query de consulta
  Fqry_consulta :=  TFDQuery.Create( nil );
  Fqry_consulta.Connection  := FConexao;
end;

destructor TFuncionarios.Destroy;
begin
  inherited;

  //Destroi a query de consulta;
  Fqry_consulta.Destroy;
end;

function TFuncionarios.Inserir: String;
var
  QryInserir : TfdQuery;
begin
  //Função que atribui e realiza o sql de inserção na query da classe
  try
    QryInserir := TFDQuery.Create(  nil );
    QryInserir.Connection := Fconexao;

    QryInserir.Close;
    QryInserir.Sql.Clear;
    QryInserir.Sql.Add('INSERT INTO FUNCIONARIOS ( ' +
                          'DS_NOME,        ' +
                          'DS_FUNCAO,      ' +
                          'NR_TELEFONE     ' +
                          ') VALUES (' +
                          ':DS_NOME,        ' +
                          ':DS_FUNCAO       ' +
                          ':NR_TELEFONE)    ');

    //Função que pega os valores das propriedades da classe e joga pra a query
    LerParametros (  QryInserir  );

    //Executa o SQL
    QryInserir.ExecSQL;

    Result := '';
    //Liberar a query da memória
    QryInserir.Destroy;

  Except
    //No caso de Erros retornar esse erro para função
    on  e: EXCEPTION  do
      Result := e.Message;
  end;

end;

procedure TFuncionarios.LerParametros( QryParametros: TfdQuery );
begin
    //Função que pega os valores das propriedades da classe e joga pra a query
    QryParametros.ParamByName('DS_NOME').AsString      := Fds_nome;
    QryParametros.ParamByName('DS_FUNCAO').AsString    := Fds_funcao;
    QryParametros.ParamByName('NR_TELEFONE').AsString  := Fnr_telefone;  
end;

end.
