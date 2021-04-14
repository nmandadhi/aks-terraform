resource "random_pet" "prefix" {}

resource "azurerm_kubernetes_cluster" "default" {
    name                = "${random_pet.prefix.id}-aks"
    location            = var.location
    resource_group_name = var.resource_group_name
    dns_prefix          = "${random_pet.prefix.id}-k8s"

    default_node_pool {
        name            = "default"
        node_count      = var.agent_count
        vm_size         = "Standard_D2_v2"
        os_disk_size_gb = 30
    }

    service_principal {
        client_id     = var.appId
        client_secret = var.password
    }

    role_based_access_control {
        enabled = true
    }

    addon_profile {
        kube_dashboard {
            enabled = true
        }
    }

    tags = {
        environment = "Demo"
    }
}