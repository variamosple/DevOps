param sites_VariaMos_name string = 'VariaMos'
param sites_variamos_ms_languages_name string = 'variamos-ms-languages'
param sites_variamos_ms_apireference_name string = 'variamos-ms-apireference'
param sites_variamos_ms_restrictions_name string = 'variamos-ms-restrictions'
param registries_variamos_name string = 'variamos'
param serverfarms_ASP_variamosspla_a699_name string = 'ASP-variamosspla-a699'
param flexibleServers_variamos_db_name string = 'variamos-db'
param containerGroups_variamosweb_name string = 'variamosweb'

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

resource sites_VariaMos_name_0611efd5cc712c25da2c01eb36d2e144a73048ae1644265406542 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_VariaMos_name_resource
  name: '0611efd5cc712c25da2c01eb36d2e144a73048ae1644265406542'
  location: 'East US'
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"0611efd5cc712c25da2c01eb36d2e144a73048ae","repoName":"mauroagudeloz/VariaMosPLE","slotName":"production"}'
    start_time: '2022-02-07T20:23:30.1835237Z'
    end_time: '2022-02-07T20:23:30.1835237Z'
    active: false
  }
}

resource sites_variamos_ms_languages_name_18b2650af3ecc4a25b8682af423d4208998a5a021626818534649 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_variamos_ms_languages_name_resource
  name: '18b2650af3ecc4a25b8682af423d4208998a5a021626818534649'
  location: 'East US'
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"18b2650af3ecc4a25b8682af423d4208998a5a02","repoName":"mauroagudeloz/variamos_ms_languages","slotName":"production"}'
    start_time: '2021-07-20T22:02:15.0894994Z'
    end_time: '2021-07-20T22:02:15.0894994Z'
    active: false
  }
}

resource sites_variamos_ms_restrictions_name_1bc696b3d3f302cb8c5f50b0456629664fba217c1632424996396 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_variamos_ms_restrictions_name_resource
  name: '1bc696b3d3f302cb8c5f50b0456629664fba217c1632424996396'
  location: 'East US'
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"1bc696b3d3f302cb8c5f50b0456629664fba217c","repoName":"mauroagudeloz/variamos_ms_restrictions","slotName":"production"}'
    start_time: '2021-09-23T19:23:16.7978256Z'
    end_time: '2021-09-23T19:23:16.7978256Z'
    active: true
  }
}

resource sites_variamos_ms_languages_name_2ef71f53ed9f4e8cb8cfc9e139da57975421ad851634335251398 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_variamos_ms_languages_name_resource
  name: '2ef71f53ed9f4e8cb8cfc9e139da57975421ad851634335251398'
  location: 'East US'
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"2ef71f53ed9f4e8cb8cfc9e139da57975421ad85","repoName":"mauroagudeloz/variamos_ms_languages","slotName":"production"}'
    start_time: '2021-10-15T22:00:52.0305684Z'
    end_time: '2021-10-15T22:00:52.0305684Z'
    active: false
  }
}

resource sites_variamos_ms_languages_name_3af48ce6f66d9ed7321edfac5a99ebdf22284b3b1644265142631 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_variamos_ms_languages_name_resource
  name: '3af48ce6f66d9ed7321edfac5a99ebdf22284b3b1644265142631'
  location: 'East US'
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"3af48ce6f66d9ed7321edfac5a99ebdf22284b3b","repoName":"mauroagudeloz/variamos_ms_languages","slotName":"production"}'
    start_time: '2022-02-07T20:19:03.1301167Z'
    end_time: '2022-02-07T20:19:03.1301167Z'
    active: true
  }
}

resource sites_variamos_ms_languages_name_6774aa1bb7348165e8174c1f43795d3560d30c3a1626663689503 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_variamos_ms_languages_name_resource
  name: '6774aa1bb7348165e8174c1f43795d3560d30c3a1626663689503'
  location: 'East US'
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"6774aa1bb7348165e8174c1f43795d3560d30c3a","repoName":"mauroagudeloz/variamos_ms_languages","slotName":"production"}'
    start_time: '2021-07-19T03:01:29.8804687Z'
    end_time: '2021-07-19T03:01:29.8804687Z'
    active: false
  }
}

resource sites_VariaMos_name_7076e4a324fa1f9078b7968df8e50b42a3b811111643382101920 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_VariaMos_name_resource
  name: '7076e4a324fa1f9078b7968df8e50b42a3b811111643382101920'
  location: 'East US'
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"7076e4a324fa1f9078b7968df8e50b42a3b81111","repoName":"mauroagudeloz/VariaMosPLE","slotName":"production"}'
    start_time: '2022-01-28T15:01:42.3682819Z'
    end_time: '2022-01-28T15:01:42.3682819Z'
    active: false
  }
}

