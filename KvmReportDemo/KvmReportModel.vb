﻿Imports Newtonsoft.Json

Partial Module Program
    Public Class KvmReport
        Public Property KvmHostList As List(Of KvmHostReport)
    End Class

    Public Class KvmHostReport
        Inherits AdmKvmHost

        <JsonProperty(Order:=100)>
        Property VM As List(Of VmReport)
        <JsonProperty(Order:=101)>
        Property Network As List(Of KvmNetworkReport)
        <JsonProperty(Order:=102)>
        Property Storage As List(Of KvmStorageReport)
        <JsonProperty(Order:=103)>
        Property VirtualStorage As List(Of KvmPoolReport)
        <JsonProperty(Order:=104)>
        Property Access As List(Of KvmHostAccessReport)
    End Class

    Public Class KvmHostAccessReport
        Inherits AdmKvmHostAccess
        <JsonProperty(Order:=100)>
        Property User As List(Of String)
    End Class

    Public Class KvmStorageReport
        Inherits AdmKvmStorageDevice
        <JsonProperty(Order:=100)>
        Property LvmStorage As List(Of KvmLVMReport)
        <JsonProperty(Order:=101)>
        Property PartitionStorage As List(Of KvmDevicePartitionReport)
    End Class

    Public Class KvmLVMReport
        Inherits AdmKvmLVM
        <JsonProperty(Order:=100)>
        Property LvmMember As List(Of AdmKvmLVMmember)
    End Class

    Public Class KvmDevicePartitionReport
        Inherits AdmKvmDevicePartition
    End Class

    Public Class KvmNetworkReport
        Inherits AdmKvmBridge
        <JsonProperty(Order:=100)>
        Property NetworkInterface As List(Of AdmKvmNetworkInterface)

        <JsonProperty(Order:=102)>
        Property Bridge As KvmBridgeReport
    End Class

    Public Class KvmBridgeReport
        Property VlanSwitch As List(Of AdmKvmVlanSwitch)
        <JsonProperty(Order:=100)>
        Property Bridge As AdmKvmBridge
        <JsonProperty(Order:=101)>
        Property Port As List(Of KvmBridgePortReport)
    End Class

    Public Class KvmBridgePortReport
        Inherits AdmKvmBridgePort
        <JsonProperty(Order:=100)>
        Property IP As List(Of String)
    End Class

    Public Class KvmPoolReport
        Inherits AdmKvmPool                           'this is ref to KvmStorageReport
        <JsonProperty(Order:=100)>
        Property Volume As List(Of AdmKvmVolume)
        <JsonProperty(Order:=101)>
        Property Extent As List(Of AdmKvmPoolExtent)
    End Class

    Public Class VmReport
        Inherits AdmVM

        <JsonProperty(Order:=100)>
        Property Ip As List(Of String)
        <JsonProperty(Order:=101)>
        Property VmNetworkName As List(Of String)      'ref to VmNetwork from KvmNetworkReport
        <JsonProperty(Order:=102)>
        Property StorageDeviceName As List(Of Tuple(Of String, String))
        <JsonProperty(Order:=103)>
        Property UserName As String                    'ref to User KvmHostAccessReport
    End Class

End Module
