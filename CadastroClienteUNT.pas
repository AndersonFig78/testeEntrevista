unit CadastroClienteUNT;

interface

uses
  SysUtils, Classes, StrUtils, Dialogs, DB, Math, Controls, DBClient;

type
  TCadastroCliente = class
  private
    class function estaAberto : Boolean;
  public
    class procedure Abrir;
    class procedure Fechar;
    class procedure Inserir;
    class procedure Gravar;
    class procedure Excluir;
    class procedure Cancelar;
    class function ExportarXML(lsLogin, lsSenha, lsSmtpHost, lsPortaSMTP, lsEmailDestinatario: string) : Boolean;
  end;

implementation

uses
  dtmCadastroCliente, BibliotecaUNT;

{ TCadastroCliente }

class procedure TCadastroCliente.Abrir;
begin
  Fechar;
  
  dtmdlCadastroCliente.cdsCadastroCliente.CreateDataSet;
  dtmdlCadastroCliente.cdsCadastroCliente.Open;
end;

class procedure TCadastroCliente.Gravar;
begin
  if estaAberto then
  begin
    with dtmdlCadastroCliente do
    begin
      if cdsCadastroCliente.State in [dsedit, dsinsert] then
      cdsCadastroCliente.Post;
    end;
  end;

end;

class procedure TCadastroCliente.Cancelar;
begin
  if estaAberto then
  begin
    with dtmdlCadastroCliente do
    begin
      if cdsCadastroCliente.State in [dsedit, dsinsert] then
      cdsCadastroCliente.Cancel;
    end;
  end;

end;

class function TCadastroCliente.estaAberto: Boolean;
begin
  if dtmdlCadastroCliente.cdsCadastroCliente.State in [dsedit, dsinsert, dsOpening, dsbrowse] then
    Result := true
  else
    Result := False;
end;

class procedure TCadastroCliente.Excluir;
begin
  if estaAberto then
  begin
    if MessageDlg('Você deseja realmente remover este registro?', mtInformation, [mbYes, mbNo], 0) = mrYes then
    begin
      dtmdlCadastroCliente.cdsCadastroCliente.Delete;
    end;
  end;
end;

class procedure TCadastroCliente.Fechar;
begin
  if estaAberto then
  begin
    Cancelar;
    dtmdlCadastroCliente.cdsCadastroCliente.EmptyDataSet;
    dtmdlCadastroCliente.cdsCadastroCliente.Close;
  end;
end;

class procedure TCadastroCliente.Inserir;
begin
  if estaAberto then
  begin
    Cancelar;
    with dtmdlCadastroCliente do
    begin
      cdsCadastroCliente.Append;
    end;
  end;
end;

class function TCadastroCliente.ExportarXML(lsLogin, lsSenha, lsSmtpHost, lsPortaSMTP, lsEmailDestinatario: string) : Boolean;
var
  lsCaminho : string;
  lsNomeArquivo : string;
  objBiblioteca : TBiblioteca;
  Stream : TMemoryStream;
begin
  Result := False;

  Stream := TMemoryStream.Create;

  if estaAberto then
  begin
    try
      lsNomeArquivo := 'Cds_CadastroCliente.xml';

      //lsCaminho := ExtractFilePath(ParamStr(0));
      //lsCaminho := lsCaminho + lsNomeArquivo;
      lsCaminho := '';
      with dtmdlCadastroCliente do
      begin
        //cdsCadastroCliente.SaveToFile(lsCaminho , dfXMLUTF8);
        cdsCadastroCliente.SaveToStream(Stream , dfXMLUTF8);
      end;

      //Caso seja para enviar o arquivo via e-mail.
      objBiblioteca := TBiblioteca.Create;
      objBiblioteca.Envia_EMail(
              lsLogin, 'sistema'
              , lsEmailDestinatario, 'base do cadastro de cliente'
              , '', ''
              , lsLogin, lsSenha, lsSmtpHost, lsPortaSMTP, lsNomeArquivo, lsCaminho, Stream);
      FreeAndNil(Stream);

      Result := True;
      ShowMessage('E-mail enviado com sucesso');
    except
      ShowMessage('Erro ao enviar E-mail.');
    end;

  end;
end;

end.
