unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons,
  StdCtrls, DbCtrls, ExtCtrls, ZConnection, ZDataset, db;

type

  { TForm1 }

  TForm1 = class(TForm)
    bbPrimeiro: TBitBtn;
    bbSair: TBitBtn;
    bbAnterior: TBitBtn;
    bbProximo: TBitBtn;
    bbUltimo: TBitBtn;
    bbNovo: TBitBtn;
    bbEditar: TBitBtn;
    bbCancelar: TBitBtn;
    bbSalvar: TBitBtn;
    bbExcluir: TBitBtn;
    dbeCodigo: TDBEdit;
    dbeDataC: TDBEdit;
    dbeNome: TDBEdit;
    dsDados: TDataSource;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ZConexao: TZConnection;
    ZQTabela: TZQuery;
    ZQTabelaCODIGO: TLongintField;
    ZQTabelaDATA_CAD: TDateField;
    ZQTabelaNOME: TStringField;
    procedure bbEditarClick(Sender: TObject);
    procedure bbExcluirClick(Sender: TObject);
    procedure bbNovoClick(Sender: TObject);
    procedure bbPrimeiroClick(Sender: TObject);
    procedure bbAnteriorClick(Sender: TObject);
    procedure bbProximoClick(Sender: TObject);
    procedure bbSairClick(Sender: TObject);
    procedure bbSalvarClick(Sender: TObject);
    procedure bbUltimoClick(Sender: TObject);
    procedure bbCancelarClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.bbPrimeiroClick(Sender: TObject);
begin
  ZQTabela.First;
end;

procedure TForm1.bbExcluirClick(Sender: TObject);
begin
  ZQTabela.Delete;
end;

procedure TForm1.bbEditarClick(Sender: TObject);
begin
  ZQTabela.Edit;
end;

procedure TForm1.bbNovoClick(Sender: TObject);
var
  cod:longint;
begin
  ZQTabela.Open;
  ZQTabela.Last;

   cod:=ZQTabela.FieldByName('CODIGO').AsInteger+1;
   ZQTabela.Append;
   ZQTabela.FieldByName('CODIGO').AsInteger:=cod;
   ZQTabela.FieldByName('DATA_CAD').Value:=Date;
   dbeNome.SetFocus;
end;

procedure TForm1.bbAnteriorClick(Sender: TObject);
begin
  ZQTabela.Prior;
end;

procedure TForm1.bbProximoClick(Sender: TObject);
begin
  ZQTabela.Next;
end;

procedure TForm1.bbSairClick(Sender: TObject);
begin
  ZQTabela.Close;
end;

procedure TForm1.bbSalvarClick(Sender: TObject);
begin
  if (dbeDataC.text='') then
  begin
    MessageDlg('Aviso', 'Preencha o campo Nome para prosseguir!' ,mtWarning, [mbOk],0);
    Exit;
    end else begin
      ZQTabela.Post;
      MessageDlg('Aviso', 'Cadastro salvo com sucesso!' ,mtInformation, [mbOK],0);
  end;
end;

procedure TForm1.bbUltimoClick(Sender: TObject);
begin
  ZQTabela.Last;
end;

procedure TForm1.bbCancelarClick(Sender: TObject);
begin
  ZQTabela.Cancel;
end;

end.

