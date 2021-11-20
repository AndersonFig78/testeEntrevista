program prjCadastroCliente;

uses
  Forms,
  CadastroClientesFRM in 'CadastroClientesFRM.pas' {CadastroClientes_FRM},
  dtmCadastroCliente in 'dtmCadastroCliente.pas' {dtmdlCadastroCliente: TDataModule},
  CadastroClienteUNT in 'CadastroClienteUNT.pas',
  BibliotecaUNT in 'BibliotecaUNT.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TCadastroClientes_FRM, CadastroClientes_FRM);
  Application.CreateForm(TdtmdlCadastroCliente, dtmdlCadastroCliente);
  Application.Run;
end.
