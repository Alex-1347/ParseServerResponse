Imports MySqlConnector

Partial Module Program
    Public Class AdmKvmBridge
        Property i As Integer
        Property toKvmNetwork As Nullable(Of Integer)
        Property toKvmVlanSwitch As Nullable(Of Integer)
        Property Name As String
        Property Id As String
        Property STP As String
        Property Ip As String
        Property Comment As String
        Property LastUpdate As DateTime
    End Class
    Public Class AdmKvmDevicePartition
        Property i As Integer
        Property ToKvmStorageDevice As Nullable(Of Integer)
        Property ToKvmLvmDevice As Nullable(Of Integer)
        Property Name As String
        Property Type As String
        Property UUID As String
        Property PartUUID As String
        Property PtType As String
        Property PartLabel As String
        Property BlockSize As String
        Property Size As String
        Property Start As Long
        Property [End] As Long
        Property Sectors As Long
        Property Comment As String
        Property LastUpdate As DateTime
    End Class
    Public Class AdmKvmHost
        Property i As Integer
        Property ServerName As String
        Property OsVersion As String
        Property KvmVersion As String
        Property UserName As String
        Property Password As String
        Property CpuModel As String
        Property CpuCount As Integer
        Property CpuSocket As Integer
        Property CorePerSocket As Integer
        Property ThreadPerSocket As Integer
        Property NumaCell As Integer
        Property MemorySize As Long
        Property MainServerIP As String
        Property Location As String
        Property Comment As String
        Property LastUpdate As DateTime
    End Class
    Public Class AdmKvmHostAccess
        Property i As Integer
        Property toKvmHost As Integer
        Property toUser As Integer
        Property FromIp As String
        Property Comment As String
        Property LastUpdate As DateTime
    End Class
    Public Class AdmKvmLVM
        Property i As Integer
        Property ToKvmStorage As Integer
        Property PartName As String
        Property LvmName As String
        Property Fmt As String
        Property Size As String
        Property Free As String
        Property Comment As String
        Property LastUpdate As DateTime
    End Class
    Public Class AdmKvmLVMmember
        Property i As Integer
        Property toKvmLVM As String
        Property DeviceName As String
        Property UUID As String
        Property Type As String
        Property BlockSize As String
        Property Comment As String
        Property LastUpdate As DateTime
    End Class
    Public Class AdmKvmNetworkInterface
        Property i As Integer
        Property toKvmHost As Integer
        Property Name As String
        Property Ip As String
        Property Gateway As String
        Property Netmask As String
        Property Broadcast As String
        Property Mac As String
        Property Comment As String
        Property LastUpdate As DateTime
    End Class
    Public Class AdmKvmPool
        Property i As Integer
        Property toStorageDevice As Integer
        Property Type As String
        Property Name As String
        Property State As Integer
        Property Autostart As Integer
        Property UUID As String
        Property Format As String
        Property Path As String
        Property Capacity As Long
        Property Allocation As Long
        Property Available As Long
        Property Comment As String
        Property LastUpdate As DateTime
    End Class
    Public Class AdmKvmStorageDevice
        Property i As Integer
        Property ToKvmHost As Integer
        Property Name As String
        Property DiskType As String
        Property DiskId As String
        Property Model As String
        Property Capacity As String
        Property SectorSize As String
        Property Bytes As Long
        Property Sectors As Long
        Property Comment As String
        Property LastUpdate As DateTime
    End Class
    Public Class AdmKvmPoolExtent
        Property i As Integer
        Property toKvmPool As Integer
        Property Start As Long
        Property [End] As Long
        Property Comment As String
        Property LastUpdate As DateTime
    End Class
    Public Class AdmKvmVlanSwitch
        Property i As Integer
        Property toKvmHost As Integer
        Property toNetworkInterface As Integer
        Property id As Integer
        Property VlanName As String
        Property VirtSwitch As String
        Property SwitchMac As String
        Property FromIp As String
        Property ToIp As String
        Property IpBroadcast As String
        Property IpNetmask As String
        Property IpGateway As String
        Property Comment As String
        Property LastUpdate As DateTime
    End Class
    Public Class AdmKvmVolume
        Property i As Integer
        Property toKvmPool As Nullable(Of Integer)
        Property toDevicePartition As Nullable(Of Integer)
        Property Name As String
        Property Path As String
        Property Type As String
        Property Capacity As String
        Property Allocation As String
        Property Comment As String
        Property LastUpdate As DateTime
    End Class
    Public Class AdmUser
        Property i As Integer
        Property Name As String
        Property Comment As String
        Property LastUpdate As DateTime
    End Class
    Public Class AdmVM
        Property i As Integer
        Property toKvmHost As Integer
        Property ToKvmVolume As Integer
        Property ToVmNetwork As Integer
        Property toUser As Integer
        Property UUID As String
        Property Id As String
        Property Name As String
        Property OsVersion As String
        Property State As String
        Property CpuSet As String
        Property Vcpu As String
        Property Memory As Integer
        Property SpicePort As Integer
        Property MacAdr As String
        Property AdminLogin As String
        Property AdminPassword As String
        Property Comment As String
        Property LastUpdate As DateTime
    End Class
    Public Class AdmVMNetwork
        Property i As Integer
        Property toKvmBridge As Integer
        Property Name As String
        Property Ip As String
        Property MAC As String
        Property Comment As String
        Property LastUpdate As DateTime
    End Class

    Function ReadAdmKvmBridgeList(ByRef CN As MySqlConnection) As List(Of AdmKvmBridge)
        Dim AdmKvmBridgetList As New List(Of AdmKvmBridge)
        Dim CMD1 As MySqlCommand
        Try
            CMD1 = New MySqlCommand($"select * from `cryptochestmax`.`KvmBridge`;", CN)
            Dim RDR1 As MySqlDataReader = CMD1.ExecuteReader
            While RDR1.Read
                AdmKvmBridgetList.Add(New AdmKvmBridge With {
                            .i = CInt(RDR1("i")),
                            .toKvmNetwork = If(IsDBNull(RDR1("toKvmNetwork")), Nothing, RDR1("toKvmNetwork")),
                            .toKvmVlanSwitch = If(IsDBNull(RDR1("toKvmVlanSwitch")), Nothing, RDR1("toKvmVlanSwitch")),
                            .Name = RDR1("Name"),
                            .Id = RDR1("Id"),
                            .STP = RDR1("STP"),
                            .Ip = RDR1("Ip"),
                            .Comment = If(IsDBNull(RDR1("Comment")), "", RDR1("Comment")),
                            .LastUpdate = CDate(RDR1("LastUpdate"))
                                      })
            End While
            RDR1.Close()
        Catch ex As Exception
            Console.WriteLine(ex.Message & CMD1.CommandText)
            CN.Close()
            ReOpenMySQL(CN)
        End Try
        Return AdmKvmBridgetList
    End Function
    Function ReadAdmKvmDevicePartitionList(ByRef CN As MySqlConnection) As List(Of AdmKvmDevicePartition)
        Dim AdmKvmDevicePartitionList As New List(Of AdmKvmDevicePartition)
        Dim CMD1 As MySqlCommand
        Try
            CMD1 = New MySqlCommand($"select * from `cryptochestmax`.`KvmDevicePartition`;", CN)
            Dim RDR1 As MySqlDataReader = CMD1.ExecuteReader
            While RDR1.Read
                AdmKvmDevicePartitionList.Add(New AdmKvmDevicePartition With {
                            .i = CInt(RDR1("i")),
                            .ToKvmStorageDevice = If(IsDBNull(RDR1("ToKvmStorageDevice")), Nothing, RDR1("ToKvmStorageDevice")),
                            .ToKvmLvmDevice = If(IsDBNull(RDR1("ToKvmLvmDevice")), Nothing, RDR1("ToKvmLvmDevice")),
                            .Name = RDR1("Name"),
                            .Type = RDR1("Type"),
                            .UUID = RDR1("UUID"),
                            .PartUUID = RDR1("PartUUID"),
                            .PtType = If(IsDBNull(RDR1("PtType")), Nothing, RDR1("PtType")),
                            .PartLabel = If(IsDBNull(RDR1("PartLabel")), Nothing, RDR1("PartLabel")),
                            .BlockSize = If(IsDBNull(RDR1("BlockSize")), Nothing, RDR1("BlockSize")),
                            .Size = RDR1("Size"),
                            .Start = RDR1("Start"),
                            .[End] = RDR1("End"),
                            .Sectors = RDR1("Sectors"),
                            .Comment = If(IsDBNull(RDR1("Comment")), "", RDR1("Comment")),
                            .LastUpdate = CDate(RDR1("LastUpdate"))
                                      })
            End While
            RDR1.Close()
        Catch ex As Exception
            Console.WriteLine(ex.Message & CMD1.CommandText)
            CN.Close()
            ReOpenMySQL(CN)
        End Try
        Return AdmKvmDevicePartitionList
    End Function
    Function ReadAdmKvmHostList(ByRef CN As MySqlConnection) As List(Of AdmKvmHost)
        Dim AdmKvmHostList As New List(Of AdmKvmHost)
        Dim CMD1 As MySqlCommand
        Try
            CMD1 = New MySqlCommand($"select * from `cryptochestmax`.`KvmHost`;", CN)
            Dim RDR1 As MySqlDataReader = CMD1.ExecuteReader
            While RDR1.Read
                AdmKvmHostList.Add(New AdmKvmHost With {
                            .i = CInt(RDR1("i")),
                            .ServerName = RDR1("ServerName"),
                            .OsVersion = RDR1("OsVersion"),
                            .KvmVersion = RDR1("KvmVersion"),
                            .UserName = RDR1("UserName"),
                            .Password = Text.UTF8Encoding.UTF8.GetString(RDR1("Password")),
                            .CpuModel = RDR1("CpuModel"),
                            .CpuCount = RDR1("CpuCount"),
                            .CpuSocket = RDR1("CpuSocket"),
                            .CorePerSocket = RDR1("CorePerSocket"),
                            .ThreadPerSocket = RDR1("ThreadPerSocket"),
                            .NumaCell = RDR1("NumaCell"),
                            .MemorySize = RDR1("MemorySize"),
                            .MainServerIP = RDR1("MainServerIP"),
                            .Location = RDR1("Location"),
                            .Comment = If(IsDBNull(RDR1("Comment")), "", RDR1("Comment")),
                            .LastUpdate = CDate(RDR1("LastUpdate"))
                                      })
            End While
            RDR1.Close()
        Catch ex As Exception
            Console.WriteLine(ex.Message & CMD1.CommandText)
            CN.Close()
            ReOpenMySQL(CN)
        End Try
        Return AdmKvmHostList
    End Function
    Function ReadAdmKvmHostAccessList(ByRef CN As MySqlConnection) As List(Of AdmKvmHostAccess)
        Dim AdmKvmHostAccessList As New List(Of AdmKvmHostAccess)
        Dim CMD1 As MySqlCommand
        Try
            CMD1 = New MySqlCommand($"select * from `cryptochestmax`.`KvmHostAccess`;", CN)
            Dim RDR1 As MySqlDataReader = CMD1.ExecuteReader
            While RDR1.Read
                AdmKvmHostAccessList.Add(New AdmKvmHostAccess With {
                            .i = CInt(RDR1("i")),
                            .toKvmHost = RDR1("toKvmHost"),
                            .toUser = RDR1("toUser"),
                            .FromIp = RDR1("FromIp"),
                            .Comment = If(IsDBNull(RDR1("Comment")), "", RDR1("Comment")),
                            .LastUpdate = CDate(RDR1("LastUpdate"))
                                      })
            End While
            RDR1.Close()
        Catch ex As Exception
            Console.WriteLine(ex.Message & CMD1.CommandText)
            CN.Close()
            ReOpenMySQL(CN)
        End Try
        Return AdmKvmHostAccessList
    End Function
    Function ReadAdmKvmLVMList(ByRef CN As MySqlConnection) As List(Of AdmKvmLVM)
        Dim AdmKvmLVMList As New List(Of AdmKvmLVM)
        Dim CMD1 As MySqlCommand
        Try
            CMD1 = New MySqlCommand($"select * from `cryptochestmax`.`KvmLVM`;", CN)
            Dim RDR1 As MySqlDataReader = CMD1.ExecuteReader
            While RDR1.Read
                AdmKvmLVMList.Add(New AdmKvmLVM With {
                            .i = CInt(RDR1("i")),
                            .ToKvmStorage = RDR1("ToKvmStorage"),
                            .PartName = RDR1("PartName"),
                            .LvmName = RDR1("LvmName"),
                            .Fmt = RDR1("Fmt"),
                            .Size = RDR1("Size"),
                            .Free = RDR1("Free"),
                            .Comment = If(IsDBNull(RDR1("Comment")), "", RDR1("Comment")),
                            .LastUpdate = CDate(RDR1("LastUpdate"))
                                      })
            End While
            RDR1.Close()
        Catch ex As Exception
            Console.WriteLine(ex.Message & CMD1.CommandText)
            CN.Close()
            ReOpenMySQL(CN)
        End Try
        Return AdmKvmLVMList
    End Function
    Function ReadAdmKvmLVMmemberList(ByRef CN As MySqlConnection) As List(Of AdmKvmLVMmember)
        Dim AdmKvmLVMmemberList As New List(Of AdmKvmLVMmember)
        Dim CMD1 As MySqlCommand
        Try
            CMD1 = New MySqlCommand($"select * from `cryptochestmax`.`KvmLVMmember`;", CN)
            Dim RDR1 As MySqlDataReader = CMD1.ExecuteReader
            While RDR1.Read
                AdmKvmLVMmemberList.Add(New AdmKvmLVMmember With {
                            .i = CInt(RDR1("i")),
                            .toKvmLVM = RDR1("toKvmLVM"),
                            .DeviceName = RDR1("DeviceName"),
                            .UUID = RDR1("UUID"),
                            .Type = RDR1("Type"),
                            .BlockSize = If(IsDBNull(RDR1("BlockSize")), Nothing, RDR1("BlockSize")),
                            .Comment = If(IsDBNull(RDR1("Comment")), "", RDR1("Comment")),
                            .LastUpdate = CDate(RDR1("LastUpdate"))
                                      })
            End While
            RDR1.Close()
        Catch ex As Exception
            Console.WriteLine(ex.Message & CMD1.CommandText)
            CN.Close()
            ReOpenMySQL(CN)
        End Try
        Return AdmKvmLVMmemberList
    End Function
    Function ReadAdmKvmNetworkInterfaceList(ByRef CN As MySqlConnection) As List(Of AdmKvmNetworkInterface)
        Dim AdmKvmNetworkInterfaceList As New List(Of AdmKvmNetworkInterface)
        Dim CMD1 As MySqlCommand
        Try
            CMD1 = New MySqlCommand($"select * from `cryptochestmax`.`KvmNetworkInterface`;", CN)
            Dim RDR1 As MySqlDataReader = CMD1.ExecuteReader
            While RDR1.Read
                AdmKvmNetworkInterfaceList.Add(New AdmKvmNetworkInterface With {
                            .i = CInt(RDR1("i")),
                            .toKvmHost = RDR1("toKvmHost"),
                            .Name = RDR1("Name"),
                            .Ip = RDR1("Ip"),
                            .Gateway = If(IsDBNull(RDR1("Gateway")), Nothing, RDR1("Gateway")),
                            .Netmask = RDR1("Netmask"),
                            .Broadcast = RDR1("Broadcast"),
                            .Mac = RDR1("Mac"),
                            .Comment = If(IsDBNull(RDR1("Comment")), "", RDR1("Comment")),
                            .LastUpdate = CDate(RDR1("LastUpdate"))
                                      })
            End While
            RDR1.Close()
        Catch ex As Exception
            Console.WriteLine(ex.Message & CMD1.CommandText)
            CN.Close()
            ReOpenMySQL(CN)
        End Try
        Return AdmKvmNetworkInterfaceList
    End Function
    Function ReadAdmKvmPoolList(ByRef CN As MySqlConnection) As List(Of AdmKvmPool)
        Dim AdmKvmPoolList As New List(Of AdmKvmPool)
        Dim CMD1 As MySqlCommand
        Try
            CMD1 = New MySqlCommand($"select * from `cryptochestmax`.`KvmPool`;", CN)
            Dim RDR1 As MySqlDataReader = CMD1.ExecuteReader
            While RDR1.Read
                AdmKvmPoolList.Add(New AdmKvmPool With {
                            .i = CInt(RDR1("i")),
                            .toStorageDevice = RDR1("toStorageDevice"),
                            .Type = RDR1("Type"),
                            .Name = RDR1("Name"),
                            .State = RDR1("State"),
                            .Autostart = RDR1("Autostart"),
                            .UUID = RDR1("UUID"),
                            .Format = If(IsDBNull(RDR1("Format")), Nothing, RDR1("Format")),
                            .Path = RDR1("Path"),
                            .Capacity = RDR1("Capacity"),
                            .Allocation = RDR1("Allocation"),
                            .Available = RDR1("Available"),
                            .Comment = If(IsDBNull(RDR1("Comment")), "", RDR1("Comment")),
                            .LastUpdate = CDate(RDR1("LastUpdate"))
                                      })
            End While
            RDR1.Close()
        Catch ex As Exception
            Console.WriteLine(ex.Message & CMD1.CommandText)
            CN.Close()
            ReOpenMySQL(CN)
        End Try
        Return AdmKvmPoolList
    End Function
    Function ReadAdmKvmStorageDeviceList(ByRef CN As MySqlConnection) As List(Of AdmKvmStorageDevice)
        Dim AdmKvmStorageDeviceList As New List(Of AdmKvmStorageDevice)
        Dim CMD1 As MySqlCommand
        Try
            CMD1 = New MySqlCommand($"select * from `cryptochestmax`.`KvmStorageDevice`;", CN)
            Dim RDR1 As MySqlDataReader = CMD1.ExecuteReader
            While RDR1.Read
                AdmKvmStorageDeviceList.Add(New AdmKvmStorageDevice With {
                            .i = CInt(RDR1("i")),
                            .ToKvmHost = RDR1("ToKvmHost"),
                            .Name = RDR1("Name"),
                            .DiskType = RDR1("DiskType"),
                            .DiskId = RDR1("DiskId"),
                            .Model = RDR1("Model"),
                            .Capacity = RDR1("Capacity"),
                            .SectorSize = RDR1("SectorSize"),
                            .Bytes = RDR1("Bytes"),
                            .Sectors = RDR1("Sectors"),
                            .Comment = If(IsDBNull(RDR1("Comment")), "", RDR1("Comment")),
                            .LastUpdate = CDate(RDR1("LastUpdate"))
                                      })
            End While
            RDR1.Close()
        Catch ex As Exception
            Console.WriteLine(ex.Message & CMD1.CommandText)
            CN.Close()
            ReOpenMySQL(CN)
        End Try
        Return AdmKvmStorageDeviceList
    End Function
    Function ReadAdmKvmPoolExtentList(ByRef CN As MySqlConnection) As List(Of AdmKvmPoolExtent)
        Dim AdmKvmPoolExtentList As New List(Of AdmKvmPoolExtent)
        Dim CMD1 As MySqlCommand
        Try
            CMD1 = New MySqlCommand($"select * from `cryptochestmax`.`KvmPoolExtent`;", CN)
            Dim RDR1 As MySqlDataReader = CMD1.ExecuteReader
            While RDR1.Read
                AdmKvmPoolExtentList.Add(New AdmKvmPoolExtent With {
                            .i = CInt(RDR1("i")),
                            .toKvmPool = RDR1("toKvmPool"),
                            .Start = RDR1("Start"),
                            .[End] = RDR1("End"),
                            .Comment = If(IsDBNull(RDR1("Comment")), "", RDR1("Comment")),
                            .LastUpdate = CDate(RDR1("LastUpdate"))
                                      })
            End While
            RDR1.Close()
        Catch ex As Exception
            Console.WriteLine(ex.Message & CMD1.CommandText)
            CN.Close()
            ReOpenMySQL(CN)
        End Try
        Return AdmKvmPoolExtentList
    End Function
    Function ReadAdmKvmVlanSwitchList(ByRef CN As MySqlConnection) As List(Of AdmKvmVlanSwitch)
        Dim AdmKvmVlanSwitchList As New List(Of AdmKvmVlanSwitch)
        Dim CMD1 As MySqlCommand
        Try
            CMD1 = New MySqlCommand($"select * from `cryptochestmax`.`KvmVlanSwitch`;", CN)
            Dim RDR1 As MySqlDataReader = CMD1.ExecuteReader
            While RDR1.Read
                AdmKvmVlanSwitchList.Add(New AdmKvmVlanSwitch With {
                            .i = CInt(RDR1("i")),
                            .toKvmHost = RDR1("toKvmHost"),
                            .toNetworkInterface = RDR1("toNetworkInterface"),
                            .id = RDR1("id"),
                            .VlanName = RDR1("VlanName"),
                            .VirtSwitch = RDR1("VirtSwitch"),
                            .SwitchMac = RDR1("SwitchMac"),
                            .FromIp = RDR1("FromIp"),
                            .ToIp = RDR1("ToIp"),
                            .IpBroadcast = RDR1("IpBroadcast"),
                            .IpNetmask = RDR1("IpNetmask"),
                            .IpGateway = RDR1("IpGateway"),
                            .Comment = If(IsDBNull(RDR1("Comment")), "", RDR1("Comment")),
                            .LastUpdate = CDate(RDR1("LastUpdate"))
                                      })
            End While
            RDR1.Close()
        Catch ex As Exception
            Console.WriteLine(ex.Message & CMD1.CommandText)
            CN.Close()
            ReOpenMySQL(CN)
        End Try
        Return AdmKvmVlanSwitchList
    End Function
    Function ReadAdmKvmVolumeList(ByRef CN As MySqlConnection) As List(Of AdmKvmVolume)
        Dim AdmKvmVolumeList As New List(Of AdmKvmVolume)
        Dim CMD1 As MySqlCommand
        Try
            CMD1 = New MySqlCommand($"select * from `cryptochestmax`.`KvmVolume`;", CN)
            Dim RDR1 As MySqlDataReader = CMD1.ExecuteReader
            While RDR1.Read
                AdmKvmVolumeList.Add(New AdmKvmVolume With {
                            .i = CInt(RDR1("i")),
                            .toKvmPool = If(IsDBNull(RDR1("toKvmPool")), Nothing, RDR1("toKvmPool")),
                            .toDevicePartition = If(IsDBNull(RDR1("toDevicePartition")), Nothing, RDR1("toDevicePartition")),
                            .Name = RDR1("Name"),
                            .Path = RDR1("Path"),
                            .Type = RDR1("Type"),
                            .Capacity = RDR1("Capacity"),
                            .Allocation = RDR1("Allocation"),
                            .Comment = If(IsDBNull(RDR1("Comment")), "", RDR1("Comment")),
                            .LastUpdate = CDate(RDR1("LastUpdate"))
                                      })
            End While
            RDR1.Close()
        Catch ex As Exception
            Console.WriteLine(ex.Message & CMD1.CommandText)
            CN.Close()
            ReOpenMySQL(CN)
        End Try
        Return AdmKvmVolumeList
    End Function
    Function ReadAdmUserList(ByRef CN As MySqlConnection) As List(Of AdmUser)
        Dim AdmUserList As New List(Of AdmUser)
        Dim CMD1 As MySqlCommand
        Try
            CMD1 = New MySqlCommand($"select * from `cryptochestmax`.`User`;", CN)
            Dim RDR1 As MySqlDataReader = CMD1.ExecuteReader
            While RDR1.Read
                AdmUserList.Add(New AdmUser With {
                            .i = CInt(RDR1("i")),
                            .Name = RDR1("Name"),
                            .Comment = If(IsDBNull(RDR1("Comment")), "", RDR1("Comment")),
                            .LastUpdate = CDate(RDR1("LastUpdate"))
                                      })
            End While
            RDR1.Close()
        Catch ex As Exception
            Console.WriteLine(ex.Message & CMD1.CommandText)
            CN.Close()
            ReOpenMySQL(CN)
        End Try
        Return AdmUserList
    End Function
    Function ReadAdmVMList(ByRef CN As MySqlConnection) As List(Of AdmVM)
        Dim AdmVMList As New List(Of AdmVM)
        Dim CMD1 As MySqlCommand
        Try
            CMD1 = New MySqlCommand($"select * from `cryptochestmax`.`VM`;", CN)
            Dim RDR1 As MySqlDataReader = CMD1.ExecuteReader
            While RDR1.Read
                AdmVMList.Add(New AdmVM With {
                            .i = CInt(RDR1("i")),
                            .toKvmHost = RDR1("toKvmHost"),
                            .ToKvmVolume = RDR1("ToKvmVolume"),
                            .ToVmNetwork = RDR1("ToVmNetwork"),
                            .toUser = RDR1("toUser"),
                            .UUID = RDR1("UUID"),
                            .Id = RDR1("Id"),
                            .Name = RDR1("Name"),
                            .OsVersion = RDR1("OsVersion"),
                            .State = RDR1("State"),
                            .CpuSet = RDR1("CpuSet"),
                            .Vcpu = RDR1("Vcpu"),
                            .Memory = RDR1("Memory"),
                            .SpicePort = RDR1("SpicePort"),
                            .MacAdr = RDR1("MacAdr"),
                            .AdminLogin = RDR1("AdminLogin"),
                            .AdminPassword = Text.UTF8Encoding.UTF8.GetString(RDR1("AdminPassword")),
                            .Comment = If(IsDBNull(RDR1("Comment")), "", RDR1("Comment")),
                            .LastUpdate = CDate(RDR1("LastUpdate"))
                                      })
            End While
            RDR1.Close()
        Catch ex As Exception
            Console.WriteLine(ex.Message & CMD1.CommandText)
            CN.Close()
            ReOpenMySQL(CN)
        End Try
        Return AdmVMList
    End Function
    Function ReadAdmVMNetworkList(ByRef CN As MySqlConnection) As List(Of AdmVMNetwork)
        Dim AdmVMNetworkList As New List(Of AdmVMNetwork)
        Dim CMD1 As MySqlCommand
        Try
            CMD1 = New MySqlCommand($"select * from `cryptochestmax`.`VMNetwork`;", CN)
            Dim RDR1 As MySqlDataReader = CMD1.ExecuteReader
            While RDR1.Read
                AdmVMNetworkList.Add(New AdmVMNetwork With {
                            .i = CInt(RDR1("i")),
                            .toKvmBridge = RDR1("toKvmBridge"),
                            .Name = RDR1("Name"),
                            .Ip = RDR1("Ip"),
                            .MAC = RDR1("MAC"),
                            .Comment = If(IsDBNull(RDR1("Comment")), "", RDR1("Comment")),
                            .LastUpdate = CDate(RDR1("LastUpdate"))
                                      })
            End While
            RDR1.Close()
        Catch ex As Exception
            Console.WriteLine(ex.Message & CMD1.CommandText)
            CN.Close()
            ReOpenMySQL(CN)
        End Try
        Return AdmVMNetworkList
    End Function
End Module