resource sites_VariaMos_name_7265024aa62627a72e14063643cb45a8eedf22d71639267586698 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_VariaMos_name_resource
  name: '7265024aa62627a72e14063643cb45a8eedf22d71639267586698'
  location: 'East US'
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"7265024aa62627a72e14063643cb45a8eedf22d7","repoName":"mauroagudeloz/VariaMosPLE","slotName":"production"}'
    start_time: '2021-12-12T00:06:27.1253791Z'
    end_time: '2021-12-12T00:06:27.1253791Z'
    active: false
  }
}

resource sites_variamos_ms_languages_name_73c6de7017b0cd67d7ce16b3638050bf604530461634397209790 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_variamos_ms_languages_name_resource
  name: '73c6de7017b0cd67d7ce16b3638050bf604530461634397209790'
  location: 'East US'
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"73c6de7017b0cd67d7ce16b3638050bf60453046","repoName":"mauroagudeloz/variamos_ms_languages","slotName":"production"}'
    start_time: '2021-10-16T15:13:30.1570911Z'
    end_time: '2021-10-16T15:13:30.1570911Z'
    active: false
  }
}

resource sites_VariaMos_name_7504222392d73b683fb138a49dcfb13a70993eb91643376285081 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_VariaMos_name_resource
  name: '7504222392d73b683fb138a49dcfb13a70993eb91643376285081'
  location: 'East US'
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"7504222392d73b683fb138a49dcfb13a70993eb9","repoName":"mauroagudeloz/VariaMosPLE","slotName":"production"}'
    start_time: '2022-01-28T13:24:45.4233965Z'
    end_time: '2022-01-28T13:24:45.4233965Z'
    active: false
  }
}

resource sites_variamos_ms_languages_name_7a536898bfed6ecc30ff846bda330375e1232be61624416510335 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_variamos_ms_languages_name_resource
  name: '7a536898bfed6ecc30ff846bda330375e1232be61624416510335'
  location: 'East US'
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"7a536898bfed6ecc30ff846bda330375e1232be6","repoName":"mauroagudeloz/variamos_ms_languages","slotName":"production"}'
    start_time: '2021-06-23T02:48:31.7456767Z'
    end_time: '2021-06-23T02:48:31.7456767Z'
    active: false
  }
}

resource sites_variamos_ms_languages_name_8688e0b9fc78adcaa6e122c12dbb08f36ac9caef1624417099517 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_variamos_ms_languages_name_resource
  name: '8688e0b9fc78adcaa6e122c12dbb08f36ac9caef1624417099517'
  location: 'East US'
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"8688e0b9fc78adcaa6e122c12dbb08f36ac9caef","repoName":"mauroagudeloz/variamos_ms_languages","slotName":"production"}'
    start_time: '2021-06-23T02:58:19.9082338Z'
    end_time: '2021-06-23T02:58:19.9082338Z'
    active: false
  }
}

resource sites_VariaMos_name_9f3dbec998bf3989c19a62c37375e48f519e349f1643377791282 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_VariaMos_name_resource
  name: '9f3dbec998bf3989c19a62c37375e48f519e349f1643377791282'
  location: 'East US'
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"9f3dbec998bf3989c19a62c37375e48f519e349f","repoName":"mauroagudeloz/VariaMosPLE","slotName":"production"}'
    start_time: '2022-01-28T13:49:51.7416177Z'
    end_time: '2022-01-28T13:49:51.7416177Z'
    active: false
  }
}

resource sites_variamos_ms_languages_name_a0d3252e3f988475d79eb930dd02d0b8907165811625713114970 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_variamos_ms_languages_name_resource
  name: 'a0d3252e3f988475d79eb930dd02d0b8907165811625713114970'
  location: 'East US'
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"a0d3252e3f988475d79eb930dd02d0b890716581","repoName":"mauroagudeloz/variamos_ms_languages","slotName":"production"}'
    start_time: '2021-07-08T02:58:35.3464792Z'
    end_time: '2021-07-08T02:58:35.3464792Z'
    active: false
  }
}

resource sites_VariaMos_name_a308c60a8d57ed82ed80992815c9670a5420a43b1643840578680 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_VariaMos_name_resource
  name: 'a308c60a8d57ed82ed80992815c9670a5420a43b1643840578680'
  location: 'East US'
  properties: {
    status: 4
    author: 'aolopezeafit'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"a308c60a8d57ed82ed80992815c9670a5420a43b","repoName":"mauroagudeloz/VariaMosPLE","slotName":"production"}'
    start_time: '2022-02-02T22:22:59.1414649Z'
    end_time: '2022-02-02T22:22:59.1414649Z'
    active: false
  }
}

