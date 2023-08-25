{
    "Terraform Azure Config": {
        "Turbonomic Workflow for Terraform | RISK" : "$action.details",
        "Config Type" : "Turbo_Workflow_VMware_VM_Config",
        "VirtualMachine_Compute" : {
            "environment"           : "Terraform ($!action.target.environmentType)",
            "name"                  : "$!action.target.displayName",
            "location"              : "TechZone",
            "network_interface_ids" : "TZ_VMNET_01",
            "vcpu"                  : "$!action.valueUnits"
            }
        },
        "VM_Disk" : {
            "os_disk" : {
            "name"                 : "OsDisk01",
            "caching"              : "ReadWrite",
            "storage_account_type" : "TechZONE_VCS003-1_DCCluster_Tier03"
            }
    },  
    "source_image_reference" : {
      "publisher" : "Canonical",
      "offer"     : "0001-com-ubuntu-server-jammy",
      "sku"       : "23_04-lts-gen2",
      "version"   : "latest"
    },
    "CUSTOM ANNOTATION FROM Turbonomic" : {
        "properties": {
            "Environment": "$!action.target.environmentType",
            "Type": "$!action.target.type",
            "Relationship": "$!action.target.discoveredBy.displayName",
            "Risk": "$!action.risk.description",
            "actionBegin": "$!action.createTime",
            "actionEnd": "$!action.updateTime",
            "Metric": "$!action.valueUnits",
            "PreviousValue": "$action.currentValue",
            "NewValue": "$action.newValue"
          }
    },
    "AZ_VM_Details"  : {
    "computer_name"  : "$!action.target.displayName",
    "admin_username" : "administrator@contoso.com"
    },
    "admin_ssh_key" : {
      "username"   : "turbo",
      "public_key" : "jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey"
    },
    "boot_diagnostics" : {
      "storage_account_uri" : "azurerm_storage_account.my_storage_account.primary_blob_endpoint"
    }
  }


