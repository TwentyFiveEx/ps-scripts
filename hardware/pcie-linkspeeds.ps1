(Get-WMIObject Win32_Bus -Filter 'DeviceID like "PCI%"').GetRelated('Win32_PnPEntity') |
 foreach {
   [pscustomobject][ordered]@{
     Name = $_.Name
     ExpressSpecVersion=$_.GetDeviceProperties('DEVPKEY_PciDevice_ExpressSpecVersion').deviceProperties.data
     MaxLinkSpeed      =$_.GetDeviceProperties('DEVPKEY_PciDevice_MaxLinkSpeed'      ).deviceProperties.data
     MaxLinkWidth      =$_.GetDeviceProperties('DEVPKEY_PciDevice_MaxLinkWidth'      ).deviceProperties.data
     CurrentLinkSpeed  =$_.GetDeviceProperties('DEVPKEY_PciDevice_CurrentLinkSpeed'  ).deviceProperties.data
     CurrentLinkWidth  =$_.GetDeviceProperties('DEVPKEY_PciDevice_CurrentLinkWidth'  ).deviceProperties.data
   } |
   Where MaxLinkSpeed
 } | Format-Table -AutoSize; 