resource sites_VariaMos_name_a9070739c32d2cba30c427aec41cf2f9aba8b8791645667931729 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_VariaMos_name_resource
  name: 'a9070739c32d2cba30c427aec41cf2f9aba8b8791645667931729'
  location: 'East US'
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"a9070739c32d2cba30c427aec41cf2f9aba8b879","repoName":"mauroagudeloz/VariaMosPLE","slotName":"production"}'
    start_time: '2022-02-24T01:58:52.1279235Z'
    end_time: '2022-02-24T01:58:52.1279235Z'
    active: false
  }
}

resource sites_variamos_ms_languages_name_bfb639849165e929fcb1316dcdcd31490e65bd901626823819261 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_variamos_ms_languages_name_resource
  name: 'bfb639849165e929fcb1316dcdcd31490e65bd901626823819261'
  location: 'East US'
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"bfb639849165e929fcb1316dcdcd31490e65bd90","repoName":"mauroagudeloz/variamos_ms_languages","slotName":"production"}'
    start_time: '2021-07-20T23:30:19.6609299Z'
    end_time: '2021-07-20T23:30:19.6609299Z'
    active: false
  }
}

resource sites_VariaMos_name_c5a78959642adfcbfff16f0a7ca531a445e3879d1644265234708 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_VariaMos_name_resource
  name: 'c5a78959642adfcbfff16f0a7ca531a445e3879d1644265234708'
  location: 'East US'
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"c5a78959642adfcbfff16f0a7ca531a445e3879d","repoName":"mauroagudeloz/VariaMosPLE","slotName":"production"}'
    start_time: '2022-02-07T20:20:37.895624Z'
    end_time: '2022-02-07T20:20:37.895624Z'
    active: false
  }
}

resource sites_variamos_ms_languages_name_caa543bdae65d5922cbd4c09769a22a4d32ef3b51624753771703 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_variamos_ms_languages_name_resource
  name: 'caa543bdae65d5922cbd4c09769a22a4d32ef3b51624753771703'
  location: 'East US'
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"caa543bdae65d5922cbd4c09769a22a4d32ef3b5","repoName":"mauroagudeloz/variamos_ms_languages","slotName":"production"}'
    start_time: '2021-06-27T00:29:32.4336149Z'
    end_time: '2021-06-27T00:29:32.4336149Z'
    active: false
  }
}

resource sites_VariaMos_name_cfcf8c8fc870713e2faffc8ce3e925d0f0ffe0991646416549466 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_VariaMos_name_resource
  name: 'cfcf8c8fc870713e2faffc8ce3e925d0f0ffe0991646416549466'
  location: 'East US'
  properties: {
    status: 4
    author: 'aolopezeafit'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"cfcf8c8fc870713e2faffc8ce3e925d0f0ffe099","repoName":"mauroagudeloz/VariaMosPLE","slotName":"production"}'
    start_time: '2022-03-04T17:55:49.7892272Z'
    end_time: '2022-03-04T17:55:49.7892272Z'
    active: true
  }
}

resource sites_variamos_ms_apireference_name_e4c266cdcf468b4e1e079459d8473c87698934a71644269255706 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_variamos_ms_apireference_name_resource
  name: 'e4c266cdcf468b4e1e079459d8473c87698934a71644269255706'
  location: 'East US'
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"e4c266cdcf468b4e1e079459d8473c87698934a7","repoName":"mauroagudeloz/variamos-ms-apireference","slotName":"production"}'
    start_time: '2022-02-07T21:27:36.1450757Z'
    end_time: '2022-02-07T21:27:36.1450757Z'
    active: true
  }
}

resource sites_variamos_ms_apireference_name_f5e41694ba81ce5e0551989241b968389c556b3e1644268583702 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_variamos_ms_apireference_name_resource
  name: 'f5e41694ba81ce5e0551989241b968389c556b3e1644268583702'
  location: 'East US'
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"f5e41694ba81ce5e0551989241b968389c556b3e","repoName":"mauroagudeloz/variamos-ms-apireference","slotName":"production"}'
    start_time: '2022-02-07T21:16:24.1148182Z'
    end_time: '2022-02-07T21:16:24.1148182Z'
    active: false
  }
}

resource sites_VariaMos_name_ffa0f8b7007d60880c28340171877696d61348ca1643376469308 'Microsoft.Web/sites/deployments@2021-03-01' = {
  parent: sites_VariaMos_name_resource
  name: 'ffa0f8b7007d60880c28340171877696d61348ca1643376469308'
  location: 'East US'
  properties: {
    status: 4
    author: 'mauroagudeloz'
    deployer: 'GitHub'
    message: '{"type":"Deployment","sha":"ffa0f8b7007d60880c28340171877696d61348ca","repoName":"mauroagudeloz/VariaMosPLE","slotName":"production"}'
    start_time: '2022-01-28T13:27:50.1318451Z'
    end_time: '2022-01-28T13:27:50.1318451Z'
    active: false
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