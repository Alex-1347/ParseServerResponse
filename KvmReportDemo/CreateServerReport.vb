Imports MySqlConnector
Imports Newtonsoft.Json
Imports Newtonsoft.Json.Linq

Partial Module Program
    Function CreateServerReport(CN As MySqlConnection) As String
        Dim AdmKvmReport As New KvmReport
        Dim AdmKvmDevicePartitionList As List(Of AdmKvmDevicePartition) = ReadAdmKvmDevicePartitionList(CN)
        Dim AdmKvmHostList As List(Of AdmKvmHost) = ReadAdmKvmHostList(CN)
        Dim AdmKvmHostAccessList As List(Of AdmKvmHostAccess) = ReadAdmKvmHostAccessList(CN)
        Dim AdmKvmLVMList As List(Of AdmKvmLVM) = ReadAdmKvmLVMList(CN)
        Dim AdmKvmLVMmemberList As List(Of AdmKvmLVMmember) = ReadAdmKvmLVMmemberList(CN)
        Dim AdmKvmNetworkInterfaceList As List(Of AdmKvmNetworkInterface) = ReadAdmKvmNetworkInterfaceList(CN)
        Dim AdmKvmPoolList As List(Of AdmKvmPool) = ReadAdmKvmPoolList(CN)
        Dim AdmKvmStorageDeviceList As List(Of AdmKvmStorageDevice) = ReadAdmKvmStorageDeviceList(CN)
        Dim AdmKvmPoolExtentList As List(Of AdmKvmPoolExtent) = ReadAdmKvmPoolExtentList(CN)
        Dim AdmKvmVlanList As List(Of AdmKvmVlanSwitch) = ReadAdmKvmVlanSwitchList(CN)
        Dim AdmKvmVolumeList As List(Of AdmKvmVolume) = ReadAdmKvmVolumeList(CN)
        Dim AdmUserList As List(Of AdmUser) = ReadAdmUserList(CN)
        Dim AdmVMList As List(Of AdmVM) = ReadAdmVMList(CN)
        Dim AdmKvmBridgeList As List(Of AdmKvmBridge) = ReadAdmKvmBridgeList(CN)
        Dim AdmKvmBridgePortList As List(Of AdmKvmBridgePort) = ReadAdmKvmBridgePortList(CN)
        Dim AdmVmIpList As List(Of AdmVmIp) = ReadAdmVmIpList(CN)

        AdmKvmReport.KvmHostList = New List(Of KvmHostReport)
        For I As Integer = 0 To AdmKvmHostList.Count - 1
            AdmKvmReport.KvmHostList.Add(New KvmHostReport With {
                                                        .i = AdmKvmHostList(I).i,
                                                        .Access = New List(Of KvmHostAccessReport),
                                                        .Storage = New List(Of KvmStorageReport),
                                                        .Network = New List(Of KvmNetworkReport),
                                                        .VirtualStorage = New List(Of KvmPoolReport),
                                                        .VM = New List(Of VmReport),
                                                        .OsVersion = AdmKvmHostList(I).OsVersion,
                                                        .ServerName = AdmKvmHostList(I).ServerName,
                                                        .KvmVersion = AdmKvmHostList(I).KvmVersion,
                                                        .UserName = AdmKvmHostList(I).UserName,
                                                        .Password = AdmKvmHostList(I).Password,
                                                        .CpuModel = AdmKvmHostList(I).CpuModel,
                                                        .CpuCount = AdmKvmHostList(I).CpuCount,
                                                        .CpuSocket = AdmKvmHostList(I).CpuSocket,
                                                        .CorePerSocket = AdmKvmHostList(I).CorePerSocket,
                                                        .ThreadPerSocket = AdmKvmHostList(I).ThreadPerSocket,
                                                        .NumaCell = AdmKvmHostList(I).NumaCell,
                                                        .MemorySize = AdmKvmHostList(I).MemorySize,
                                                        .MainServerIP = AdmKvmHostList(I).MainServerIP,
                                                        .MonthPrice = AdmKvmHostList(I).MonthPrice,
                                                        .Location = AdmKvmHostList(I).Location,
                                                        .Comment = AdmKvmHostList(I).Comment,
                                                        .LastUpdate = AdmKvmHostList(I).LastUpdate
                                                 })
        Next
        For I As Integer = 0 To AdmKvmHostList.Count - 1
            'Access - OK
            For j As Integer = 0 To AdmKvmHostAccessList.Count - 1
                Dim KvmHostAccessReport1 = New KvmHostAccessReport With {
                                                                .User = New List(Of String),
                                                                .i = AdmKvmHostAccessList(j).i,
                                                                .toKvmHost = AdmKvmHostAccessList(j).toKvmHost,
                                                                .toUser = AdmKvmHostAccessList(j).toUser,
                                                                .FromIp = AdmKvmHostAccessList(j).FromIp,
                                                                .Comment = AdmKvmHostAccessList(j).Comment,
                                                                .LastUpdate = AdmKvmHostAccessList(j).LastUpdate
                        }
                KvmHostAccessReport1.User = New List(Of String)
                AdmUserList.Where(Function(X) X.i = AdmKvmHostAccessList(j).toUser).ToList.ForEach(Sub(Y) KvmHostAccessReport1.User.Add(Y.Name))
                AdmKvmReport.KvmHostList(I).Access.Add(KvmHostAccessReport1)
            Next
            For j As Integer = 0 To AdmKvmStorageDeviceList.Count - 1
                Dim KvmStorageReport1 = New KvmStorageReport With {
                                    .i = AdmKvmStorageDeviceList(j).i,
                                    .LvmStorage = New List(Of KvmLVMReport),
                                    .PartitionStorage = New List(Of KvmDevicePartitionReport),
                                    .ToKvmHost = AdmKvmStorageDeviceList(j).ToKvmHost,
                                    .Name = AdmKvmStorageDeviceList(j).Name,
                                    .DiskType = AdmKvmStorageDeviceList(j).DiskType,
                                    .DiskId = AdmKvmStorageDeviceList(j).DiskId,
                                    .Model = AdmKvmStorageDeviceList(j).Model,
                                    .Capacity = AdmKvmStorageDeviceList(j).Capacity,
                                    .SectorSize = AdmKvmStorageDeviceList(j).SectorSize,
                                    .Bytes = AdmKvmStorageDeviceList(j).Bytes,
                                    .Sectors = AdmKvmStorageDeviceList(j).Sectors,
                                    .Comment = AdmKvmStorageDeviceList(j).Comment,
                                    .LastUpdate = AdmKvmStorageDeviceList(j).LastUpdate
                        }
                AdmKvmLVMList.Where(Function(Y) Y.ToKvmStorage = KvmStorageReport1.i).ToList.
                            ForEach(Sub(X) KvmStorageReport1.LvmStorage.Add(
                                     New KvmLVMReport With {
                                    .LvmMember = New List(Of AdmKvmLVMmember),
                                    .i = X.i,
                                    .ToKvmStorage = X.ToKvmStorage,
                                    .PartName = X.PartName,
                                    .LvmName = X.LvmName,
                                    .Fmt = X.Fmt,
                                    .Size = X.Size,
                                    .Free = X.Free,
                                    .Comment = X.Comment,
                                    .LastUpdate = X.LastUpdate
                        }))
                Dim LvmPresent = KvmStorageReport1.LvmStorage.Where(Function(X) X IsNot Nothing).Select(Function(Y) New With {Y.LvmMember, Y.i}).ToList
                For Each OneLvm In LvmPresent
                    For Each OneLvmMember In AdmKvmLVMmemberList
                        If OneLvm.i = OneLvmMember.toKvmLVM Then
                            OneLvm.LvmMember.Add(New AdmKvmLVMmember With {
                                        .i = OneLvmMember.i,
                                        .toKvmLVM = OneLvmMember.toKvmLVM,
                                        .DeviceName = OneLvmMember.DeviceName,
                                        .UUID = OneLvmMember.UUID,
                                        .Type = OneLvmMember.Type,
                                        .BlockSize = OneLvmMember.BlockSize,
                                        .Comment = OneLvmMember.Comment,
                                        .LastUpdate = OneLvmMember.LastUpdate
                                    })
                        End If
                    Next
                Next
                Dim Partitions = AdmKvmDevicePartitionList.Where(Function(Y) Y.ToKvmStorageDevice IsNot Nothing)
                Partitions.Where(Function(Y) Y.ToKvmStorageDevice = KvmStorageReport1.i).ToList.
                         ForEach(Sub(X) KvmStorageReport1.PartitionStorage.Add(New KvmDevicePartitionReport With {
                                 .i = X.i,
                                 .ToKvmStorageDevice = X.ToKvmStorageDevice,
                                 .ToKvmLvmDevice = X.ToKvmLvmDevice,
                                 .Name = X.Name,
                                 .Type = X.Type,
                                 .UUID = X.UUID,
                                 .PartUUID = X.PartUUID,
                                 .PtType = X.PtType,
                                 .PartLabel = X.PartLabel,
                                 .BlockSize = X.BlockSize,
                                 .Size = X.Size,
                                 .Start = X.Start,
                                 .[End] = X.[End],
                                 .Sectors = X.Sectors,
                                 .Comment = X.Comment,
                                 .LastUpdate = X.LastUpdate
                     }))
                AdmKvmReport.KvmHostList(I).Storage.Add(KvmStorageReport1)
            Next
            For j As Integer = 0 To AdmKvmPoolList.Count - 1
                Dim KvmPoolReport1 = New KvmPoolReport With {
                                    .Volume = New List(Of AdmKvmVolume),
                                    .Extent = New List(Of AdmKvmPoolExtent),
                                    .i = AdmKvmPoolList(j).i,
                                    .toStorageDevice = AdmKvmPoolList(j).toStorageDevice,
                                    .Type = AdmKvmPoolList(j).Type,
                                    .Name = AdmKvmPoolList(j).Name,
                                    .State = AdmKvmPoolList(j).State,
                                    .Autostart = AdmKvmPoolList(j).Autostart,
                                    .UUID = AdmKvmPoolList(j).UUID,
                                    .Format = AdmKvmPoolList(j).Format,
                                    .Path = AdmKvmPoolList(j).Path,
                                    .Capacity = AdmKvmPoolList(j).Capacity,
                                    .Allocation = AdmKvmPoolList(j).Allocation,
                                    .Available = AdmKvmPoolList(j).Available,
                                    .Comment = AdmKvmPoolList(j).Comment,
                                    .LastUpdate = AdmKvmPoolList(j).LastUpdate
                            }
                Dim CurVulume = AdmKvmVolumeList.Where(Function(X) X.toKvmPool = KvmPoolReport1.i).ToList
                CurVulume.ForEach(Sub(X) KvmPoolReport1.Volume.Add(X))
                Dim CurExtent = AdmKvmPoolExtentList.Where(Function(X) X.toKvmPool = KvmPoolReport1.i).ToList
                CurExtent.ForEach(Sub(X) KvmPoolReport1.Extent.Add(X))
                AdmKvmReport.KvmHostList(I).VirtualStorage.Add(KvmPoolReport1)
            Next
            'Network - ok
            For j As Integer = 0 To AdmKvmBridgeList.Count - 1
                Dim KvmNetworkReport1 = New KvmNetworkReport With {
                                    .NetworkInterface = New List(Of AdmKvmNetworkInterface),
                                    .Bridge = New KvmBridgeReport,
                                    .i = AdmKvmBridgeList(j).i,
                                    .toKvmNetwork = AdmKvmBridgeList(j).toKvmNetwork,
                                    .toKvmVlanSwitch = AdmKvmBridgeList(j).toKvmVlanSwitch,
                                    .Name = AdmKvmBridgeList(j).Name,
                                    .Id = AdmKvmBridgeList(j).Id,
                                    .STP = AdmKvmBridgeList(j).STP,
                                    .Ip = AdmKvmBridgeList(j).Ip,
                                    .Comment = AdmKvmBridgeList(j).Comment,
                                    .LastUpdate = AdmKvmBridgeList(j).LastUpdate
                        }

                AdmKvmNetworkInterfaceList.Where(Function(X) X.toKvmHost = KvmNetworkReport1.i).ToList.
                                    ForEach(Sub(X) KvmNetworkReport1.NetworkInterface.Add(New AdmKvmNetworkInterface With {
                                    .i = X.i,
                                    .toKvmHost = X.toKvmHost,
                                    .Name = X.Name,
                                    .Ip = X.Ip,
                                    .Gateway = X.Gateway,
                                    .Netmask = X.Netmask,
                                    .Broadcast = X.Broadcast,
                                    .Mac = X.Mac,
                                    .Comment = X.Comment,
                                    .LastUpdate = X.LastUpdate
                                    }))
                If KvmNetworkReport1.toKvmVlanSwitch IsNot Nothing Then
                    For k As Integer = 0 To AdmKvmBridgeList.Count - 1
                        If AdmKvmBridgeList(k).toKvmVlanSwitch IsNot Nothing Then
                            KvmNetworkReport1.Bridge = New KvmBridgeReport With {
                                        .Bridge = AdmKvmBridgeList.Where(Function(X) X.toKvmVlanSwitch IsNot Nothing).Where(Function(X) X.toKvmVlanSwitch = KvmNetworkReport1.toKvmVlanSwitch).FirstOrDefault,
                                        .VlanSwitch = New List(Of AdmKvmVlanSwitch),
                                        .Port = New List(Of KvmBridgePortReport)}
                            AdmKvmBridgePortList.Where(Function(X) KvmNetworkReport1.Bridge.Bridge IsNot Nothing).Where(Function(X) X.toKvmBridge = KvmNetworkReport1.Bridge.Bridge.i).ToList.ForEach(Sub(X) KvmNetworkReport1.Bridge.Port.Add(New KvmBridgePortReport With {
                                         .IP = AdmVmIpList.Where(Function(Z) Z.toKvmBridgePort = X.i).Select(Function(Z) Z.Ip).ToList,
                                         .i = X.i,
                                         .toKvmBridge = X.toKvmBridge,
                                         .BridgePort = X.BridgePort,
                                         .Name = X.Name,
                                         .BridgePortMac = X.BridgePortMac,
                                         .Comment = X.Comment,
                                         .LastUpdate = X.LastUpdate
                                      }))
                            KvmNetworkReport1.Bridge.VlanSwitch = AdmKvmVlanList.Where(Function(X) X.i = KvmNetworkReport1.Bridge.Bridge.toKvmVlanSwitch).ToList
                        End If
                    Next
                End If


                AdmKvmReport.KvmHostList(I).Network.Add(KvmNetworkReport1)
            Next
            'VLAN-OK
            For j As Integer = 0 To AdmVMList.Count - 1
                Dim VmReport1 As New VmReport With {
                                        .VmNetworkName = New List(Of String),
                                        .Ip = New List(Of String),
                                        .StorageDeviceName = New List(Of Tuple(Of String, String)),
                                        .i = AdmVMList(j).i,
                                        .toKvmHost = AdmVMList(j).toKvmHost,
                                        .ToVmNetwork = AdmVMList(j).ToVmNetwork,
                                        .toUser = AdmVMList(j).toUser,
                                        .UUID = AdmVMList(j).UUID,
                                        .Id = AdmVMList(j).Id,
                                        .Name = AdmVMList(j).Name,
                                        .OsVersion = AdmVMList(j).OsVersion,
                                        .State = AdmVMList(j).State,
                                        .CpuSet = AdmVMList(j).CpuSet,
                                        .Vcpu = AdmVMList(j).Vcpu,
                                        .Memory = AdmVMList(j).Memory,
                                        .SpicePort = AdmVMList(j).SpicePort,
                                        .MacAdr = AdmVMList(j).MacAdr,
                                        .AdminLogin = AdmVMList(j).AdminLogin,
                                        .AdminPassword = AdmVMList(j).AdminPassword,
                                        .Comment = AdmVMList(j).Comment,
                                        .LastUpdate = AdmVMList(j).LastUpdate
                            }
                VmReport1.UserName = AdmUserList.Where(Function(X) X.i = VmReport1.toUser).FirstOrDefault.Name 'ref to User KvmHostAccessReport
                VmReport1.VmNetworkName = AdmKvmBridgeList.Where(Function(X) X.i = VmReport1.ToVmNetwork).Select(Of String)(Function(X) X.Name).ToList 'ref to VmNetwork from KvmNetworkReport
                VmReport1.Ip = AdmVmIpList.Where(Function(X) X.toVm = VmReport1.i).Select(Of String)(Function(X) X.Ip).ToList 'ref to VmNetwork from KvmNetworkReport
                For Each One In AdmKvmVolumeList
                    If One.toVm IsNot Nothing Then
                        If One.toVm = VmReport1.i Then
                            VmReport1.StorageDeviceName.Add(New Tuple(Of String, String)(One.Path, One.Capacity))
                        End If

                    End If
                Next
                AdmKvmReport.KvmHostList(I).VM.Add(VmReport1)
            Next
        Next
        '
        Dim JAdmKvmReport As JObject = JToken.FromObject(AdmKvmReport)
        Dim AdmKvmStringResult As String = JsonConvert.SerializeObject(JAdmKvmReport, New JsonSerializerSettings With {.Formatting = Formatting.Indented})
        Return AdmKvmStringResult
    End Function
End Module
