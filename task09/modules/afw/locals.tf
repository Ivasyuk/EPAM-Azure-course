locals {
  pip_name         = "${var.unique_id}-pip"
  firewall_name    = "${var.unique_id}-afw"
  route_table_name = "${var.unique_id}-rt"

  rule_collections = {
    nat = {
      name     = "${var.unique_id}-nat-rules"
      priority = 100
      action   = "Dnat"
    }
    network = {
      name     = "${var.unique_id}-network-rules"
      priority = 200
      action   = "Allow"
    }
    application = {
      name     = "${var.unique_id}-app-rules"
      priority = 300
      action   = "Allow"
    }
  }

  nat_rules = [
    {
      name              = "AllowInboundHTTP"
      source_addresses  = ["*"]
      destination_ports = ["80"]
      protocols         = ["TCP"]
      translated_port   = "80"
    },
    {
      name              = "AllowInboundHTTPS"
      source_addresses  = ["*"]
      destination_ports = ["443"]
      protocols         = ["TCP"]
      translated_port   = "443"
    }
  ]

  network_rules = [
    {
      name                  = "AllowDNS"
      source_addresses      = ["*"]
      destination_addresses = ["*"]
      destination_ports     = ["53"]
      protocols             = ["UDP", "TCP"]
    },
    {
      name                  = "AllowAzureCloud"
      source_addresses      = ["*"]
      destination_addresses = ["AzureCloud"]
      destination_ports     = ["*"]
      protocols             = ["Any"]
    },
    {
      name                  = "AllowAKSEgress"
      source_addresses      = ["10.0.0.0/16"] 
      destination_addresses = ["*"]
      destination_ports     = ["*"]
      protocols             = ["Any"]
    },
    {
      name                  = "AllowAKSCommunication"
      source_addresses      = ["*"]
      destination_addresses = ["*"]
      destination_ports     = ["22", "443", "9000", "1194"]
      protocols             = ["TCP", "UDP"]
    },
    {
      name                  = "AllowHTTPOutbound"
      source_addresses      = ["*"]
      destination_addresses = ["*"]
      destination_ports     = ["80", "443"]
      protocols             = ["TCP"]
    },
    {
      name                  = "AllowNTP"
      source_addresses      = ["*"]
      destination_addresses = ["*"]
      destination_ports     = ["123"]
      protocols             = ["UDP"]
    }
  ]

  app_rule_fqdns = [
    "*.hcp.northeurope.azmk8s.io",
    "*.tun.northeurope.azmk8s.io",
    "aks-engine-fqdn.northeurope.cloudapp.azure.com",

    "*.aks-ingress.microsoft.com",
    "*.aks.microsoft.com",
    "*.login.microsoft.com",
    "*.monitoring.azure.com",
    "*.azurecr.io",
    "*.data.mcr.microsoft.com",
    "*.blob.core.windows.net",
    "mcr.microsoft.com",
    "*.cdn.mscr.io",
    "management.azure.com",
    "login.microsoftonline.com",

    "*.kubernetes.io",
    "kubernetes.io",
    "k8s.gcr.io",
    "storage.googleapis.com",
    "security.ubuntu.com",
    "packages.microsoft.com",
    "azure.archive.ubuntu.com",
    "motd.ubuntu.com",

    "dc.services.visualstudio.com",
    "*.opinsights.azure.com",
    "*.monitoring.azure.com",
    "prometheus.monitor.azure.com",

    "checkip.dyndns.org",
    "api.snapcraft.io",
    "graph.microsoft.com",
    "*.api.azurecr.io",
    "*.teleport.azure.com",
    "*.ubuntu.com"
  ]
}
