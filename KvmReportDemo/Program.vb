Imports System
Imports MySqlConnector

Partial Module Program

    Dim CN As MySqlConnection
    Sub Main(args As String())
        If Not OpenMySQL(CN, DecryptMySQLConnectionString) Then Stop
        Dim Result As String = CreateServerReport(CN)
        Dim AdmKvmFileName As String = IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "KvmReport.json")
        IO.File.WriteAllText(AdmKvmFileName, Result)
        Process.Start("C:\Program Files\Mozilla Firefox\firefox.exe", AdmKvmFileName)

    End Sub




End Module
