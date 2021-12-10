Imports MySqlConnector
Partial Module Program

    Dim DecryptMySQLConnectionString As String = ""

#Region "console"
    Function ReadPassword() As String
        Dim Pass1 As New Text.StringBuilder
        While (True)
            Dim OneKey As ConsoleKeyInfo = Console.ReadKey(True)
            Select Case OneKey.Key
                Case = ConsoleKey.Enter
                    Return Pass1.ToString
                Case ConsoleKey.Backspace
                    Pass1.Remove(Pass1.Length - 1, 1)
                    Console.Write(vbBack)
                Case Else
                    If Not Char.IsControl(OneKey.KeyChar) Then
                        Pass1.Append(OneKey.KeyChar)
                        Console.Write("*")
                    End If
            End Select
        End While
    End Function
#End Region

#Region "MySQL"
    Function OpenMySQL(ByRef CN As MySqlConnection, ByRef DecryptMySQLConnectionString As String) As Boolean
        If CN Is Nothing Then
Open:
            Dim DecryptMySQLConnectionString1 As String = DecryptSqlConnection()
            DecryptMySQLConnectionString = DecryptMySQLConnectionString1
            CN = New MySqlConnection(DecryptMySQLConnectionString1)
            Try
                CN.Open()
                If CN.State = Data.ConnectionState.Open Then
                    Return True
                Else
                    Return False
                End If
            Catch ex As Exception
                Console.WriteLine(ex.Message & vbCrLf & DecryptMySQLConnectionString1)
                Return False
            End Try
        Else
            If CN.State = Data.ConnectionState.Open Then
                Return True
            Else
                GoTo Open
            End If
        End If
    End Function

    Function ReOpenMySQL(ByRef CN As MySqlConnection) As Boolean
        If CN Is Nothing Then
Open:
            CN = New MySqlConnection(DecryptMySQLConnectionString)
            Try
                CN.Open()
                If CN.State = Data.ConnectionState.Open Then
                    Return True
                Else
                    Return False
                End If
            Catch ex As Exception
                Console.WriteLine(ex.Message & vbCrLf & DecryptMySQLConnectionString)
                Return False
            End Try
        Else
            If CN.State = Data.ConnectionState.Open Then
                Return True
            Else
                GoTo Open
            End If
        End If
    End Function

    Function DecryptSqlConnection() As String
        Dim TmpPass As String
        Console.Write("Get password to encrypt MySQL connection" & vbCrLf & ">")
        TmpPass = ReadPassword()
        Dim EncryptedMySQLPass As String = ""
        Dim ConnectionStringPart As String() = My.Resources.ConnectionString.Split(";")
        For i As Integer = 0 To ConnectionStringPart.Length - 1
            If ConnectionStringPart(i).StartsWith("password") Then
                EncryptedMySQLPass = ConnectionStringPart(i).Replace("password=", "") 'password nned to last parm to avoid finishing char - ";"
                Dim RealPass As String = DecryptString(EncryptedMySQLPass, TmpPass)
                ConnectionStringPart(i) = $"password={RealPass}"
            End If
        Next
        Return String.Join(";", ConnectionStringPart)
    End Function
#End Region


End Module
