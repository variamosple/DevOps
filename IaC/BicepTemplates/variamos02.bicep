param sites_VariaMos_name string = 'VariaMos'
param sites_variamos_ms_languages_name string = 'variamos-ms-languages'
param sites_variamos_ms_apireference_name string = 'variamos-ms-apireference'
param sites_variamos_ms_restrictions_name string = 'variamos-ms-restrictions'
param registries_variamos_name string = 'variamos'
param components_insights_variamos_name string = 'insights-variamos'
param serverfarms_ASP_variamosspla_a699_name string = 'ASP-variamosspla-a699'
param flexibleServers_variamos_db_name string = 'variamos-db'
param components_variamos_ms_apireference_name string = 'variamos-ms-apireference'
param containerGroups_variamosweb_name string = 'variamosweb'
param actionGroups_Application_Insights_Smart_Detection_name string = 'Application Insights Smart Detection'
param dashboards_15f1645d_2afa_4258_95e1_7396dd2536a6_dashboard_name string = '15f1645d-2afa-4258-95e1-7396dd2536a6-dashboard'
param smartdetectoralertrules_failure_anomalies_insights_variamos_name string = 'failure anomalies - insights-variamos'
param smartdetectoralertrules_exception_anomalies_insights_variamos_name string = 'exception anomalies - insights-variamos'
param smartdetectoralertrules_potential_memory_leak_insights_variamos_name string = 'potential memory leak - insights-variamos'
param smartdetectoralertrules_failure_anomalies_variamos_ms_apireference_name string = 'failure anomalies - variamos-ms-apireference'
param smartdetectoralertrules_trace_severity_degradation_insights_variamos_name string = 'trace severity degradation - insights-variamos'
param smartdetectoralertrules_response_latency_degradation_insights_variamos_name string = 'response latency degradation - insights-variamos'
param smartdetectoralertrules_dependency_latency_degradation_insights_variamos_name string = 'dependency latency degradation - insights-variamos'
param workspaces_DefaultWorkspace_8f89ea6f_8788_4f28_983a_75c317003eb4_EUS_externalid string = '/subscriptions/8f89ea6f-8788-4f28-983a-75c317003eb4/resourceGroups/DefaultResourceGroup-EUS/providers/Microsoft.OperationalInsights/workspaces/DefaultWorkspace-8f89ea6f-8788-4f28-983a-75c317003eb4-EUS'

resource containerGroups_variamosweb_name_resource 'Microsoft.ContainerInstance/containerGroups@2021-10-01' = {
  name: containerGroups_variamosweb_name
  location: 'eastus'
  properties: {
    sku: 'Standard'
    containers: [
      {
        name: containerGroups_variamosweb_name
        properties: {
          image: 'jsoto25/variamos-web:latest'
          ports: [
            {
              protocol: 'TCP'
              port: 80
            }
          ]
          environmentVariables: []
          resources: {
            requests: {
              memoryInGB: '1.5'
              cpu: 1
            }
          }
        }
      }
    ]
    initContainers: []
    restartPolicy: 'Always'
    ipAddress: {
      ports: [
        {
          protocol: 'TCP'
          port: 80
        }
      ]
      ip: '20.85.136.212'
      type: 'Public'
      dnsNameLabel: containerGroups_variamosweb_name
      dnsNameLabelReusePolicy: 'Unsecure'
    }
    osType: 'Linux'
  }
}

resource registries_variamos_name_resource 'Microsoft.ContainerRegistry/registries@2021-12-01-preview' = {
  name: registries_variamos_name
  location: 'eastus'
  sku: {
    name: 'Basic'
    tier: 'Basic'
  }
  properties: {
    adminUserEnabled: true
    policies: {
      quarantinePolicy: {
        status: 'disabled'
      }
      trustPolicy: {
        type: 'Notary'
        status: 'disabled'
      }
      retentionPolicy: {
        days: 7
        status: 'disabled'
      }
      exportPolicy: {
        status: 'enabled'
      }
    }
    encryption: {
      status: 'disabled'
    }
    dataEndpointEnabled: false
    publicNetworkAccess: 'Enabled'
    networkRuleBypassOptions: 'AzureServices'
    zoneRedundancy: 'Disabled'
    anonymousPullEnabled: false
  }
}

resource flexibleServers_variamos_db_name_resource 'Microsoft.DBforPostgreSQL/flexibleServers@2021-06-01' = {
  name: flexibleServers_variamos_db_name
  location: 'East US'
  sku: {
    name: 'Standard_B1ms'
    tier: 'Burstable'
  }
  properties: {
    version: '12'
    administratorLogin: 'adminpg'
    availabilityZone: '1'
    storage: {
      storageSizeGB: 32
    }
    backup: {
      backupRetentionDays: 7
      geoRedundantBackup: 'Disabled'
    }
    network: {}
    highAvailability: {
      mode: 'Disabled'
    }
    maintenanceWindow: {
      customWindow: 'Disabled'
      dayOfWeek: 0
      startHour: 0
      startMinute: 0
    }
  }
}

resource actionGroups_Application_Insights_Smart_Detection_name_resource 'microsoft.insights/actionGroups@2021-09-01' = {
  name: actionGroups_Application_Insights_Smart_Detection_name
  location: 'Global'
  properties: {
    groupShortName: 'SmartDetect'
    enabled: true
    emailReceivers: []
    smsReceivers: []
    webhookReceivers: []
    eventHubReceivers: []
    itsmReceivers: []
    azureAppPushReceivers: []
    automationRunbookReceivers: []
    voiceReceivers: []
    logicAppReceivers: []
    azureFunctionReceivers: []
    armRoleReceivers: [
      {
        name: 'Monitoring Contributor'
        roleId: '749f88d5-cbae-40b8-bcfc-e573ddc772fa'
        useCommonAlertSchema: true
      }
      {
        name: 'Monitoring Reader'
        roleId: '43d0d8ad-25c7-4714-9337-8ba259a9fe05'
        useCommonAlertSchema: true
      }
    ]
  }
}

resource components_insights_variamos_name_resource 'microsoft.insights/components@2020-02-02' = {
  name: components_insights_variamos_name
  location: 'eastus'
  kind: 'web'
  properties: {
    Application_Type: 'web'
    Flow_Type: 'Redfield'
    Request_Source: 'IbizaAIExtension'
    RetentionInDays: 90
    WorkspaceResourceId: workspaces_DefaultWorkspace_8f89ea6f_8788_4f28_983a_75c317003eb4_EUS_externalid
    IngestionMode: 'LogAnalytics'
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
  }
}

resource components_variamos_ms_apireference_name_resource 'microsoft.insights/components@2020-02-02' = {
  name: components_variamos_ms_apireference_name
  location: 'eastus'
  kind: 'web'
  properties: {
    Application_Type: 'web'
    Flow_Type: 'Redfield'
    Request_Source: 'IbizaAIExtensionEnablementBlade'
    RetentionInDays: 90
    WorkspaceResourceId: workspaces_DefaultWorkspace_8f89ea6f_8788_4f28_983a_75c317003eb4_EUS_externalid
    IngestionMode: 'LogAnalytics'
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
  }
}

