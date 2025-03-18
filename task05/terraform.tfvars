# Resource Group Locations
rg1_location = "East US"
rg2_location = "West US"
rg3_location = "Central US"

# App Service Plan and App Service details (as explained earlier)


# Traffic Manager Details
traffic_manager_name           = "cmaz-efe625c7-mod5-traf"
traffic_manager_routing_method = "Performance"
relative_name                  = "cmaz-efe625c7-mod5-traf"

# Monitor Configuration
monitor_protocol = "HTTP"    # Protocol for health checks
monitor_port     = 80        # Port for health checks
monitor_path     = "/health" # Path for health checks (adjust based on your app)
