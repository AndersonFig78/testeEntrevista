object dtmdlCadastroCliente: TdtmdlCadastroCliente
  OldCreateOrder = False
  Left = 969
  Top = 326
  Height = 150
  Width = 288
  object cdsCadastroCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 44
    Top = 12
    object cdsCadastroClienteNome: TStringField
      FieldName = 'Nome'
      Size = 150
    end
    object cdsCadastroClienteIdentidade: TStringField
      FieldName = 'Identidade'
    end
    object cdsCadastroClienteCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object cdsCadastroClienteTelefone: TStringField
      FieldName = 'Telefone'
      Size = 11
    end
    object cdsCadastroClienteEmail: TStringField
      FieldName = 'Email'
      Size = 150
    end
    object cdsCadastroClienteCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object cdsCadastroClienteLogradouro: TStringField
      FieldName = 'Logradouro'
      Size = 150
    end
    object cdsCadastroClienteNumero: TStringField
      FieldName = 'Numero'
      Size = 4
    end
    object cdsCadastroClienteComplemento: TStringField
      FieldName = 'Complemento'
      Size = 100
    end
    object cdsCadastroClienteBairro: TStringField
      FieldName = 'Bairro'
      Size = 100
    end
    object cdsCadastroClienteCidade: TStringField
      FieldName = 'Cidade'
      Size = 100
    end
    object cdsCadastroClienteEstado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object cdsCadastroClientePais: TStringField
      FieldName = 'Pais'
      Size = 50
    end
  end
  object dsCadastroCliente: TDataSource
    DataSet = cdsCadastroCliente
    Left = 44
    Top = 64
  end
end
