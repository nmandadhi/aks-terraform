variable "agent_count" {
    default = 2
}

variable cluster_name {
    default = "aks_test"
}

variable resource_group_name {
    default = ""
}

variable location {
    default = "Central US"
}

variable "appId" {
    description = "Azure Kubernetes Service Cluster service principal"
}

variable "password" {
    description = "Azure Kubernetes Service Cluster password"
}