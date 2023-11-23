object dtmConexao: TdtmConexao
  Height = 480
  Width = 640
  object conexaoDB: TADOConnection
    ConnectionString = 
      'Provider=SQLNCLI11.1;Integrated Security=SSPI;Persist Security I' +
      'nfo=False;User ID="";Initial Catalog=TEx;Data Source=FABIOGARBAT' +
      'O\SQLEXPRESS;Initial File Name="";Server SPN="";'
    LoginPrompt = False
    Provider = 'SQLNCLI11.1'
    Left = 240
    Top = 144
  end
end
