unit untMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.Bind.Components,
  Data.Bind.ObjectScope, Vcl.ExtCtrls, Vcl.Buttons, Datasnap.DBClient,
  Xml.xmldom, Xml.XmlTransform, Xml.XMLIntf, Xml.XMLDoc, Data.DB, Vcl.Grids,
  Vcl.DBGrids, System.UITypes, System.Math;

type
  TfrmMain = class(TForm)
    GroupBox1: TGroupBox;
    edtCep: TLabeledEdit;
    edtLogradouro: TLabeledEdit;
    edtNumero: TLabeledEdit;
    edtComplemento: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtEstado: TLabeledEdit;
    edtPais: TLabeledEdit;
    GroupBox2: TGroupBox;
    edtNome: TLabeledEdit;
    edtIdentidade: TLabeledEdit;
    edtCPF: TLabeledEdit;
    edtTelefone: TLabeledEdit;
    edtEmail: TLabeledEdit;
    btnAdicionar: TBitBtn;
    DBGrid: TDBGrid;
    DataSource: TDataSource;
    btnEnviarEmail: TBitBtn;
    cdsCliente: TClientDataSet;
    procedure edtCepExit(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnEnviarEmailClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cdsClienteAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    procedure GetDadosCEP;
    procedure ConfigurarCamposGrid;
    function EnviarEmail: Boolean;
    function SalvarDados: Boolean;
    function ValidarCampos: Boolean;
    function ValidarCPF(CPF: string): Boolean;
    function ValidarEMail(aStr: string): Boolean;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses ReaderCepAPI, EmailSender;

{$R *.dfm}

procedure TfrmMain.btnEnviarEmailClick(Sender: TObject);
begin
   if cdsCliente.IsEmpty then
   begin
      MessageDlg('Nenhum cliente cadastrado para envio de email', mtWarning, [mbOk], 0);
      Abort;
   end;

   if MessageDlg('Deseja enviar email para o cliente ' + cdsCliente.FieldByName('nome').AsString + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      try
         if EnviarEmail then
            MessageDlg('Email enviado com sucesso!', mtInformation, [mbOk], 0);
      except
         on e: Exception do
            MessageDlg(e.Message, mtError, [mbOk], 0);
      end;
   end;
end;

procedure TfrmMain.cdsClienteAfterOpen(DataSet: TDataSet);
begin
   ConfigurarCamposGrid;
end;

procedure TfrmMain.ConfigurarCamposGrid;
begin
   DBGrid.Fields[0].DisplayWidth := 30;
   DBGrid.Fields[4].DisplayWidth := 30;
   DBGrid.Fields[6].DisplayWidth := 30;
   DBGrid.Fields[9].DisplayWidth := 30;
   DBGrid.Fields[10].DisplayWidth := 30;
   DBGrid.Fields[12].DisplayWidth := 30;
end;

procedure TfrmMain.btnAdicionarClick(Sender: TObject);
begin
   if SalvarDados then
   begin
      MessageDlg('Cliente cadastrado com sucesso!', mtInformation, [mbOk], 0);

      try
         if EnviarEmail then
            MessageDlg('Email enviado com sucesso!', mtInformation, [mbOk], 0);
      except
         on e: Exception do
            MessageDlg(e.Message, mtError, [mbOk], 0);
      end;
   end;
end;

procedure TfrmMain.edtCepExit(Sender: TObject);
begin
   if edtCep.Text <> EmptyStr then
      GetDadosCEP;
end;

// Envia email para o registro selecionado no grid.
function TfrmMain.EnviarEmail: Boolean;
var
   emailSender: TEmailSender;
begin
   try
      emailSender := TEmailSender.Create(cdsCliente);
      if emailSender.EnviarEmail then
         Result := True
      else
         raise Exception.Create('Erro ao enviar email para o cliente' + cdsCliente.FieldByName('nome').AsString + '.');
   finally
      FreeAndNil(emailSender);
   end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
   cdsCliente.CreateDataSet;
   cdsCliente.Open;
end;

procedure TfrmMain.GetDadosCEP;
var
   readerCepAPI: TReaderCepAPI;
begin
   try
      readerCepAPI := TReaderCepAPI.Create('https://viacep.com.br/ws/');

      if readerCepAPI.ReadJSON(edtCep.Text) then
      begin
         edtCep.Text := readerCepAPI.GetCEP;
         edtLogradouro.Text := readerCepAPI.GetLogradouro;
         edtComplemento.Text := readerCepAPI.GetComplemento;
         edtBairro.Text := readerCepAPI.GetBairro;
         edtCidade.Text := readerCepAPI.GetLocalidade;
         edtEstado.Text := readerCepAPI.GetUF;
         edtPais.Text := readerCepAPI.GetPais;

         edtNumero.SetFocus;
      end;

      FreeAndNil(readerCepAPI);
   except
      on e: Exception do
         MessageDlg(e.Message, mtError, [mbOk], 0);
   end;
end;

function TfrmMain.SalvarDados: Boolean;
begin
   if not ValidarCampos then
      Abort;

   cdsCliente.Append;
   cdsCliente.FieldByName('nome').AsString := edtNome.Text;
   cdsCliente.FieldByName('identidade').AsString := edtIdentidade.Text;
   cdsCliente.FieldByName('cpf').AsString := edtCPF.Text;
   cdsCliente.FieldByName('telefone').AsString := edtTelefone.Text;
   cdsCliente.FieldByName('email').AsString := edtEmail.Text;
   cdsCliente.FieldByName('cep').AsString := edtCep.Text;
   cdsCliente.FieldByName('logradouro').AsString := edtLogradouro.Text;
   cdsCliente.FieldByName('numero').AsString := edtNumero.Text;
   cdsCliente.FieldByName('complemento').AsString := edtComplemento.Text;
   cdsCliente.FieldByName('bairro').AsString := edtBairro.Text;
   cdsCliente.FieldByName('cidade').AsString := edtCidade.Text;
   cdsCliente.FieldByName('estado').AsString := edtEstado.Text;
   cdsCliente.FieldByName('pais').AsString := edtPais.Text;
   cdsCliente.Post;

   Result := True;
end;

function TfrmMain.ValidarCampos: Boolean;
begin
   if Trim(edtNome.Text) = EmptyStr then
   begin
      MessageDlg('Nome inválido!', mtWarning, [mbOk], 0);
      Abort;
   end;

   if Trim(edtIdentidade.Text) = EmptyStr then
   begin
      MessageDlg('Identidade inválida!', mtWarning, [mbOk], 0);
      Abort;
   end;

   if not ValidarCPF(edtCPF.Text) then
   begin
      MessageDlg('CPF inválido!', mtWarning, [mbOk], 0);
      Abort;
   end;

   if Trim(edtTelefone.Text) = EmptyStr then
   begin
      MessageDlg('Telefone inválido!', mtWarning, [mbOk], 0);
      Abort;
   end;

   if not ValidarEMail(edtEmail.Text) then
   begin
      MessageDlg('Email inválido!', mtWarning, [mbOk], 0);
      Abort;
   end;

   if Trim(edtCep.Text) = EmptyStr then
   begin
      MessageDlg('CEP inválido!', mtWarning, [mbOk], 0);
      Abort;
   end;

   if Trim(edtLogradouro.Text) = EmptyStr then
   begin
      MessageDlg('Logradouro inválido!', mtWarning, [mbOk], 0);
      Abort;
   end;

   if Trim(edtNumero.Text) = EmptyStr then
   begin
      MessageDlg('Número inválido!', mtWarning, [mbOk], 0);
      Abort;
   end;

   if Trim(edtBairro.Text) = EmptyStr then
   begin
      MessageDlg('Bairro inválido!', mtWarning, [mbOk], 0);
      Abort;
   end;

   if Trim(edtCidade.Text) = EmptyStr then
   begin
      MessageDlg('Cidade inválida!', mtWarning, [mbOk], 0);
      Abort;
   end;

   if Trim(edtEstado.Text) = EmptyStr then
   begin
      MessageDlg('Estado inválido!', mtWarning, [mbOk], 0);
      Abort;
   end;

   if Trim(edtPais.Text) = EmptyStr then
   begin
      MessageDlg('País inválido!', mtWarning, [mbOk], 0);
      Abort;
   end;

   Result := True;
end;

// Método copiado da internet
function TfrmMain.ValidarCPF(CPF: string): Boolean;
var
  i: Integer;
  cpfSoNumero: String;
  cpfRepetido: Boolean;
  digito1, digito2: Integer;
begin
  result := False;
  // Limpa o que não for numero
  cpfSoNumero := '';
  for i := 1 To length(CPF) do
  begin
    Case char(CPF[i]) of
      '0' .. '9':
        cpfSoNumero := cpfSoNumero + CPF[i];
    End;
  end;

  // verifica se possui os 11 digitos
  if length(cpfSoNumero) <> 11 then
  begin
    exit;
  end;

  // testar se o cpf é repetido como 000.000.000-00
  cpfRepetido := True;
  for i := 2 to length(cpfSoNumero) do
  begin
    if cpfSoNumero[1] <> cpfSoNumero[i] then
    begin
      // se o cpf possui um digito diferente ele passou no teste
      cpfRepetido := False;
      break;
    end;
  end;
  // se o CPF é composto por numeros repetido retorna true
  if (cpfRepetido) then
  begin
    exit;
  end;

  // executa o calculo para o primeiro digito verificador
  digito1 := 0;
  for i := 1 to 9 do
  begin
    digito1 := digito1 + (StrToInt(cpfSoNumero[10 - i]) * (i + 1));
  end;
  { formula do primeiro verificador soma=1°*2+2°*3+3°*4.. até 9°*10 digito1 = 11 - soma mod 11 se digito > 10 digito1 = 0 }
  digito1 := ((11 - (digito1 mod 11)) mod 11) mod 10;
  // verifica se o 1° digito confere
  if inttostr(digito1) <> cpfSoNumero[10] then
  begin
    exit;
  end;

  // executa o calculo para o segundo digito verificador
  digito2 := 0;
  for i := 1 to 10 do
  begin
    digito2 := digito2 + (StrToInt(cpfSoNumero[11 - i]) * (i + 1));
  end;
  { formula do segundo verificador soma=1°*2+2°*3+3°*4.. até 10°*11 digito2 = 11 - soma mod 11 se digito > 10 digito2 = 0 }
  digito2 := ((11 - (digito2 mod 11)) mod 11) mod 10;
  // confere o 2° digito verificador
  if inttostr(digito2) <> cpfSoNumero[11] then
  begin
    exit;
  end;

  // se chegar até aqui o CPF é valido
  result := True;
end;

// Método copiado da internet
function TfrmMain.ValidarEMail(aStr: string): Boolean;
begin
   aStr := Trim(UpperCase(aStr));
   if Pos('@', aStr) > 1 then
   begin
      Delete(aStr, 1, pos('@', aStr));
      Result := (Length(aStr) > 0) and (Pos('.', aStr) > 2);
   end
   else
      Result := False;
end;

end.
