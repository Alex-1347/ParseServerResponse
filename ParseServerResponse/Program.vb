Imports System
Imports System.Security
Imports Renci.SshNet.SshClient
Imports MySqlConnector
Imports System.Text.RegularExpressions
Imports System.Xml.XPath

'https://github.com/sshnet/SSH.NET

Partial Module Program
    Sub Main(args As String())
        Dim Str1 As String = ""
        Dim Pass1 As String = ""
        Dim CN As MySqlConnection
        Dim SshClient As Renci.SshNet.SshClient
Start:
        Console.WriteLine()
        Console.WriteLine("Select function:")
        Console.WriteLine("1. Aes Encrypt string")
        Console.WriteLine("2. Aes Decrypt string")
        Console.WriteLine("3. Setup MySQL connection")
        Console.WriteLine("4. Remote server SSH shell")
        Console.WriteLine("5. Processing special function to parse KVM Virtual Machine information to remote database")
        Console.Write(">")
        Dim Func1 = Console.ReadLine()
        If Not IsNumeric(Func1) Then GoTo Start
        Select Case Func1
            Case 1
                Console.Write("Get string need to AES encript" & vbCrLf & ">")
                Str1 = Console.ReadLine()
                Console.Write("Get password string" & vbCrLf & ">")
                Pass1 = ReadPassword()
                Console.WriteLine(EncryptString(Str1, Pass1))
            Case 2
                Console.Write("Get string need to AES decript" & vbCrLf & ">")
                Str1 = Console.ReadLine()
                Console.Write("Get password string" & vbCrLf & ">")
                Pass1 = ReadPassword()
                Console.WriteLine(DecryptString(Str1, Pass1))
            Case 3
                Console.Write("Get password to encrypt MySQL connection" & vbCrLf & ">")
                Pass1 = ReadPassword()
                Dim EncryptedMySQLPass As String = ""
                Dim ConnectionStringPart As String() = My.Resources.ConnectionString.Split(";")
                For i As Integer = 0 To ConnectionStringPart.Length - 1
                    If ConnectionStringPart(i).StartsWith("password") Then
                        EncryptedMySQLPass = ConnectionStringPart(i).Replace("password=", "") 'password nned to last parm to avoid finishing char - ";"
                        Dim RealPass As String = DecryptString(EncryptedMySQLPass, Pass1)
                        ConnectionStringPart(i) = $"password={RealPass}"
                    End If
                Next
                Dim DecryptMySQLConnectionString = String.Join(";", ConnectionStringPart)
                CN = New MySqlConnection(DecryptMySQLConnectionString)
                Try
                    CN.Open()
                Catch ex As Exception
                    Console.WriteLine(ex.Message & vbCrLf & DecryptMySQLConnectionString)
                    GoTo Start
                End Try
            Case 4
                Dim Res1 As Tuple(Of Renci.SshNet.SshClient, String)
                Try
                    Res1 = SSHConnect()
                    SshClient = Res1.Item1
                    Pass1 = Res1.Item2
                Catch ex As Renci.SshNet.Common.SshAuthenticationException
                    Console.WriteLine(ex.Message & vbCrLf & My.Resources.SSHURL & vbCrLf & My.Resources.SSHLogin & vbCrLf & Pass1)
                    GoTo Start
                End Try
                If SshClient.IsConnected Then
                    While True
                        Console.Write("Get shell command" & vbCrLf & ">")
                        Str1 = Console.ReadLine()
                        Dim Out1 = SshClient.RunCommand(Str1)
                        Console.WriteLine(Out1.Result)
                    End While
                End If
            Case 5
                Dim Res1 As Tuple(Of Renci.SshNet.SshClient, String)
                Try
                    Res1 = SSHConnect()
                    SshClient = Res1.Item1
                    Pass1 = Res1.Item2
                Catch ex As Renci.SshNet.Common.SshAuthenticationException
                    Console.WriteLine(ex.Message & vbCrLf & My.Resources.SSHURL & vbCrLf & My.Resources.SSHLogin & vbCrLf & Pass1)
                    GoTo Start
                End Try
                Dim SshVirshList = SshClient.RunCommand("virsh list --all")
                Dim Out1 As List(Of String) = LineReader(SshVirshList.Result)
                Dim VmList As New List(Of Tuple(Of String, String, String))
                Out1.ForEach(Sub(x)
                                 If Not String.IsNullOrWhiteSpace(x) Then
                                     If Not x.StartsWith("---") Then
                                         Dim Arr1 = ReplaceWhitespace(x).Trim.Split(" ")
                                         If Arr1.Length = 3 Then
                                             If Arr1(0) <> "Id" Then
                                                 Dim OneVm = New Tuple(Of String, String, String)(Arr1(0).Trim, Arr1(1).Trim, Arr1(2).Trim)
                                                 VmList.Add(OneVm)
                                             End If
                                         End If
                                     End If
                                 End If
                             End Sub)
                Console.WriteLine(String.Join(vbCrLf, VmList))
                For Each One As Tuple(Of String, String, String) In VmList
                    Try
                        Dim XMLConfig = SshClient.RunCommand("virsh dumpxml " & One.Item2)
                        Dim XML As XDocument = XDocument.Parse(XMLConfig.Result)
                        Dim Uuid As String = XML.XPathSelectElement("domain/uuid").Value
                        Dim Vcpu As String = XML.XPathSelectElement("domain/vcpu").Value
                        Dim CpuSet As String
                        Try
                            CpuSet = XML.XPathSelectElement("domain/vcpu")?.Attribute("cpuset").Value
                        Catch ex As Exception
                            CpuSet = "NO"
                        End Try
                        Dim Memory As String = XML.XPathSelectElement("domain/memory").Value
                        Dim SpicePort As String = XML.XPathSelectElement("domain/devices/graphics").Attribute("port").Value
                        Dim MacAdr As String = XML.XPathSelectElement("domain/devices/interface/mac").Attribute("address").Value
                        Dim BidgeTargetNetworkName As String = XML.XPathSelectElement("domain/devices/interface/target").Attribute("dev").Value
                        Dim KvmVolumeName As String = XML.XPathSelectElement("domain/devices/disk/source").Attribute("dev").Value
                        Dim CMD1 As MySqlCommand = New MySqlCommand($"SELECT * FROM `cryptochestmax`.`VM` where Id={One.Item1};", CN)
                        Dim RDR1 As MySqlDataReader = CMD1.ExecuteReader
                        Dim CurVmListIndex As Integer = 0
                        If RDR1.Read Then
                            CurVmListIndex = CInt(RDR1("i"))
                        End If
                        RDR1.Close()
                        If CurVmListIndex = 0 Then
                            Console.WriteLine($"VM {One} is absent in database VM table")
                            Continue For
                        Else
                            Dim VMNetworkIndex As Integer = 0
                            Dim CMD2 As MySqlCommand = New MySqlCommand($"SELECT * FROM cryptochestmax.VMNetwork where Name='{BidgeTargetNetworkName}';", CN)
                            Dim RDR2 As MySqlDataReader = CMD2.ExecuteReader
                            If RDR2.Read Then
                                VMNetworkIndex = CInt(RDR2("i"))
                            End If
                            RDR2.Close()
                            If VMNetworkIndex = 0 Then
                                Console.WriteLine($"VmNetworkName {BidgeTargetNetworkName} is absent in database VMNetwork table")
                            End If
                            Dim KvmVolumeIndex As Integer = 0
                            Dim CMD3 As MySqlCommand = New MySqlCommand($"SELECT * FROM cryptochestmax.KvmVolume where Path='{KvmVolumeName}';", CN)
                            Dim RDR3 As MySqlDataReader = CMD3.ExecuteReader
                            If RDR3.Read Then
                                KvmVolumeIndex = CInt(RDR3("i"))
                            End If
                            RDR3.Close()
                            If KvmVolumeIndex = 0 Then
                                Console.WriteLine($"KvmVolumeName {KvmVolumeName} is absent in database KvmVolume table")
                            End If
                            Dim CMD4 As MySqlCommand = New MySqlCommand($"Update `cryptochestmax`.`VM` SET `ToKvmVolume` = '{KvmVolumeIndex}',`ToVmNetwork` = '{VMNetworkIndex}',`UUID` = '{Uuid}',`CpuSet` = '{CpuSet}',`Vcpu` = '{Vcpu}',`Memory` = '{Memory}',`SpicePort` = '{SpicePort}',`MacAdr` = '{MacAdr}',`LastUpdate` = Now() where i={CurVmListIndex};", CN)
                            CMD4.ExecuteNonQuery()
                            Console.WriteLine($"VM info {One} updated.")
                        End If
                    Catch ex As Exception
                        Console.WriteLine(ex.Message)
                        Continue For
                    End Try
                Next
        End Select
        GoTo Start
    End Sub

    Function ReplaceWhitespace(Str1 As String) As String
        Dim WhiteSpaceReg As Regex = New Regex("\s+")
        Return WhiteSpaceReg.Replace(Str1, " ")
    End Function

    Function LineReader(Str1 As String) As List(Of String)
        Dim Out1 As New System.IO.StringReader(Str1)
        Dim Line As New List(Of String)
        While Out1.Peek > -1
            Line.Add(Out1.ReadLine)
        End While
        Return Line
    End Function

    Function SSHConnect() As Tuple(Of Renci.SshNet.SshClient, String)
        Console.Write("Get password to encrypt SSH connection" & vbCrLf & ">")
        Dim Pass1 As String = ReadPassword()
        Dim RealPass As String = DecryptString(My.Resources.SSHPassword, Pass1)
        Dim SshClient As New Renci.SshNet.SshClient(My.Resources.SSHURL, My.Resources.SSHLogin, RealPass)
        AddHandler SshClient.HostKeyReceived, AddressOf SshClient_HostKeyReceived
        SshClient.Connect()
        Return New Tuple(Of Renci.SshNet.SshClient, String)(SshClient, RealPass)
    End Function

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

    Sub SshClient_HostKeyReceived(sender As Object, e As Renci.SshNet.Common.HostKeyEventArgs)
        Dim Sb As Text.StringBuilder = New System.Text.StringBuilder()
        For i As Integer = 0 To e.HostKey.Length - 1
            Sb.Append(e.HostKey(i).ToString("X2"))
        Next
        Console.WriteLine(vbCrLf & "Hostkey: " & Sb.ToString())
    End Sub

End Module
