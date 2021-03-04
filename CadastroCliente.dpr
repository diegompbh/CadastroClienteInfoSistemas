program CadastroCliente;

uses
  Vcl.Forms,
  untMain in 'untMain.pas' {frmMain},
  ReaderCepAPI in 'ReaderCepAPI.pas',
  EmailSender in 'EmailSender.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