resource dashboards_15f1645d_2afa_4258_95e1_7396dd2536a6_dashboard_name_resource 'Microsoft.Portal/dashboards@2020-09-01-preview' = {
  name: dashboards_15f1645d_2afa_4258_95e1_7396dd2536a6_dashboard_name
  location: 'eastus'
  tags: {
    'hidden-title': 'insights-variamos Dashboard'
  }
  properties: {
    lenses: [
      {
        order: 0
        parts: [
          {
            position: {
              x: 0
              y: 0
              rowSpan: 1
              colSpan: 2
            }
            metadata: {
              inputs: [
                {}
                {}
              ]
              type: 'Extension/AppInsightsExtension/PartType/AspNetOverviewPinnedPart'
            }
          }
          {
            position: {
              x: 2
              y: 0
              rowSpan: 1
              colSpan: 1
            }
            metadata: {
              inputs: [
                {}
                {}
              ]
              type: 'Extension/AppInsightsExtension/PartType/ProactiveDetectionAsyncPart'
            }
          }
          {
            position: {
              x: 3
              y: 0
              rowSpan: 1
              colSpan: 1
            }
            metadata: {
              inputs: [
                {}
                {}
              ]
              type: 'Extension/AppInsightsExtension/PartType/QuickPulseButtonSmallPart'
            }
          }
          {
            position: {
              x: 4
              y: 0
              rowSpan: 1
              colSpan: 1
            }
            metadata: {
              inputs: [
                {}
                {}
                {}
              ]
              type: 'Extension/AppInsightsExtension/PartType/AvailabilityNavButtonPart'
            }
          }
          {
            position: {
              x: 5
              y: 0
              rowSpan: 1
              colSpan: 1
            }
            metadata: {
              inputs: [
                {}
                {}
                {}
              ]
              type: 'Extension/AppInsightsExtension/PartType/AppMapButtonPart'
            }
          }
          {
            position: {
              x: 0
              y: 1
              rowSpan: 1
              colSpan: 3
            }
            metadata: {
              inputs: []
              type: 'Extension[azure]/HubsExtension/PartType/MarkdownPart'
              settings: {
                content: {
                  settings: {
                    content: '# Usage'
                  }
                }
              }
            }
          }
          {
            position: {
              x: 3
              y: 1
              rowSpan: 1
              colSpan: 1
            }
            metadata: {
              inputs: [
                {}
                {}
              ]
              type: 'Extension/AppInsightsExtension/PartType/UsageUsersOverviewPart'
            }
          }
          {
            position: {
              x: 4
              y: 1
              rowSpan: 1
              colSpan: 3
            }
            metadata: {
              inputs: []
              type: 'Extension[azure]/HubsExtension/PartType/MarkdownPart'
              settings: {
                content: {
                  settings: {
                    content: '# Reliability'
                  }
                }
              }
            }
          }
          {
            position: {
              x: 7
              y: 1
              rowSpan: 1
              colSpan: 1
            }
            metadata: {
              inputs: [
                {}
                {}
                {}
              ]
              type: 'Extension/AppInsightsExtension/PartType/CuratedBladeFailuresPinnedPart'
            }
          }
          {
            position: {
              x: 8
              y: 1
              rowSpan: 1
              colSpan: 3
            }
            metadata: {
              inputs: []
              type: 'Extension[azure]/HubsExtension/PartType/MarkdownPart'
              settings: {
                content: {
                  settings: {
                    content: '# Responsiveness\r\n'
                  }
                }
              }
            }
          }
          {
            position: {
              x: 11
              y: 1
              rowSpan: 1
              colSpan: 1
            }
            metadata: {
              inputs: [
                {}
                {}
                {}
              ]
              type: 'Extension/AppInsightsExtension/PartType/CuratedBladePerformancePinnedPart'
            }
          }
          {
            position: {
              x: 12
              y: 1
              rowSpan: 1
              colSpan: 3
            }
            metadata: {
              inputs: []
              type: 'Extension[azure]/HubsExtension/PartType/MarkdownPart'
              settings: {
                content: {
                  settings: {
                    content: '# Browser'
                  }
                }
              }
            }
          }
          {
            position: {
              x: 15
              y: 1
              rowSpan: 1
              colSpan: 1
            }
            metadata: {
              inputs: [
                {}
                {}
                {}
                {}
                {}
                {}
              ]
              type: 'Extension/AppInsightsExtension/PartType/MetricsExplorerBladePinnedPart'
            }
          }
          {
            position: {
              x: 0
              y: 2
              rowSpan: 3
              colSpan: 4
            }
            metadata: {
              inputs: [
                {}
                {}
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {}
            }
          }
          {
            position: {
              x: 4
              y: 2
              rowSpan: 3
              colSpan: 4
            }
            metadata: {
              inputs: [
                {}
                {}
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {}
            }
          }
          {
            position: {
              x: 8
              y: 2
              rowSpan: 3
              colSpan: 4
            }
            metadata: {
              inputs: [
                {}
                {}
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {}
            }
          }
          {
            position: {
              x: 12
              y: 2
              rowSpan: 3
              colSpan: 4
            }
            metadata: {
              inputs: [
                {}
                {}
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {}
            }
          }
          {
            position: {
              x: 0
              y: 5
              rowSpan: 3
              colSpan: 4
            }
            metadata: {
              inputs: [
                {}
                {}
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {}
            }
          }
          {
            position: {
              x: 4
              y: 5
              rowSpan: 3
              colSpan: 4
            }
            metadata: {
              inputs: [
                {}
                {}
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {}
            }
          }
          {
            position: {
              x: 8
              y: 5
              rowSpan: 3
              colSpan: 4
            }
            metadata: {
              inputs: [
                {}
                {}
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {}
            }
          }
          {
            position: {
              x: 12
              y: 5
              rowSpan: 3
              colSpan: 4
            }
            metadata: {
              inputs: [
                {}
                {}
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {}
            }
          }
          {
            position: {
              x: 0
              y: 8
              rowSpan: 3
              colSpan: 4
            }
            metadata: {
              inputs: [
                {}
                {}
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {}
            }
          }
          {
            position: {
              x: 4
              y: 8
              rowSpan: 3
              colSpan: 4
            }
            metadata: {
              inputs: [
                {}
                {}
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {}
            }
          }
          {
            position: {
              x: 8
              y: 8
              rowSpan: 3
              colSpan: 4
            }
            metadata: {
              inputs: [
                {}
                {}
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {}
            }
          }
        ]
      }
    ]
  }
}

resource serverfarms_ASP_variamosspla_a699_name_resource 'Microsoft.Web/serverfarms@2021-03-01' = {
  name: serverfarms_ASP_variamosspla_a699_name
  location: 'East US'
  sku: {
    name: 'B2'
    tier: 'Basic'
    size: 'B2'
    family: 'B'
    capacity: 1
  }
  kind: 'linux'
  properties: {
    perSiteScaling: false
    elasticScaleEnabled: false
    maximumElasticWorkerCount: 1
    isSpot: false
    reserved: true
    isXenon: false
    hyperV: false
    targetWorkerCount: 0
    targetWorkerSizeId: 0
    zoneRedundant: false
  }
}

resource flexibleServers_variamos_db_name_application_name 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'application_name'
  properties: {
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_archive_timeout 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'archive_timeout'
  properties: {
    value: '1800'
    source: 'user-override'
  }
}

resource flexibleServers_variamos_db_name_array_nulls 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'array_nulls'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_autovacuum 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'autovacuum'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_autovacuum_analyze_scale_factor 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'autovacuum_analyze_scale_factor'
  properties: {
    value: '0.1'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_autovacuum_analyze_threshold 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'autovacuum_analyze_threshold'
  properties: {
    value: '50'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_autovacuum_freeze_max_age 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'autovacuum_freeze_max_age'
  properties: {
    value: '200000000'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_autovacuum_max_workers 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'autovacuum_max_workers'
  properties: {
    value: '1'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_autovacuum_multixact_freeze_max_age 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'autovacuum_multixact_freeze_max_age'
  properties: {
    value: '400000000'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_autovacuum_naptime 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'autovacuum_naptime'
  properties: {
    value: '60'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_autovacuum_vacuum_cost_delay 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'autovacuum_vacuum_cost_delay'
  properties: {
    value: '2'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_autovacuum_vacuum_cost_limit 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'autovacuum_vacuum_cost_limit'
  properties: {
    value: '-1'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_autovacuum_vacuum_scale_factor 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'autovacuum_vacuum_scale_factor'
  properties: {
    value: '0.2'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_autovacuum_vacuum_threshold 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'autovacuum_vacuum_threshold'
  properties: {
    value: '50'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_autovacuum_work_mem 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'autovacuum_work_mem'
  properties: {
    value: '-1'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_azure_accepted_password_auth_method 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'azure.accepted_password_auth_method'
  properties: {
    value: 'md5'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_azure_enable_temp_tablespaces_on_local_ssd 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'azure.enable_temp_tablespaces_on_local_ssd'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_backend_flush_after 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'backend_flush_after'
  properties: {
    value: '256'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_backslash_quote 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'backslash_quote'
  properties: {
    value: 'safe_encoding'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_bgwriter_delay 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'bgwriter_delay'
  properties: {
    value: '50'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_bgwriter_flush_after 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'bgwriter_flush_after'
  properties: {
    value: '64'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_bgwriter_lru_maxpages 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'bgwriter_lru_maxpages'
  properties: {
    value: '100'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_bgwriter_lru_multiplier 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'bgwriter_lru_multiplier'
  properties: {
    value: '2'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_bytea_output 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'bytea_output'
  properties: {
    value: 'hex'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_check_function_bodies 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'check_function_bodies'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_checkpoint_completion_target 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'checkpoint_completion_target'
  properties: {
    value: '0.9'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_checkpoint_timeout 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'checkpoint_timeout'
  properties: {
    value: '300'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_checkpoint_warning 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'checkpoint_warning'
  properties: {
    value: '30'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_client_encoding 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'client_encoding'
  properties: {
    value: 'sql_ascii'
    source: 'user-override'
  }
}

resource flexibleServers_variamos_db_name_client_min_messages 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'client_min_messages'
  properties: {
    value: 'notice'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_commit_delay 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'commit_delay'
  properties: {
    value: '0'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_commit_siblings 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'commit_siblings'
  properties: {
    value: '5'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_connection_throttle_bucket_limit 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'connection_throttle.bucket_limit'
  properties: {
    value: '2000'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_connection_throttle_enable 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'connection_throttle.enable'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_connection_throttle_factor_bias 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'connection_throttle.factor_bias'
  properties: {
    value: '0.8'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_connection_throttle_hash_entries_max 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'connection_throttle.hash_entries_max'
  properties: {
    value: '500'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_connection_throttle_reset_time 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'connection_throttle.reset_time'
  properties: {
    value: '120'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_connection_throttle_restore_factor 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'connection_throttle.restore_factor'
  properties: {
    value: '2'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_connection_throttle_update_time 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'connection_throttle.update_time'
  properties: {
    value: '20'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_constraint_exclusion 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'constraint_exclusion'
  properties: {
    value: 'partition'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_cpu_index_tuple_cost 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'cpu_index_tuple_cost'
  properties: {
    value: '0.005'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_cpu_operator_cost 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'cpu_operator_cost'
  properties: {
    value: '0.0025'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_cpu_tuple_cost 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'cpu_tuple_cost'
  properties: {
    value: '0.01'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_cron_database_name 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'cron.database_name'
  properties: {
    value: 'VariamosDB'
    source: 'user-override'
  }
}

resource flexibleServers_variamos_db_name_cron_log_run 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'cron.log_run'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_cron_log_statement 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'cron.log_statement'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_cron_max_running_jobs 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'cron.max_running_jobs'
  properties: {
    value: '32'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_cursor_tuple_fraction 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'cursor_tuple_fraction'
  properties: {
    value: '0.1'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_DateStyle 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'DateStyle'
  properties: {
    value: 'ISO, MDY'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_deadlock_timeout 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'deadlock_timeout'
  properties: {
    value: '1000'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_debug_pretty_print 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'debug_pretty_print'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_debug_print_parse 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'debug_print_parse'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_debug_print_plan 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'debug_print_plan'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_debug_print_rewritten 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'debug_print_rewritten'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_default_statistics_target 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'default_statistics_target'
  properties: {
    value: '100'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_default_tablespace 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'default_tablespace'
  properties: {
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_default_text_search_config 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'default_text_search_config'
  properties: {
    value: 'pg_catalog.english'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_default_transaction_deferrable 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'default_transaction_deferrable'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_default_transaction_isolation 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'default_transaction_isolation'
  properties: {
    value: 'read committed'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_default_transaction_read_only 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'default_transaction_read_only'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_default_with_oids 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'default_with_oids'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_effective_cache_size 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'effective_cache_size'
  properties: {
    value: '229376'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_effective_io_concurrency 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'effective_io_concurrency'
  properties: {
    value: '1'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_enable_bitmapscan 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'enable_bitmapscan'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_enable_gathermerge 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'enable_gathermerge'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_enable_hashagg 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'enable_hashagg'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_enable_hashjoin 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'enable_hashjoin'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_enable_indexonlyscan 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'enable_indexonlyscan'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_enable_indexscan 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'enable_indexscan'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_enable_material 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'enable_material'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_enable_mergejoin 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'enable_mergejoin'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_enable_nestloop 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'enable_nestloop'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_enable_partitionwise_aggregate 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'enable_partitionwise_aggregate'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_enable_partitionwise_join 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'enable_partitionwise_join'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_enable_seqscan 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'enable_seqscan'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_enable_sort 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'enable_sort'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_enable_tidscan 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'enable_tidscan'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_escape_string_warning 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'escape_string_warning'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_exit_on_error 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'exit_on_error'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_extra_float_digits 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'extra_float_digits'
  properties: {
    value: '1'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_force_parallel_mode 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'force_parallel_mode'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_from_collapse_limit 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'from_collapse_limit'
  properties: {
    value: '8'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_geqo 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'geqo'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_geqo_effort 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'geqo_effort'
  properties: {
    value: '5'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_geqo_generations 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'geqo_generations'
  properties: {
    value: '0'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_geqo_pool_size 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'geqo_pool_size'
  properties: {
    value: '0'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_geqo_seed 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'geqo_seed'
  properties: {
    value: '0'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_geqo_selection_bias 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'geqo_selection_bias'
  properties: {
    value: '2'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_geqo_threshold 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'geqo_threshold'
  properties: {
    value: '12'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_gin_fuzzy_search_limit 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'gin_fuzzy_search_limit'
  properties: {
    value: '0'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_gin_pending_list_limit 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'gin_pending_list_limit'
  properties: {
    value: '4096'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_huge_pages 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'huge_pages'
  properties: {
    value: 'try'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_idle_in_transaction_session_timeout 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'idle_in_transaction_session_timeout'
  properties: {
    value: '0'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_intelligent_tuning 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'intelligent_tuning'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_intelligent_tuning_metric_targets 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'intelligent_tuning.metric_targets'
  properties: {
    value: 'none'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_IntervalStyle 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'IntervalStyle'
  properties: {
    value: 'postgres'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_jit 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'jit'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_jit_above_cost 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'jit_above_cost'
  properties: {
    value: '100000'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_jit_inline_above_cost 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'jit_inline_above_cost'
  properties: {
    value: '500000'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_jit_optimize_above_cost 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'jit_optimize_above_cost'
  properties: {
    value: '500000'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_join_collapse_limit 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'join_collapse_limit'
  properties: {
    value: '8'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_lc_monetary 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'lc_monetary'
  properties: {
    value: 'en_US.utf-8'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_lc_numeric 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'lc_numeric'
  properties: {
    value: 'en_US.utf-8'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_lo_compat_privileges 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'lo_compat_privileges'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_lock_timeout 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'lock_timeout'
  properties: {
    value: '0'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_log_autovacuum_min_duration 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'log_autovacuum_min_duration'
  properties: {
    value: '-1'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_log_checkpoints 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'log_checkpoints'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_log_connections 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'log_connections'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_log_destination 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'log_destination'
  properties: {
    value: 'stderr'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_log_disconnections 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'log_disconnections'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_log_duration 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'log_duration'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_log_error_verbosity 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'log_error_verbosity'
  properties: {
    value: 'default'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_log_executor_stats 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'log_executor_stats'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_log_line_prefix 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'log_line_prefix'
  properties: {
    value: '%t-%c-'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_log_lock_waits 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'log_lock_waits'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_log_min_duration_statement 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'log_min_duration_statement'
  properties: {
    value: '-1'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_log_min_error_statement 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'log_min_error_statement'
  properties: {
    value: 'error'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_log_min_messages 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'log_min_messages'
  properties: {
    value: 'warning'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_log_replication_commands 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'log_replication_commands'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_log_statement 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'log_statement'
  properties: {
    value: 'none'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_log_statement_stats 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'log_statement_stats'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_log_temp_files 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'log_temp_files'
  properties: {
    value: '-1'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_maintenance_work_mem 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'maintenance_work_mem'
  properties: {
    value: '99328'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_max_connections 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'max_connections'
  properties: {
    value: '50'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_max_locks_per_transaction 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'max_locks_per_transaction'
  properties: {
    value: '64'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_max_logical_replication_workers 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'max_logical_replication_workers'
  properties: {
    value: '4'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_max_parallel_maintenance_workers 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'max_parallel_maintenance_workers'
  properties: {
    value: '64'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_max_parallel_workers 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'max_parallel_workers'
  properties: {
    value: '8'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_max_parallel_workers_per_gather 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'max_parallel_workers_per_gather'
  properties: {
    value: '2'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_max_pred_locks_per_page 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'max_pred_locks_per_page'
  properties: {
    value: '2'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_max_pred_locks_per_relation 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'max_pred_locks_per_relation'
  properties: {
    value: '-2'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_max_prepared_transactions 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'max_prepared_transactions'
  properties: {
    value: '0'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_max_replication_slots 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'max_replication_slots'
  properties: {
    value: '10'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_max_standby_archive_delay 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'max_standby_archive_delay'
  properties: {
    value: '30000'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_max_standby_streaming_delay 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'max_standby_streaming_delay'
  properties: {
    value: '30000'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_max_sync_workers_per_subscription 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'max_sync_workers_per_subscription'
  properties: {
    value: '2'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_max_wal_senders 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'max_wal_senders'
  properties: {
    value: '10'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_max_wal_size 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'max_wal_size'
  properties: {
    value: '1024'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_max_worker_processes 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'max_worker_processes'
  properties: {
    value: '8'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_min_parallel_index_scan_size 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'min_parallel_index_scan_size'
  properties: {
    value: '64'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_min_parallel_table_scan_size 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'min_parallel_table_scan_size'
  properties: {
    value: '1024'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_min_wal_size 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'min_wal_size'
  properties: {
    value: '80'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_operator_precedence_warning 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'operator_precedence_warning'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_parallel_setup_cost 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'parallel_setup_cost'
  properties: {
    value: '1000'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_parallel_tuple_cost 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'parallel_tuple_cost'
  properties: {
    value: '0.1'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_password_encryption 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'password_encryption'
  properties: {
    value: 'md5'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pg_partman_bgw_analyze 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pg_partman_bgw.analyze'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pg_partman_bgw_dbname 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pg_partman_bgw.dbname'
  properties: {
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pg_partman_bgw_interval 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pg_partman_bgw.interval'
  properties: {
    value: '3600'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pg_partman_bgw_jobmon 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pg_partman_bgw.jobmon'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pg_partman_bgw_role 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pg_partman_bgw.role'
  properties: {
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pg_qs_index_generation_interval 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pg_qs.index_generation_interval'
  properties: {
    value: '15'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pg_qs_interval_length_minutes 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pg_qs.interval_length_minutes'
  properties: {
    value: '15'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pg_qs_max_plan_size 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pg_qs.max_plan_size'
  properties: {
    value: '7500'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pg_qs_query_capture_mode 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pg_qs.query_capture_mode'
  properties: {
    value: 'none'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pg_qs_retention_period_in_days 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pg_qs.retention_period_in_days'
  properties: {
    value: '7'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pg_qs_store_query_plans 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pg_qs.store_query_plans'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pg_qs_track_utility 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pg_qs.track_utility'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pg_stat_statements_max 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pg_stat_statements.max'
  properties: {
    value: '5000'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pg_stat_statements_save 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pg_stat_statements.save'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pg_stat_statements_track 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pg_stat_statements.track'
  properties: {
    value: 'top'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pg_stat_statements_track_utility 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pg_stat_statements.track_utility'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pgaudit_log 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pgaudit.log'
  properties: {
    value: 'none'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pgaudit_log_catalog 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pgaudit.log_catalog'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pgaudit_log_client 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pgaudit.log_client'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pgaudit_log_level 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pgaudit.log_level'
  properties: {
    value: 'log'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pgaudit_log_parameter 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pgaudit.log_parameter'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pgaudit_log_relation 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pgaudit.log_relation'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pgaudit_log_statement_once 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pgaudit.log_statement_once'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pgaudit_role 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pgaudit.role'
  properties: {
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pglogical_batch_inserts 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pglogical.batch_inserts'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pglogical_conflict_log_level 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pglogical.conflict_log_level'
  properties: {
    value: 'log'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pglogical_conflict_resolution 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pglogical.conflict_resolution'
  properties: {
    value: 'apply_remote'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pglogical_use_spi 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pglogical.use_spi'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pgms_wait_sampling_history_period 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pgms_wait_sampling.history_period'
  properties: {
    value: '100'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_pgms_wait_sampling_query_capture_mode 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'pgms_wait_sampling.query_capture_mode'
  properties: {
    value: 'none'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_postgis_gdal_enabled_drivers 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'postgis.gdal_enabled_drivers'
  properties: {
    value: 'DISABLE_ALL'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_quote_all_identifiers 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'quote_all_identifiers'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_random_page_cost 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'random_page_cost'
  properties: {
    value: '2'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_require_secure_transport 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'require_secure_transport'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_row_security 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'row_security'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_search_path 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'search_path'
  properties: {
    value: '"$user", public'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_seq_page_cost 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'seq_page_cost'
  properties: {
    value: '1'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_session_replication_role 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'session_replication_role'
  properties: {
    value: 'origin'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_shared_buffers 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'shared_buffers'
  properties: {
    value: '32768'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_shared_preload_libraries 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'shared_preload_libraries'
  properties: {
    value: 'pg_cron,pg_stat_statements'
    source: 'user-override'
  }
}

resource flexibleServers_variamos_db_name_ssl_max_protocol_version 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'ssl_max_protocol_version'
  properties: {
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_ssl_min_protocol_version 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'ssl_min_protocol_version'
  properties: {
    value: 'TLSv1.2'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_standard_conforming_strings 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'standard_conforming_strings'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_statement_timeout 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'statement_timeout'
  properties: {
    value: '0'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_synchronize_seqscans 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'synchronize_seqscans'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_synchronous_commit 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'synchronous_commit'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_tcp_keepalives_count 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'tcp_keepalives_count'
  properties: {
    value: '9'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_tcp_keepalives_idle 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'tcp_keepalives_idle'
  properties: {
    value: '120'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_tcp_keepalives_interval 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'tcp_keepalives_interval'
  properties: {
    value: '30'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_temp_buffers 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'temp_buffers'
  properties: {
    value: '1024'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_temp_tablespaces 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'temp_tablespaces'
  properties: {
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_TimeZone 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'TimeZone'
  properties: {
    value: 'UTC'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_track_activities 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'track_activities'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_track_activity_query_size 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'track_activity_query_size'
  properties: {
    value: '1024'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_track_commit_timestamp 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'track_commit_timestamp'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_track_counts 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'track_counts'
  properties: {
    value: 'on'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_track_functions 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'track_functions'
  properties: {
    value: 'none'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_track_io_timing 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'track_io_timing'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_transform_null_equals 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'transform_null_equals'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_vacuum_cost_delay 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'vacuum_cost_delay'
  properties: {
    value: '0'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_vacuum_cost_limit 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'vacuum_cost_limit'
  properties: {
    value: '200'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_vacuum_cost_page_dirty 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'vacuum_cost_page_dirty'
  properties: {
    value: '20'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_vacuum_cost_page_hit 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'vacuum_cost_page_hit'
  properties: {
    value: '1'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_vacuum_cost_page_miss 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'vacuum_cost_page_miss'
  properties: {
    value: '10'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_vacuum_defer_cleanup_age 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'vacuum_defer_cleanup_age'
  properties: {
    value: '0'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_vacuum_freeze_min_age 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'vacuum_freeze_min_age'
  properties: {
    value: '50000000'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_vacuum_freeze_table_age 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'vacuum_freeze_table_age'
  properties: {
    value: '150000000'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_vacuum_multixact_freeze_min_age 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'vacuum_multixact_freeze_min_age'
  properties: {
    value: '5000000'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_vacuum_multixact_freeze_table_age 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'vacuum_multixact_freeze_table_age'
  properties: {
    value: '150000000'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_wal_buffers 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'wal_buffers'
  properties: {
    value: '2048'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_wal_compression 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'wal_compression'
  properties: {
    value: 'off'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_wal_level 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'wal_level'
  properties: {
    value: 'replica'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_wal_receiver_status_interval 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'wal_receiver_status_interval'
  properties: {
    value: '10'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_wal_writer_delay 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'wal_writer_delay'
  properties: {
    value: '200'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_wal_writer_flush_after 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'wal_writer_flush_after'
  properties: {
    value: '128'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_work_mem 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'work_mem'
  properties: {
    value: '4096'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_xmlbinary 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'xmlbinary'
  properties: {
    value: 'base64'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_xmloption 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'xmloption'
  properties: {
    value: 'content'
    source: 'system-default'
  }
}

resource flexibleServers_variamos_db_name_azure_maintenance 'Microsoft.DBforPostgreSQL/flexibleServers/databases@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'azure_maintenance'
  properties: {
    charset: 'UTF8'
    collation: 'en_US.utf8'
  }
}

resource flexibleServers_variamos_db_name_azure_sys 'Microsoft.DBforPostgreSQL/flexibleServers/databases@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'azure_sys'
  properties: {
    charset: 'UTF8'
    collation: 'en_US.utf8'
  }
}

resource flexibleServers_variamos_db_name_postgres 'Microsoft.DBforPostgreSQL/flexibleServers/databases@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'postgres'
  properties: {
    charset: 'UTF8'
    collation: 'en_US.utf8'
  }
}

resource flexibleServers_variamos_db_name_VariamosDB 'Microsoft.DBforPostgreSQL/flexibleServers/databases@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'VariamosDB'
  properties: {
    charset: 'UTF8'
    collation: 'en_US.utf8'
  }
}

resource flexibleServers_variamos_db_name_AllowAll_2021_6_21_22_16_39 'Microsoft.DBforPostgreSQL/flexibleServers/firewallRules@2021-06-01' = {
  parent: flexibleServers_variamos_db_name_resource
  name: 'AllowAll_2021-6-21_22-16-39'
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '255.255.255.255'
  }
}

resource components_insights_variamos_name_degradationindependencyduration 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_insights_variamos_name_resource
  name: 'degradationindependencyduration'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'degradationindependencyduration'
      DisplayName: 'Degradation in dependency duration'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_variamos_ms_apireference_name_degradationindependencyduration 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_variamos_ms_apireference_name_resource
  name: 'degradationindependencyduration'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'degradationindependencyduration'
      DisplayName: 'Degradation in dependency duration'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_insights_variamos_name_degradationinserverresponsetime 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_insights_variamos_name_resource
  name: 'degradationinserverresponsetime'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'degradationinserverresponsetime'
      DisplayName: 'Degradation in server response time'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_variamos_ms_apireference_name_degradationinserverresponsetime 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_variamos_ms_apireference_name_resource
  name: 'degradationinserverresponsetime'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'degradationinserverresponsetime'
      DisplayName: 'Degradation in server response time'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_insights_variamos_name_digestMailConfiguration 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_insights_variamos_name_resource
  name: 'digestMailConfiguration'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'digestMailConfiguration'
      DisplayName: 'Digest Mail Configuration'
      Description: 'This rule describes the digest mail preferences'
      HelpUrl: 'www.homail.com'
      IsHidden: true
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_variamos_ms_apireference_name_digestMailConfiguration 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_variamos_ms_apireference_name_resource
  name: 'digestMailConfiguration'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'digestMailConfiguration'
      DisplayName: 'Digest Mail Configuration'
      Description: 'This rule describes the digest mail preferences'
      HelpUrl: 'www.homail.com'
      IsHidden: true
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_insights_variamos_name_extension_billingdatavolumedailyspikeextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_insights_variamos_name_resource
  name: 'extension_billingdatavolumedailyspikeextension'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'extension_billingdatavolumedailyspikeextension'
      DisplayName: 'Abnormal rise in daily data volume (preview)'
      Description: 'This detection rule automatically analyzes the billing data generated by your application, and can warn you about an unusual increase in your application\'s billing costs'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/tree/master/SmartDetection/billing-data-volume-daily-spike.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_variamos_ms_apireference_name_extension_billingdatavolumedailyspikeextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_variamos_ms_apireference_name_resource
  name: 'extension_billingdatavolumedailyspikeextension'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'extension_billingdatavolumedailyspikeextension'
      DisplayName: 'Abnormal rise in daily data volume (preview)'
      Description: 'This detection rule automatically analyzes the billing data generated by your application, and can warn you about an unusual increase in your application\'s billing costs'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/tree/master/SmartDetection/billing-data-volume-daily-spike.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_insights_variamos_name_extension_canaryextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_insights_variamos_name_resource
  name: 'extension_canaryextension'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'extension_canaryextension'
      DisplayName: 'Canary extension'
      Description: 'Canary extension'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/'
      IsHidden: true
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_variamos_ms_apireference_name_extension_canaryextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_variamos_ms_apireference_name_resource
  name: 'extension_canaryextension'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'extension_canaryextension'
      DisplayName: 'Canary extension'
      Description: 'Canary extension'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/'
      IsHidden: true
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_insights_variamos_name_extension_exceptionchangeextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_insights_variamos_name_resource
  name: 'extension_exceptionchangeextension'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'extension_exceptionchangeextension'
      DisplayName: 'Abnormal rise in exception volume (preview)'
      Description: 'This detection rule automatically analyzes the exceptions thrown in your application, and can warn you about unusual patterns in your exception telemetry.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/abnormal-rise-in-exception-volume.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_variamos_ms_apireference_name_extension_exceptionchangeextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_variamos_ms_apireference_name_resource
  name: 'extension_exceptionchangeextension'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'extension_exceptionchangeextension'
      DisplayName: 'Abnormal rise in exception volume (preview)'
      Description: 'This detection rule automatically analyzes the exceptions thrown in your application, and can warn you about unusual patterns in your exception telemetry.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/abnormal-rise-in-exception-volume.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_insights_variamos_name_extension_memoryleakextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_insights_variamos_name_resource
  name: 'extension_memoryleakextension'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'extension_memoryleakextension'
      DisplayName: 'Potential memory leak detected (preview)'
      Description: 'This detection rule automatically analyzes the memory consumption of each process in your application, and can warn you about potential memory leaks or increased memory consumption.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/tree/master/SmartDetection/memory-leak.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_variamos_ms_apireference_name_extension_memoryleakextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_variamos_ms_apireference_name_resource
  name: 'extension_memoryleakextension'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'extension_memoryleakextension'
      DisplayName: 'Potential memory leak detected (preview)'
      Description: 'This detection rule automatically analyzes the memory consumption of each process in your application, and can warn you about potential memory leaks or increased memory consumption.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/tree/master/SmartDetection/memory-leak.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_insights_variamos_name_extension_securityextensionspackage 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_insights_variamos_name_resource
  name: 'extension_securityextensionspackage'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'extension_securityextensionspackage'
      DisplayName: 'Potential security issue detected (preview)'
      Description: 'This detection rule automatically analyzes the telemetry generated by your application and detects potential security issues.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/application-security-detection-pack.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_variamos_ms_apireference_name_extension_securityextensionspackage 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_variamos_ms_apireference_name_resource
  name: 'extension_securityextensionspackage'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'extension_securityextensionspackage'
      DisplayName: 'Potential security issue detected (preview)'
      Description: 'This detection rule automatically analyzes the telemetry generated by your application and detects potential security issues.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/application-security-detection-pack.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_insights_variamos_name_extension_traceseveritydetector 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_insights_variamos_name_resource
  name: 'extension_traceseveritydetector'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'extension_traceseveritydetector'
      DisplayName: 'Degradation in trace severity ratio (preview)'
      Description: 'This detection rule automatically analyzes the trace logs emitted from your application, and can warn you about unusual patterns in the severity of your trace telemetry.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/degradation-in-trace-severity-ratio.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_variamos_ms_apireference_name_extension_traceseveritydetector 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_variamos_ms_apireference_name_resource
  name: 'extension_traceseveritydetector'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'extension_traceseveritydetector'
      DisplayName: 'Degradation in trace severity ratio (preview)'
      Description: 'This detection rule automatically analyzes the trace logs emitted from your application, and can warn you about unusual patterns in the severity of your trace telemetry.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/degradation-in-trace-severity-ratio.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_insights_variamos_name_longdependencyduration 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_insights_variamos_name_resource
  name: 'longdependencyduration'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'longdependencyduration'
      DisplayName: 'Long dependency duration'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_variamos_ms_apireference_name_longdependencyduration 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_variamos_ms_apireference_name_resource
  name: 'longdependencyduration'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'longdependencyduration'
      DisplayName: 'Long dependency duration'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_insights_variamos_name_migrationToAlertRulesCompleted 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_insights_variamos_name_resource
  name: 'migrationToAlertRulesCompleted'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'migrationToAlertRulesCompleted'
      DisplayName: 'Migration To Alert Rules Completed'
      Description: 'A configuration that controls the migration state of Smart Detection to Smart Alerts'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: true
      IsEnabledByDefault: false
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: false
    CustomEmails: []
  }
}

resource components_variamos_ms_apireference_name_migrationToAlertRulesCompleted 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_variamos_ms_apireference_name_resource
  name: 'migrationToAlertRulesCompleted'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'migrationToAlertRulesCompleted'
      DisplayName: 'Migration To Alert Rules Completed'
      Description: 'A configuration that controls the migration state of Smart Detection to Smart Alerts'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: true
      IsEnabledByDefault: false
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: false
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_insights_variamos_name_slowpageloadtime 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_insights_variamos_name_resource
  name: 'slowpageloadtime'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'slowpageloadtime'
      DisplayName: 'Slow page load time'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_variamos_ms_apireference_name_slowpageloadtime 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_variamos_ms_apireference_name_resource
  name: 'slowpageloadtime'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'slowpageloadtime'
      DisplayName: 'Slow page load time'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_insights_variamos_name_slowserverresponsetime 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_insights_variamos_name_resource
  name: 'slowserverresponsetime'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'slowserverresponsetime'
      DisplayName: 'Slow server response time'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_variamos_ms_apireference_name_slowserverresponsetime 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_variamos_ms_apireference_name_resource
  name: 'slowserverresponsetime'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'slowserverresponsetime'
      DisplayName: 'Slow server response time'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource sites_VariaMos_name_resource 'Microsoft.Web/sites@2021-03-01' = {
  name: sites_VariaMos_name
  location: 'East US'
  kind: 'app,linux,container'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: 'variamos.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: 'variamos.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_ASP_variamosspla_a699_name_resource.id
    reserved: true
    isXenon: false
    hyperV: false
    siteConfig: {
      numberOfWorkers: 1
      linuxFxVersion: 'DOCKER|index.docker.io/magudeloz/variamos:cfcf8c8fc870713e2faffc8ce3e925d0f0ffe099'
      acrUseManagedIdentityCreds: false
      alwaysOn: false
      http20Enabled: false
      functionAppScaleLimit: 0
      minimumElasticInstanceCount: 0
    }
    scmSiteAlsoStopped: false
    clientAffinityEnabled: false
    clientCertEnabled: false
    clientCertMode: 'Required'
    hostNamesDisabled: false
    customDomainVerificationId: 'D1C4D5A27662E15790B9693D91CBB47D6CED37E0FACCF80C72C6F39DB2D5DEEE'
    containerSize: 0
    dailyMemoryTimeQuota: 0
    httpsOnly: false
    redundancyMode: 'None'
    storageAccountRequired: false
    keyVaultReferenceIdentity: 'SystemAssigned'
  }
}

resource sites_variamos_ms_apireference_name_resource 'Microsoft.Web/sites@2021-03-01' = {
  name: sites_variamos_ms_apireference_name
  location: 'East US'
  kind: 'app,linux,container'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: '${sites_variamos_ms_apireference_name}.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: '${sites_variamos_ms_apireference_name}.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_ASP_variamosspla_a699_name_resource.id
    reserved: true
    isXenon: false
    hyperV: false
    siteConfig: {
      numberOfWorkers: 1
      linuxFxVersion: 'DOCKER|variamos.azurecr.io/variamos/${sites_variamos_ms_apireference_name}:e4c266cdcf468b4e1e079459d8473c87698934a7'
      acrUseManagedIdentityCreds: false
      alwaysOn: false
      http20Enabled: false
      functionAppScaleLimit: 0
      minimumElasticInstanceCount: 1
    }
    scmSiteAlsoStopped: false
    clientAffinityEnabled: false
    clientCertEnabled: false
    clientCertMode: 'Required'
    hostNamesDisabled: false
    customDomainVerificationId: 'D1C4D5A27662E15790B9693D91CBB47D6CED37E0FACCF80C72C6F39DB2D5DEEE'
    containerSize: 0
    dailyMemoryTimeQuota: 0
    httpsOnly: false
    redundancyMode: 'None'
    storageAccountRequired: false
    keyVaultReferenceIdentity: 'SystemAssigned'
  }
}

resource sites_variamos_ms_languages_name_resource 'Microsoft.Web/sites@2021-03-01' = {
  name: sites_variamos_ms_languages_name
  location: 'East US'
  kind: 'app,linux,container'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: '${sites_variamos_ms_languages_name}.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: '${sites_variamos_ms_languages_name}.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_ASP_variamosspla_a699_name_resource.id
    reserved: true
    isXenon: false
    hyperV: false
    siteConfig: {
      numberOfWorkers: 1
      linuxFxVersion: 'DOCKER|index.docker.io/magudeloz/variamos_ms_languages:3af48ce6f66d9ed7321edfac5a99ebdf22284b3b'
      acrUseManagedIdentityCreds: false
      alwaysOn: false
      http20Enabled: false
      functionAppScaleLimit: 0
      minimumElasticInstanceCount: 1
    }
    scmSiteAlsoStopped: false
    clientAffinityEnabled: false
    clientCertEnabled: false
    clientCertMode: 'Required'
    hostNamesDisabled: false
    customDomainVerificationId: 'D1C4D5A27662E15790B9693D91CBB47D6CED37E0FACCF80C72C6F39DB2D5DEEE'
    containerSize: 0
    dailyMemoryTimeQuota: 0
    httpsOnly: false
    redundancyMode: 'None'
    storageAccountRequired: false
    keyVaultReferenceIdentity: 'SystemAssigned'
  }
}

resource sites_variamos_ms_restrictions_name_resource 'Microsoft.Web/sites@2021-03-01' = {
  name: sites_variamos_ms_restrictions_name
  location: 'East US'
  kind: 'app,linux,container'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: '${sites_variamos_ms_restrictions_name}.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: '${sites_variamos_ms_restrictions_name}.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_ASP_variamosspla_a699_name_resource.id
    reserved: true
    isXenon: false
    hyperV: false
    siteConfig: {
      numberOfWorkers: 1
      linuxFxVersion: 'DOCKER|variamos.azurecr.io/variamos/variamos_ms_restrictions:1bc696b3d3f302cb8c5f50b0456629664fba217c'
      acrUseManagedIdentityCreds: false
      alwaysOn: false
      http20Enabled: false
      functionAppScaleLimit: 0
      minimumElasticInstanceCount: 1
    }
    scmSiteAlsoStopped: false
    clientAffinityEnabled: false
    clientCertEnabled: false
    clientCertMode: 'Required'
    hostNamesDisabled: false
    customDomainVerificationId: 'D1C4D5A27662E15790B9693D91CBB47D6CED37E0FACCF80C72C6F39DB2D5DEEE'
    containerSize: 0
    dailyMemoryTimeQuota: 0
    httpsOnly: false
    redundancyMode: 'None'
    storageAccountRequired: false
    keyVaultReferenceIdentity: 'SystemAssigned'
  }
}

resource sites_VariaMos_name_ftp 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2021-03-01' = {
  parent: sites_VariaMos_name_resource
  name: 'ftp'
  location: 'East US'
  properties: {
    allow: true
  }
}

resource sites_variamos_ms_apireference_name_ftp 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2021-03-01' = {
  parent: sites_variamos_ms_apireference_name_resource
  name: 'ftp'
  location: 'East US'
  properties: {
    allow: true
  }
}

resource sites_variamos_ms_languages_name_ftp 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2021-03-01' = {
  parent: sites_variamos_ms_languages_name_resource
  name: 'ftp'
  location: 'East US'
  properties: {
    allow: true
  }
}

resource sites_variamos_ms_restrictions_name_ftp 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2021-03-01' = {
  parent: sites_variamos_ms_restrictions_name_resource
  name: 'ftp'
  location: 'East US'
  properties: {
    allow: true
  }
}

resource sites_VariaMos_name_scm 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2021-03-01' = {
  parent: sites_VariaMos_name_resource
  name: 'scm'
  location: 'East US'
  properties: {
    allow: true
  }
}

resource sites_variamos_ms_apireference_name_scm 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2021-03-01' = {
  parent: sites_variamos_ms_apireference_name_resource
  name: 'scm'
  location: 'East US'
  properties: {
    allow: true
  }
}

resource sites_variamos_ms_languages_name_scm 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2021-03-01' = {
  parent: sites_variamos_ms_languages_name_resource
  name: 'scm'
  location: 'East US'
  properties: {
    allow: true
  }
}

resource sites_variamos_ms_restrictions_name_scm 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2021-03-01' = {
  parent: sites_variamos_ms_restrictions_name_resource
  name: 'scm'
  location: 'East US'
  properties: {
    allow: true
  }
}

resource sites_VariaMos_name_web 'Microsoft.Web/sites/config@2021-03-01' = {
  parent: sites_VariaMos_name_resource
  name: 'web'
  location: 'East US'
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
      'hostingstart.html'
    ]
    netFrameworkVersion: 'v4.0'
    linuxFxVersion: 'DOCKER|index.docker.io/magudeloz/variamos:cfcf8c8fc870713e2faffc8ce3e925d0f0ffe099'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    remoteDebuggingVersion: 'VS2019'
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: '$VariaMos'
    scmType: 'GitHubAction'
    use32BitWorkerProcess: true
    webSocketsEnabled: false
    alwaysOn: false
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: false
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetRouteAllEnabled: false
    vnetPrivatePortsCount: 0
    localMySqlEnabled: false
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 1
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 1
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: false
    minTlsVersion: '1.2'
    scmMinTlsVersion: '1.0'
    ftpsState: 'AllAllowed'
    preWarmedInstanceCount: 0
    functionAppScaleLimit: 0
    functionsRuntimeScaleMonitoringEnabled: false
    minimumElasticInstanceCount: 0
    azureStorageAccounts: {}
  }
}

resource sites_variamos_ms_apireference_name_web 'Microsoft.Web/sites/config@2021-03-01' = {
  parent: sites_variamos_ms_apireference_name_resource
  name: 'web'
  location: 'East US'
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
      'hostingstart.html'
    ]
    netFrameworkVersion: 'v4.0'
    linuxFxVersion: 'DOCKER|variamos.azurecr.io/variamos/variamos-ms-apireference:e4c266cdcf468b4e1e079459d8473c87698934a7'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    remoteDebuggingVersion: 'VS2019'
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: '$variamos-ms-apireference'
    scmType: 'GitHubAction'
    use32BitWorkerProcess: true
    webSocketsEnabled: false
    alwaysOn: false
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: false
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetRouteAllEnabled: false
    vnetPrivatePortsCount: 0
    localMySqlEnabled: false
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 1
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 1
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: false
    minTlsVersion: '1.2'
    scmMinTlsVersion: '1.0'
    ftpsState: 'AllAllowed'
    preWarmedInstanceCount: 0
    functionAppScaleLimit: 0
    functionsRuntimeScaleMonitoringEnabled: false
    minimumElasticInstanceCount: 1
    azureStorageAccounts: {}
  }
}

resource sites_variamos_ms_languages_name_web 'Microsoft.Web/sites/config@2021-03-01' = {
  parent: sites_variamos_ms_languages_name_resource
  name: 'web'
  location: 'East US'
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
      'hostingstart.html'
    ]
    netFrameworkVersion: 'v4.0'
    linuxFxVersion: 'DOCKER|index.docker.io/magudeloz/variamos_ms_languages:3af48ce6f66d9ed7321edfac5a99ebdf22284b3b'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    remoteDebuggingVersion: 'VS2019'
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: '$variamos-ms-languages'
    scmType: 'GitHubAction'
    use32BitWorkerProcess: true
    webSocketsEnabled: false
    alwaysOn: false
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: false
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetRouteAllEnabled: false
    vnetPrivatePortsCount: 0
    localMySqlEnabled: false
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 1
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 1
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: false
    minTlsVersion: '1.2'
    scmMinTlsVersion: '1.0'
    ftpsState: 'AllAllowed'
    preWarmedInstanceCount: 0
    functionAppScaleLimit: 0
    functionsRuntimeScaleMonitoringEnabled: false
    minimumElasticInstanceCount: 1
    azureStorageAccounts: {}
  }
}

resource sites_variamos_ms_restrictions_name_web 'Microsoft.Web/sites/config@2021-03-01' = {
  parent: sites_variamos_ms_restrictions_name_resource
  name: 'web'
  location: 'East US'
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
      'hostingstart.html'
    ]
    netFrameworkVersion: 'v4.0'
    linuxFxVersion: 'DOCKER|variamos.azurecr.io/variamos/variamos_ms_restrictions:1bc696b3d3f302cb8c5f50b0456629664fba217c'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    remoteDebuggingVersion: 'VS2019'
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: '$variamos-ms-restrictions'
    scmType: 'GitHubAction'
    use32BitWorkerProcess: true
    webSocketsEnabled: false
    alwaysOn: false
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: false
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetRouteAllEnabled: false
    vnetPrivatePortsCount: 0
    localMySqlEnabled: false
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 1
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 1
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: false
    minTlsVersion: '1.2'
    scmMinTlsVersion: '1.0'
    ftpsState: 'AllAllowed'
    preWarmedInstanceCount: 0
    functionAppScaleLimit: 0
    functionsRuntimeScaleMonitoringEnabled: false
    minimumElasticInstanceCount: 1
    azureStorageAccounts: {}
  }
}

resource sites_VariaMos_name_sites_VariaMos_name_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2021-03-01' = {
  parent: sites_VariaMos_name_resource
  name: '${sites_VariaMos_name}.azurewebsites.net'
  location: 'East US'
  properties: {
    siteName: 'VariaMos'
    hostNameType: 'Verified'
  }
}

resource sites_variamos_ms_apireference_name_sites_variamos_ms_apireference_name_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2021-03-01' = {
  parent: sites_variamos_ms_apireference_name_resource
  name: '${sites_variamos_ms_apireference_name}.azurewebsites.net'
  location: 'East US'
  properties: {
    siteName: 'variamos-ms-apireference'
    hostNameType: 'Verified'
  }
}

resource sites_variamos_ms_languages_name_sites_variamos_ms_languages_name_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2021-03-01' = {
  parent: sites_variamos_ms_languages_name_resource
  name: '${sites_variamos_ms_languages_name}.azurewebsites.net'
  location: 'East US'
  properties: {
    siteName: 'variamos-ms-languages'
    hostNameType: 'Verified'
  }
}

resource sites_variamos_ms_restrictions_name_sites_variamos_ms_restrictions_name_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2021-03-01' = {
  parent: sites_variamos_ms_restrictions_name_resource
  name: '${sites_variamos_ms_restrictions_name}.azurewebsites.net'
  location: 'East US'
  properties: {
    siteName: 'variamos-ms-restrictions'
    hostNameType: 'Verified'
  }
}

resource smartdetectoralertrules_dependency_latency_degradation_insights_variamos_name_resource 'microsoft.alertsmanagement/smartdetectoralertrules@2021-04-01' = {
  name: smartdetectoralertrules_dependency_latency_degradation_insights_variamos_name
  location: 'global'
  properties: {
    description: 'Dependency Latency Degradation notifies you of an unusual increase in response by a dependency your app is calling (e.g. REST API or database)'
    state: 'Enabled'
    severity: 'Sev3'
    frequency: 'P1D'
    detector: {
      id: 'DependencyPerformanceDegradationDetector'
    }
    scope: [
      components_insights_variamos_name_resource.id
    ]
    actionGroups: {
      groupIds: [
        actionGroups_Application_Insights_Smart_Detection_name_resource.id
      ]
    }
  }
}

resource smartdetectoralertrules_exception_anomalies_insights_variamos_name_resource 'microsoft.alertsmanagement/smartdetectoralertrules@2021-04-01' = {
  name: smartdetectoralertrules_exception_anomalies_insights_variamos_name
  location: 'global'
  properties: {
    description: 'Exception Anomalies notifies you of an unusual rise in the rate of exceptions thrown by your app.'
    state: 'Enabled'
    severity: 'Sev3'
    frequency: 'P1D'
    detector: {
      id: 'ExceptionVolumeChangedDetector'
    }
    scope: [
      components_insights_variamos_name_resource.id
    ]
    actionGroups: {
      groupIds: [
        actionGroups_Application_Insights_Smart_Detection_name_resource.id
      ]
    }
  }
}

resource smartdetectoralertrules_failure_anomalies_insights_variamos_name_resource 'microsoft.alertsmanagement/smartdetectoralertrules@2021-04-01' = {
  name: smartdetectoralertrules_failure_anomalies_insights_variamos_name
  location: 'global'
  properties: {
    description: 'Failure Anomalies notifies you of an unusual rise in the rate of failed HTTP requests or dependency calls.'
    state: 'Enabled'
    severity: 'Sev3'
    frequency: 'PT1M'
    detector: {
      id: 'FailureAnomaliesDetector'
    }
    scope: [
      components_insights_variamos_name_resource.id
    ]
    actionGroups: {
      groupIds: [
        actionGroups_Application_Insights_Smart_Detection_name_resource.id
      ]
    }
  }
}

resource smartdetectoralertrules_failure_anomalies_variamos_ms_apireference_name_resource 'microsoft.alertsmanagement/smartdetectoralertrules@2021-04-01' = {
  name: smartdetectoralertrules_failure_anomalies_variamos_ms_apireference_name
  location: 'global'
  properties: {
    description: 'Failure Anomalies notifies you of an unusual rise in the rate of failed HTTP requests or dependency calls.'
    state: 'Enabled'
    severity: 'Sev3'
    frequency: 'PT1M'
    detector: {
      id: 'FailureAnomaliesDetector'
    }
    scope: [
      components_variamos_ms_apireference_name_resource.id
    ]
    actionGroups: {
      groupIds: [
        actionGroups_Application_Insights_Smart_Detection_name_resource.id
      ]
    }
  }
}

resource smartdetectoralertrules_potential_memory_leak_insights_variamos_name_resource 'microsoft.alertsmanagement/smartdetectoralertrules@2021-04-01' = {
  name: smartdetectoralertrules_potential_memory_leak_insights_variamos_name
  location: 'global'
  properties: {
    description: 'Potential Memory Leak notifies you of increased memory consumption pattern by your app which may indicate a potential memory leak.'
    state: 'Enabled'
    severity: 'Sev3'
    frequency: 'P1D'
    detector: {
      id: 'MemoryLeakDetector'
    }
    scope: [
      components_insights_variamos_name_resource.id
    ]
    actionGroups: {
      groupIds: [
        actionGroups_Application_Insights_Smart_Detection_name_resource.id
      ]
    }
  }
}

resource smartdetectoralertrules_response_latency_degradation_insights_variamos_name_resource 'microsoft.alertsmanagement/smartdetectoralertrules@2021-04-01' = {
  name: smartdetectoralertrules_response_latency_degradation_insights_variamos_name
  location: 'global'
  properties: {
    description: 'Response Latency Degradation notifies you of an unusual increase in latency in your app response to requests.'
    state: 'Enabled'
    severity: 'Sev3'
    frequency: 'P1D'
    detector: {
      id: 'RequestPerformanceDegradationDetector'
    }
    scope: [
      components_insights_variamos_name_resource.id
    ]
    actionGroups: {
      groupIds: [
        actionGroups_Application_Insights_Smart_Detection_name_resource.id
      ]
    }
  }
}

resource smartdetectoralertrules_trace_severity_degradation_insights_variamos_name_resource 'microsoft.alertsmanagement/smartdetectoralertrules@2021-04-01' = {
  name: smartdetectoralertrules_trace_severity_degradation_insights_variamos_name
  location: 'global'
  properties: {
    description: 'Trace Severity Degradation notifies you of an unusual increase in the severity of the traces generated by your app.'
    state: 'Enabled'
    severity: 'Sev3'
    frequency: 'P1D'
    detector: {
      id: 'TraceSeverityDetector'
    }
    scope: [
      components_insights_variamos_name_resource.id
    ]
    actionGroups: {
      groupIds: [
        actionGroups_Application_Insights_Smart_Detection_name_resource.id
      ]
    }
  }
}