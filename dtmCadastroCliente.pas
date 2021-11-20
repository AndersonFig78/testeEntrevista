unit dtmCadastroCliente;

interface

uses
  SysUtils, Classes, DB, DBClient;

type
  TdtmdlCadastroCliente = class(TDataModule)
    cdsCadastroCliente: TClientDataSet;
    dsCadastroCliente: TDataSource;
    cdsCadastroClienteBairro: TStringField;
    cdsCadastroClienteNome: TStringField;
    cdsCadastroClienteIdentidade: TStringField;
    cdsCadastroClienteCPF: TStringField;
    cdsCadastroClienteTelefone: TStringField;
    cdsCadastroClienteEmail: TStringField;
    cdsCadastroClienteCEP: TStringField;
    cdsCadastroClienteLogradouro: TStringField;
    cdsCadastroClienteNumero: TStringField;
    cdsCadastroClienteComplemento: TStringField;
    cdsCadastroClienteCidade: TStringField;
    cdsCadastroClienteEstado: TStringField;
    cdsCadastroClientePais: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmdlCadastroCliente: TdtmdlCadastroCliente;

implementation

{$R *.dfm}

{ TdtmdlCadastroCliente }

end.
