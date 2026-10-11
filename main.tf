resource "kubernetes_stateful_set_v1" "stateful_set_v1s" {
  for_each = var.stateful_set_v1s

  wait_for_rollout = each.value.wait_for_rollout

  metadata {
    annotations   = each.value.metadata.annotations
    generate_name = each.value.metadata.generate_name
    labels        = each.value.metadata.labels
    name          = each.value.metadata.name
    namespace     = each.value.metadata.namespace
  }

  spec {
    min_ready_seconds = each.value.spec.min_ready_seconds
    dynamic "persistent_volume_claim_retention_policy" {
      for_each = each.value.spec.persistent_volume_claim_retention_policy != null ? each.value.spec.persistent_volume_claim_retention_policy : []
      content {
        when_deleted = persistent_volume_claim_retention_policy.value.when_deleted
        when_scaled  = persistent_volume_claim_retention_policy.value.when_scaled
      }
    }
    pod_management_policy  = each.value.spec.pod_management_policy
    replicas               = each.value.spec.replicas
    revision_history_limit = each.value.spec.revision_history_limit
    selector {
      dynamic "match_expressions" {
        for_each = each.value.spec.selector.match_expressions != null ? each.value.spec.selector.match_expressions : []
        content {
          key      = match_expressions.value.key
          operator = match_expressions.value.operator
          values   = match_expressions.value.values
        }
      }
      match_labels = each.value.spec.selector.match_labels
    }
    service_name = each.value.spec.service_name
    template {
      metadata {
        annotations   = each.value.spec.template.metadata.annotations
        generate_name = each.value.spec.template.metadata.generate_name
        labels        = each.value.spec.template.metadata.labels
        name          = each.value.spec.template.metadata.name
        namespace     = each.value.spec.template.metadata.namespace
      }
      dynamic "spec" {
        for_each = each.value.spec.template.spec != null ? [each.value.spec.template.spec] : []
        content {
          active_deadline_seconds = spec.value.active_deadline_seconds
          dynamic "affinity" {
            for_each = spec.value.affinity != null ? [spec.value.affinity] : []
            content {
              dynamic "node_affinity" {
                for_each = affinity.value.node_affinity != null ? [affinity.value.node_affinity] : []
                content {
                  dynamic "preferred_during_scheduling_ignored_during_execution" {
                    for_each = node_affinity.value.preferred_during_scheduling_ignored_during_execution != null ? node_affinity.value.preferred_during_scheduling_ignored_during_execution : []
                    content {
                      preference {
                        dynamic "match_expressions" {
                          for_each = preferred_during_scheduling_ignored_during_execution.value.preference.match_expressions != null ? preferred_during_scheduling_ignored_during_execution.value.preference.match_expressions : []
                          content {
                            key      = match_expressions.value.key
                            operator = match_expressions.value.operator
                            values   = match_expressions.value.values
                          }
                        }
                        dynamic "match_fields" {
                          for_each = preferred_during_scheduling_ignored_during_execution.value.preference.match_fields != null ? preferred_during_scheduling_ignored_during_execution.value.preference.match_fields : []
                          content {
                            key      = match_fields.value.key
                            operator = match_fields.value.operator
                            values   = match_fields.value.values
                          }
                        }
                      }
                      weight = preferred_during_scheduling_ignored_during_execution.value.weight
                    }
                  }
                  dynamic "required_during_scheduling_ignored_during_execution" {
                    for_each = node_affinity.value.required_during_scheduling_ignored_during_execution != null ? [node_affinity.value.required_during_scheduling_ignored_during_execution] : []
                    content {
                      dynamic "node_selector_term" {
                        for_each = required_during_scheduling_ignored_during_execution.value.node_selector_term != null ? required_during_scheduling_ignored_during_execution.value.node_selector_term : []
                        content {
                          dynamic "match_expressions" {
                            for_each = node_selector_term.value.match_expressions != null ? node_selector_term.value.match_expressions : []
                            content {
                              key      = match_expressions.value.key
                              operator = match_expressions.value.operator
                              values   = match_expressions.value.values
                            }
                          }
                          dynamic "match_fields" {
                            for_each = node_selector_term.value.match_fields != null ? node_selector_term.value.match_fields : []
                            content {
                              key      = match_fields.value.key
                              operator = match_fields.value.operator
                              values   = match_fields.value.values
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
              dynamic "pod_affinity" {
                for_each = affinity.value.pod_affinity != null ? [affinity.value.pod_affinity] : []
                content {
                  dynamic "preferred_during_scheduling_ignored_during_execution" {
                    for_each = pod_affinity.value.preferred_during_scheduling_ignored_during_execution != null ? pod_affinity.value.preferred_during_scheduling_ignored_during_execution : []
                    content {
                      pod_affinity_term {
                        dynamic "label_selector" {
                          for_each = preferred_during_scheduling_ignored_during_execution.value.pod_affinity_term.label_selector != null ? preferred_during_scheduling_ignored_during_execution.value.pod_affinity_term.label_selector : []
                          content {
                            dynamic "match_expressions" {
                              for_each = label_selector.value.match_expressions != null ? label_selector.value.match_expressions : []
                              content {
                                key      = match_expressions.value.key
                                operator = match_expressions.value.operator
                                values   = match_expressions.value.values
                              }
                            }
                            match_labels = label_selector.value.match_labels
                          }
                        }
                        dynamic "namespace_selector" {
                          for_each = preferred_during_scheduling_ignored_during_execution.value.pod_affinity_term.namespace_selector != null ? preferred_during_scheduling_ignored_during_execution.value.pod_affinity_term.namespace_selector : []
                          content {
                            dynamic "match_expressions" {
                              for_each = namespace_selector.value.match_expressions != null ? namespace_selector.value.match_expressions : []
                              content {
                                key      = match_expressions.value.key
                                operator = match_expressions.value.operator
                                values   = match_expressions.value.values
                              }
                            }
                            match_labels = namespace_selector.value.match_labels
                          }
                        }
                        namespaces   = preferred_during_scheduling_ignored_during_execution.value.pod_affinity_term.namespaces
                        topology_key = preferred_during_scheduling_ignored_during_execution.value.pod_affinity_term.topology_key
                      }
                      weight = preferred_during_scheduling_ignored_during_execution.value.weight
                    }
                  }
                  dynamic "required_during_scheduling_ignored_during_execution" {
                    for_each = pod_affinity.value.required_during_scheduling_ignored_during_execution != null ? pod_affinity.value.required_during_scheduling_ignored_during_execution : []
                    content {
                      dynamic "label_selector" {
                        for_each = required_during_scheduling_ignored_during_execution.value.label_selector != null ? required_during_scheduling_ignored_during_execution.value.label_selector : []
                        content {
                          dynamic "match_expressions" {
                            for_each = label_selector.value.match_expressions != null ? label_selector.value.match_expressions : []
                            content {
                              key      = match_expressions.value.key
                              operator = match_expressions.value.operator
                              values   = match_expressions.value.values
                            }
                          }
                          match_labels = label_selector.value.match_labels
                        }
                      }
                      dynamic "namespace_selector" {
                        for_each = required_during_scheduling_ignored_during_execution.value.namespace_selector != null ? required_during_scheduling_ignored_during_execution.value.namespace_selector : []
                        content {
                          dynamic "match_expressions" {
                            for_each = namespace_selector.value.match_expressions != null ? namespace_selector.value.match_expressions : []
                            content {
                              key      = match_expressions.value.key
                              operator = match_expressions.value.operator
                              values   = match_expressions.value.values
                            }
                          }
                          match_labels = namespace_selector.value.match_labels
                        }
                      }
                      namespaces   = required_during_scheduling_ignored_during_execution.value.namespaces
                      topology_key = required_during_scheduling_ignored_during_execution.value.topology_key
                    }
                  }
                }
              }
              dynamic "pod_anti_affinity" {
                for_each = affinity.value.pod_anti_affinity != null ? [affinity.value.pod_anti_affinity] : []
                content {
                  dynamic "preferred_during_scheduling_ignored_during_execution" {
                    for_each = pod_anti_affinity.value.preferred_during_scheduling_ignored_during_execution != null ? pod_anti_affinity.value.preferred_during_scheduling_ignored_during_execution : []
                    content {
                      pod_affinity_term {
                        dynamic "label_selector" {
                          for_each = preferred_during_scheduling_ignored_during_execution.value.pod_affinity_term.label_selector != null ? preferred_during_scheduling_ignored_during_execution.value.pod_affinity_term.label_selector : []
                          content {
                            dynamic "match_expressions" {
                              for_each = label_selector.value.match_expressions != null ? label_selector.value.match_expressions : []
                              content {
                                key      = match_expressions.value.key
                                operator = match_expressions.value.operator
                                values   = match_expressions.value.values
                              }
                            }
                            match_labels = label_selector.value.match_labels
                          }
                        }
                        dynamic "namespace_selector" {
                          for_each = preferred_during_scheduling_ignored_during_execution.value.pod_affinity_term.namespace_selector != null ? preferred_during_scheduling_ignored_during_execution.value.pod_affinity_term.namespace_selector : []
                          content {
                            dynamic "match_expressions" {
                              for_each = namespace_selector.value.match_expressions != null ? namespace_selector.value.match_expressions : []
                              content {
                                key      = match_expressions.value.key
                                operator = match_expressions.value.operator
                                values   = match_expressions.value.values
                              }
                            }
                            match_labels = namespace_selector.value.match_labels
                          }
                        }
                        namespaces   = preferred_during_scheduling_ignored_during_execution.value.pod_affinity_term.namespaces
                        topology_key = preferred_during_scheduling_ignored_during_execution.value.pod_affinity_term.topology_key
                      }
                      weight = preferred_during_scheduling_ignored_during_execution.value.weight
                    }
                  }
                  dynamic "required_during_scheduling_ignored_during_execution" {
                    for_each = pod_anti_affinity.value.required_during_scheduling_ignored_during_execution != null ? pod_anti_affinity.value.required_during_scheduling_ignored_during_execution : []
                    content {
                      dynamic "label_selector" {
                        for_each = required_during_scheduling_ignored_during_execution.value.label_selector != null ? required_during_scheduling_ignored_during_execution.value.label_selector : []
                        content {
                          dynamic "match_expressions" {
                            for_each = label_selector.value.match_expressions != null ? label_selector.value.match_expressions : []
                            content {
                              key      = match_expressions.value.key
                              operator = match_expressions.value.operator
                              values   = match_expressions.value.values
                            }
                          }
                          match_labels = label_selector.value.match_labels
                        }
                      }
                      dynamic "namespace_selector" {
                        for_each = required_during_scheduling_ignored_during_execution.value.namespace_selector != null ? required_during_scheduling_ignored_during_execution.value.namespace_selector : []
                        content {
                          dynamic "match_expressions" {
                            for_each = namespace_selector.value.match_expressions != null ? namespace_selector.value.match_expressions : []
                            content {
                              key      = match_expressions.value.key
                              operator = match_expressions.value.operator
                              values   = match_expressions.value.values
                            }
                          }
                          match_labels = namespace_selector.value.match_labels
                        }
                      }
                      namespaces   = required_during_scheduling_ignored_during_execution.value.namespaces
                      topology_key = required_during_scheduling_ignored_during_execution.value.topology_key
                    }
                  }
                }
              }
            }
          }
          automount_service_account_token = spec.value.automount_service_account_token
          dynamic "container" {
            for_each = spec.value.container != null ? spec.value.container : []
            content {
              args    = container.value.args
              command = container.value.command
              dynamic "env" {
                for_each = container.value.env != null ? container.value.env : []
                content {
                  name  = env.value.name
                  value = env.value.value
                  dynamic "value_from" {
                    for_each = env.value.value_from != null ? [env.value.value_from] : []
                    content {
                      dynamic "config_map_key_ref" {
                        for_each = value_from.value.config_map_key_ref != null ? [value_from.value.config_map_key_ref] : []
                        content {
                          key      = config_map_key_ref.value.key
                          name     = config_map_key_ref.value.name
                          optional = config_map_key_ref.value.optional
                        }
                      }
                      dynamic "field_ref" {
                        for_each = value_from.value.field_ref != null ? [value_from.value.field_ref] : []
                        content {
                          api_version = field_ref.value.api_version
                          field_path  = field_ref.value.field_path
                        }
                      }
                      dynamic "resource_field_ref" {
                        for_each = value_from.value.resource_field_ref != null ? [value_from.value.resource_field_ref] : []
                        content {
                          container_name = resource_field_ref.value.container_name
                          divisor        = resource_field_ref.value.divisor
                          resource       = resource_field_ref.value.resource
                        }
                      }
                      dynamic "secret_key_ref" {
                        for_each = value_from.value.secret_key_ref != null ? [value_from.value.secret_key_ref] : []
                        content {
                          key      = secret_key_ref.value.key
                          name     = secret_key_ref.value.name
                          optional = secret_key_ref.value.optional
                        }
                      }
                    }
                  }
                }
              }
              dynamic "env_from" {
                for_each = container.value.env_from != null ? container.value.env_from : []
                content {
                  dynamic "config_map_ref" {
                    for_each = env_from.value.config_map_ref != null ? [env_from.value.config_map_ref] : []
                    content {
                      name     = config_map_ref.value.name
                      optional = config_map_ref.value.optional
                    }
                  }
                  prefix = env_from.value.prefix
                  dynamic "secret_ref" {
                    for_each = env_from.value.secret_ref != null ? [env_from.value.secret_ref] : []
                    content {
                      name     = secret_ref.value.name
                      optional = secret_ref.value.optional
                    }
                  }
                }
              }
              image             = container.value.image
              image_pull_policy = container.value.image_pull_policy
              dynamic "lifecycle" {
                for_each = container.value.lifecycle != null ? [container.value.lifecycle] : []
                content {
                  dynamic "post_start" {
                    for_each = lifecycle.value.post_start != null ? lifecycle.value.post_start : []
                    content {
                      dynamic "exec" {
                        for_each = post_start.value.exec != null ? [post_start.value.exec] : []
                        content {
                          command = exec.value.command
                        }
                      }
                      dynamic "http_get" {
                        for_each = post_start.value.http_get != null ? [post_start.value.http_get] : []
                        content {
                          host = http_get.value.host
                          dynamic "http_header" {
                            for_each = http_get.value.http_header != null ? http_get.value.http_header : []
                            content {
                              name  = http_header.value.name
                              value = http_header.value.value
                            }
                          }
                          path   = http_get.value.path
                          port   = http_get.value.port
                          scheme = http_get.value.scheme
                        }
                      }
                      dynamic "tcp_socket" {
                        for_each = post_start.value.tcp_socket != null ? post_start.value.tcp_socket : []
                        content {
                          port = tcp_socket.value.port
                        }
                      }
                    }
                  }
                  dynamic "pre_stop" {
                    for_each = lifecycle.value.pre_stop != null ? lifecycle.value.pre_stop : []
                    content {
                      dynamic "exec" {
                        for_each = pre_stop.value.exec != null ? [pre_stop.value.exec] : []
                        content {
                          command = exec.value.command
                        }
                      }
                      dynamic "http_get" {
                        for_each = pre_stop.value.http_get != null ? [pre_stop.value.http_get] : []
                        content {
                          host = http_get.value.host
                          dynamic "http_header" {
                            for_each = http_get.value.http_header != null ? http_get.value.http_header : []
                            content {
                              name  = http_header.value.name
                              value = http_header.value.value
                            }
                          }
                          path   = http_get.value.path
                          port   = http_get.value.port
                          scheme = http_get.value.scheme
                        }
                      }
                      dynamic "tcp_socket" {
                        for_each = pre_stop.value.tcp_socket != null ? pre_stop.value.tcp_socket : []
                        content {
                          port = tcp_socket.value.port
                        }
                      }
                    }
                  }
                }
              }
              dynamic "liveness_probe" {
                for_each = container.value.liveness_probe != null ? [container.value.liveness_probe] : []
                content {
                  dynamic "exec" {
                    for_each = liveness_probe.value.exec != null ? [liveness_probe.value.exec] : []
                    content {
                      command = exec.value.command
                    }
                  }
                  failure_threshold = liveness_probe.value.failure_threshold
                  dynamic "grpc" {
                    for_each = liveness_probe.value.grpc != null ? liveness_probe.value.grpc : []
                    content {
                      port    = grpc.value.port
                      service = grpc.value.service
                    }
                  }
                  dynamic "http_get" {
                    for_each = liveness_probe.value.http_get != null ? [liveness_probe.value.http_get] : []
                    content {
                      host = http_get.value.host
                      dynamic "http_header" {
                        for_each = http_get.value.http_header != null ? http_get.value.http_header : []
                        content {
                          name  = http_header.value.name
                          value = http_header.value.value
                        }
                      }
                      path   = http_get.value.path
                      port   = http_get.value.port
                      scheme = http_get.value.scheme
                    }
                  }
                  initial_delay_seconds = liveness_probe.value.initial_delay_seconds
                  period_seconds        = liveness_probe.value.period_seconds
                  success_threshold     = liveness_probe.value.success_threshold
                  dynamic "tcp_socket" {
                    for_each = liveness_probe.value.tcp_socket != null ? liveness_probe.value.tcp_socket : []
                    content {
                      port = tcp_socket.value.port
                    }
                  }
                  timeout_seconds = liveness_probe.value.timeout_seconds
                }
              }
              name = container.value.name
              dynamic "port" {
                for_each = container.value.port != null ? container.value.port : []
                content {
                  container_port = port.value.container_port
                  host_ip        = port.value.host_ip
                  host_port      = port.value.host_port
                  name           = port.value.name
                  protocol       = port.value.protocol
                }
              }
              dynamic "readiness_probe" {
                for_each = container.value.readiness_probe != null ? [container.value.readiness_probe] : []
                content {
                  dynamic "exec" {
                    for_each = readiness_probe.value.exec != null ? [readiness_probe.value.exec] : []
                    content {
                      command = exec.value.command
                    }
                  }
                  failure_threshold = readiness_probe.value.failure_threshold
                  dynamic "grpc" {
                    for_each = readiness_probe.value.grpc != null ? readiness_probe.value.grpc : []
                    content {
                      port    = grpc.value.port
                      service = grpc.value.service
                    }
                  }
                  dynamic "http_get" {
                    for_each = readiness_probe.value.http_get != null ? [readiness_probe.value.http_get] : []
                    content {
                      host = http_get.value.host
                      dynamic "http_header" {
                        for_each = http_get.value.http_header != null ? http_get.value.http_header : []
                        content {
                          name  = http_header.value.name
                          value = http_header.value.value
                        }
                      }
                      path   = http_get.value.path
                      port   = http_get.value.port
                      scheme = http_get.value.scheme
                    }
                  }
                  initial_delay_seconds = readiness_probe.value.initial_delay_seconds
                  period_seconds        = readiness_probe.value.period_seconds
                  success_threshold     = readiness_probe.value.success_threshold
                  dynamic "tcp_socket" {
                    for_each = readiness_probe.value.tcp_socket != null ? readiness_probe.value.tcp_socket : []
                    content {
                      port = tcp_socket.value.port
                    }
                  }
                  timeout_seconds = readiness_probe.value.timeout_seconds
                }
              }
              dynamic "resources" {
                for_each = container.value.resources != null ? [container.value.resources] : []
                content {
                  limits   = resources.value.limits
                  requests = resources.value.requests
                }
              }
              restart_policy = container.value.restart_policy
              dynamic "security_context" {
                for_each = container.value.security_context != null ? [container.value.security_context] : []
                content {
                  allow_privilege_escalation = security_context.value.allow_privilege_escalation
                  dynamic "capabilities" {
                    for_each = security_context.value.capabilities != null ? [security_context.value.capabilities] : []
                    content {
                      add  = capabilities.value.add
                      drop = capabilities.value.drop
                    }
                  }
                  privileged                = security_context.value.privileged
                  read_only_root_filesystem = security_context.value.read_only_root_filesystem
                  run_as_group              = security_context.value.run_as_group
                  run_as_non_root           = security_context.value.run_as_non_root
                  run_as_user               = security_context.value.run_as_user
                  dynamic "se_linux_options" {
                    for_each = security_context.value.se_linux_options != null ? [security_context.value.se_linux_options] : []
                    content {
                      level = se_linux_options.value.level
                      role  = se_linux_options.value.role
                      type  = se_linux_options.value.type
                      user  = se_linux_options.value.user
                    }
                  }
                  dynamic "seccomp_profile" {
                    for_each = security_context.value.seccomp_profile != null ? [security_context.value.seccomp_profile] : []
                    content {
                      localhost_profile = seccomp_profile.value.localhost_profile
                      type              = seccomp_profile.value.type
                    }
                  }
                }
              }
              dynamic "startup_probe" {
                for_each = container.value.startup_probe != null ? [container.value.startup_probe] : []
                content {
                  dynamic "exec" {
                    for_each = startup_probe.value.exec != null ? [startup_probe.value.exec] : []
                    content {
                      command = exec.value.command
                    }
                  }
                  failure_threshold = startup_probe.value.failure_threshold
                  dynamic "grpc" {
                    for_each = startup_probe.value.grpc != null ? startup_probe.value.grpc : []
                    content {
                      port    = grpc.value.port
                      service = grpc.value.service
                    }
                  }
                  dynamic "http_get" {
                    for_each = startup_probe.value.http_get != null ? [startup_probe.value.http_get] : []
                    content {
                      host = http_get.value.host
                      dynamic "http_header" {
                        for_each = http_get.value.http_header != null ? http_get.value.http_header : []
                        content {
                          name  = http_header.value.name
                          value = http_header.value.value
                        }
                      }
                      path   = http_get.value.path
                      port   = http_get.value.port
                      scheme = http_get.value.scheme
                    }
                  }
                  initial_delay_seconds = startup_probe.value.initial_delay_seconds
                  period_seconds        = startup_probe.value.period_seconds
                  success_threshold     = startup_probe.value.success_threshold
                  dynamic "tcp_socket" {
                    for_each = startup_probe.value.tcp_socket != null ? startup_probe.value.tcp_socket : []
                    content {
                      port = tcp_socket.value.port
                    }
                  }
                  timeout_seconds = startup_probe.value.timeout_seconds
                }
              }
              stdin                      = container.value.stdin
              stdin_once                 = container.value.stdin_once
              termination_message_path   = container.value.termination_message_path
              termination_message_policy = container.value.termination_message_policy
              tty                        = container.value.tty
              dynamic "volume_device" {
                for_each = container.value.volume_device != null ? container.value.volume_device : []
                content {
                  device_path = volume_device.value.device_path
                  name        = volume_device.value.name
                }
              }
              dynamic "volume_mount" {
                for_each = container.value.volume_mount != null ? container.value.volume_mount : []
                content {
                  mount_path        = volume_mount.value.mount_path
                  mount_propagation = volume_mount.value.mount_propagation
                  name              = volume_mount.value.name
                  read_only         = volume_mount.value.read_only
                  sub_path          = volume_mount.value.sub_path
                  sub_path_expr     = volume_mount.value.sub_path_expr
                }
              }
              working_dir = container.value.working_dir
            }
          }
          dynamic "dns_config" {
            for_each = spec.value.dns_config != null ? [spec.value.dns_config] : []
            content {
              nameservers = dns_config.value.nameservers
              dynamic "option" {
                for_each = dns_config.value.option != null ? dns_config.value.option : []
                content {
                  name  = option.value.name
                  value = option.value.value
                }
              }
              searches = dns_config.value.searches
            }
          }
          dns_policy           = spec.value.dns_policy
          enable_service_links = spec.value.enable_service_links
          dynamic "host_aliases" {
            for_each = spec.value.host_aliases != null ? spec.value.host_aliases : []
            content {
              hostnames = host_aliases.value.hostnames
              ip        = host_aliases.value.ip
            }
          }
          host_ipc     = spec.value.host_ipc
          host_network = spec.value.host_network
          host_pid     = spec.value.host_pid
          hostname     = spec.value.hostname
          dynamic "image_pull_secrets" {
            for_each = spec.value.image_pull_secrets != null ? spec.value.image_pull_secrets : []
            content {
              name = image_pull_secrets.value.name
            }
          }
          dynamic "init_container" {
            for_each = spec.value.init_container != null ? spec.value.init_container : []
            content {
              args    = init_container.value.args
              command = init_container.value.command
              dynamic "env" {
                for_each = init_container.value.env != null ? init_container.value.env : []
                content {
                  name  = env.value.name
                  value = env.value.value
                  dynamic "value_from" {
                    for_each = env.value.value_from != null ? [env.value.value_from] : []
                    content {
                      dynamic "config_map_key_ref" {
                        for_each = value_from.value.config_map_key_ref != null ? [value_from.value.config_map_key_ref] : []
                        content {
                          key      = config_map_key_ref.value.key
                          name     = config_map_key_ref.value.name
                          optional = config_map_key_ref.value.optional
                        }
                      }
                      dynamic "field_ref" {
                        for_each = value_from.value.field_ref != null ? [value_from.value.field_ref] : []
                        content {
                          api_version = field_ref.value.api_version
                          field_path  = field_ref.value.field_path
                        }
                      }
                      dynamic "resource_field_ref" {
                        for_each = value_from.value.resource_field_ref != null ? [value_from.value.resource_field_ref] : []
                        content {
                          container_name = resource_field_ref.value.container_name
                          divisor        = resource_field_ref.value.divisor
                          resource       = resource_field_ref.value.resource
                        }
                      }
                      dynamic "secret_key_ref" {
                        for_each = value_from.value.secret_key_ref != null ? [value_from.value.secret_key_ref] : []
                        content {
                          key      = secret_key_ref.value.key
                          name     = secret_key_ref.value.name
                          optional = secret_key_ref.value.optional
                        }
                      }
                    }
                  }
                }
              }
              dynamic "env_from" {
                for_each = init_container.value.env_from != null ? init_container.value.env_from : []
                content {
                  dynamic "config_map_ref" {
                    for_each = env_from.value.config_map_ref != null ? [env_from.value.config_map_ref] : []
                    content {
                      name     = config_map_ref.value.name
                      optional = config_map_ref.value.optional
                    }
                  }
                  prefix = env_from.value.prefix
                  dynamic "secret_ref" {
                    for_each = env_from.value.secret_ref != null ? [env_from.value.secret_ref] : []
                    content {
                      name     = secret_ref.value.name
                      optional = secret_ref.value.optional
                    }
                  }
                }
              }
              image             = init_container.value.image
              image_pull_policy = init_container.value.image_pull_policy
              dynamic "lifecycle" {
                for_each = init_container.value.lifecycle != null ? [init_container.value.lifecycle] : []
                content {
                  dynamic "post_start" {
                    for_each = lifecycle.value.post_start != null ? lifecycle.value.post_start : []
                    content {
                      dynamic "exec" {
                        for_each = post_start.value.exec != null ? [post_start.value.exec] : []
                        content {
                          command = exec.value.command
                        }
                      }
                      dynamic "http_get" {
                        for_each = post_start.value.http_get != null ? [post_start.value.http_get] : []
                        content {
                          host = http_get.value.host
                          dynamic "http_header" {
                            for_each = http_get.value.http_header != null ? http_get.value.http_header : []
                            content {
                              name  = http_header.value.name
                              value = http_header.value.value
                            }
                          }
                          path   = http_get.value.path
                          port   = http_get.value.port
                          scheme = http_get.value.scheme
                        }
                      }
                      dynamic "tcp_socket" {
                        for_each = post_start.value.tcp_socket != null ? post_start.value.tcp_socket : []
                        content {
                          port = tcp_socket.value.port
                        }
                      }
                    }
                  }
                  dynamic "pre_stop" {
                    for_each = lifecycle.value.pre_stop != null ? lifecycle.value.pre_stop : []
                    content {
                      dynamic "exec" {
                        for_each = pre_stop.value.exec != null ? [pre_stop.value.exec] : []
                        content {
                          command = exec.value.command
                        }
                      }
                      dynamic "http_get" {
                        for_each = pre_stop.value.http_get != null ? [pre_stop.value.http_get] : []
                        content {
                          host = http_get.value.host
                          dynamic "http_header" {
                            for_each = http_get.value.http_header != null ? http_get.value.http_header : []
                            content {
                              name  = http_header.value.name
                              value = http_header.value.value
                            }
                          }
                          path   = http_get.value.path
                          port   = http_get.value.port
                          scheme = http_get.value.scheme
                        }
                      }
                      dynamic "tcp_socket" {
                        for_each = pre_stop.value.tcp_socket != null ? pre_stop.value.tcp_socket : []
                        content {
                          port = tcp_socket.value.port
                        }
                      }
                    }
                  }
                }
              }
              dynamic "liveness_probe" {
                for_each = init_container.value.liveness_probe != null ? [init_container.value.liveness_probe] : []
                content {
                  dynamic "exec" {
                    for_each = liveness_probe.value.exec != null ? [liveness_probe.value.exec] : []
                    content {
                      command = exec.value.command
                    }
                  }
                  failure_threshold = liveness_probe.value.failure_threshold
                  dynamic "grpc" {
                    for_each = liveness_probe.value.grpc != null ? liveness_probe.value.grpc : []
                    content {
                      port    = grpc.value.port
                      service = grpc.value.service
                    }
                  }
                  dynamic "http_get" {
                    for_each = liveness_probe.value.http_get != null ? [liveness_probe.value.http_get] : []
                    content {
                      host = http_get.value.host
                      dynamic "http_header" {
                        for_each = http_get.value.http_header != null ? http_get.value.http_header : []
                        content {
                          name  = http_header.value.name
                          value = http_header.value.value
                        }
                      }
                      path   = http_get.value.path
                      port   = http_get.value.port
                      scheme = http_get.value.scheme
                    }
                  }
                  initial_delay_seconds = liveness_probe.value.initial_delay_seconds
                  period_seconds        = liveness_probe.value.period_seconds
                  success_threshold     = liveness_probe.value.success_threshold
                  dynamic "tcp_socket" {
                    for_each = liveness_probe.value.tcp_socket != null ? liveness_probe.value.tcp_socket : []
                    content {
                      port = tcp_socket.value.port
                    }
                  }
                  timeout_seconds = liveness_probe.value.timeout_seconds
                }
              }
              name = init_container.value.name
              dynamic "port" {
                for_each = init_container.value.port != null ? init_container.value.port : []
                content {
                  container_port = port.value.container_port
                  host_ip        = port.value.host_ip
                  host_port      = port.value.host_port
                  name           = port.value.name
                  protocol       = port.value.protocol
                }
              }
              dynamic "readiness_probe" {
                for_each = init_container.value.readiness_probe != null ? [init_container.value.readiness_probe] : []
                content {
                  dynamic "exec" {
                    for_each = readiness_probe.value.exec != null ? [readiness_probe.value.exec] : []
                    content {
                      command = exec.value.command
                    }
                  }
                  failure_threshold = readiness_probe.value.failure_threshold
                  dynamic "grpc" {
                    for_each = readiness_probe.value.grpc != null ? readiness_probe.value.grpc : []
                    content {
                      port    = grpc.value.port
                      service = grpc.value.service
                    }
                  }
                  dynamic "http_get" {
                    for_each = readiness_probe.value.http_get != null ? [readiness_probe.value.http_get] : []
                    content {
                      host = http_get.value.host
                      dynamic "http_header" {
                        for_each = http_get.value.http_header != null ? http_get.value.http_header : []
                        content {
                          name  = http_header.value.name
                          value = http_header.value.value
                        }
                      }
                      path   = http_get.value.path
                      port   = http_get.value.port
                      scheme = http_get.value.scheme
                    }
                  }
                  initial_delay_seconds = readiness_probe.value.initial_delay_seconds
                  period_seconds        = readiness_probe.value.period_seconds
                  success_threshold     = readiness_probe.value.success_threshold
                  dynamic "tcp_socket" {
                    for_each = readiness_probe.value.tcp_socket != null ? readiness_probe.value.tcp_socket : []
                    content {
                      port = tcp_socket.value.port
                    }
                  }
                  timeout_seconds = readiness_probe.value.timeout_seconds
                }
              }
              dynamic "resources" {
                for_each = init_container.value.resources != null ? [init_container.value.resources] : []
                content {
                  limits   = resources.value.limits
                  requests = resources.value.requests
                }
              }
              restart_policy = init_container.value.restart_policy
              dynamic "security_context" {
                for_each = init_container.value.security_context != null ? [init_container.value.security_context] : []
                content {
                  allow_privilege_escalation = security_context.value.allow_privilege_escalation
                  dynamic "capabilities" {
                    for_each = security_context.value.capabilities != null ? [security_context.value.capabilities] : []
                    content {
                      add  = capabilities.value.add
                      drop = capabilities.value.drop
                    }
                  }
                  privileged                = security_context.value.privileged
                  read_only_root_filesystem = security_context.value.read_only_root_filesystem
                  run_as_group              = security_context.value.run_as_group
                  run_as_non_root           = security_context.value.run_as_non_root
                  run_as_user               = security_context.value.run_as_user
                  dynamic "se_linux_options" {
                    for_each = security_context.value.se_linux_options != null ? [security_context.value.se_linux_options] : []
                    content {
                      level = se_linux_options.value.level
                      role  = se_linux_options.value.role
                      type  = se_linux_options.value.type
                      user  = se_linux_options.value.user
                    }
                  }
                  dynamic "seccomp_profile" {
                    for_each = security_context.value.seccomp_profile != null ? [security_context.value.seccomp_profile] : []
                    content {
                      localhost_profile = seccomp_profile.value.localhost_profile
                      type              = seccomp_profile.value.type
                    }
                  }
                }
              }
              dynamic "startup_probe" {
                for_each = init_container.value.startup_probe != null ? [init_container.value.startup_probe] : []
                content {
                  dynamic "exec" {
                    for_each = startup_probe.value.exec != null ? [startup_probe.value.exec] : []
                    content {
                      command = exec.value.command
                    }
                  }
                  failure_threshold = startup_probe.value.failure_threshold
                  dynamic "grpc" {
                    for_each = startup_probe.value.grpc != null ? startup_probe.value.grpc : []
                    content {
                      port    = grpc.value.port
                      service = grpc.value.service
                    }
                  }
                  dynamic "http_get" {
                    for_each = startup_probe.value.http_get != null ? [startup_probe.value.http_get] : []
                    content {
                      host = http_get.value.host
                      dynamic "http_header" {
                        for_each = http_get.value.http_header != null ? http_get.value.http_header : []
                        content {
                          name  = http_header.value.name
                          value = http_header.value.value
                        }
                      }
                      path   = http_get.value.path
                      port   = http_get.value.port
                      scheme = http_get.value.scheme
                    }
                  }
                  initial_delay_seconds = startup_probe.value.initial_delay_seconds
                  period_seconds        = startup_probe.value.period_seconds
                  success_threshold     = startup_probe.value.success_threshold
                  dynamic "tcp_socket" {
                    for_each = startup_probe.value.tcp_socket != null ? startup_probe.value.tcp_socket : []
                    content {
                      port = tcp_socket.value.port
                    }
                  }
                  timeout_seconds = startup_probe.value.timeout_seconds
                }
              }
              stdin                      = init_container.value.stdin
              stdin_once                 = init_container.value.stdin_once
              termination_message_path   = init_container.value.termination_message_path
              termination_message_policy = init_container.value.termination_message_policy
              tty                        = init_container.value.tty
              dynamic "volume_device" {
                for_each = init_container.value.volume_device != null ? init_container.value.volume_device : []
                content {
                  device_path = volume_device.value.device_path
                  name        = volume_device.value.name
                }
              }
              dynamic "volume_mount" {
                for_each = init_container.value.volume_mount != null ? init_container.value.volume_mount : []
                content {
                  mount_path        = volume_mount.value.mount_path
                  mount_propagation = volume_mount.value.mount_propagation
                  name              = volume_mount.value.name
                  read_only         = volume_mount.value.read_only
                  sub_path          = volume_mount.value.sub_path
                  sub_path_expr     = volume_mount.value.sub_path_expr
                }
              }
              working_dir = init_container.value.working_dir
            }
          }
          node_name     = spec.value.node_name
          node_selector = spec.value.node_selector
          dynamic "os" {
            for_each = spec.value.os != null ? [spec.value.os] : []
            content {
              name = os.value.name
            }
          }
          priority_class_name = spec.value.priority_class_name
          dynamic "readiness_gate" {
            for_each = spec.value.readiness_gate != null ? spec.value.readiness_gate : []
            content {
              condition_type = readiness_gate.value.condition_type
            }
          }
          restart_policy     = spec.value.restart_policy
          runtime_class_name = spec.value.runtime_class_name
          scheduler_name     = spec.value.scheduler_name
          dynamic "security_context" {
            for_each = spec.value.security_context != null ? [spec.value.security_context] : []
            content {
              fs_group               = security_context.value.fs_group
              fs_group_change_policy = security_context.value.fs_group_change_policy
              run_as_group           = security_context.value.run_as_group
              run_as_non_root        = security_context.value.run_as_non_root
              run_as_user            = security_context.value.run_as_user
              dynamic "se_linux_options" {
                for_each = security_context.value.se_linux_options != null ? [security_context.value.se_linux_options] : []
                content {
                  level = se_linux_options.value.level
                  role  = se_linux_options.value.role
                  type  = se_linux_options.value.type
                  user  = se_linux_options.value.user
                }
              }
              dynamic "seccomp_profile" {
                for_each = security_context.value.seccomp_profile != null ? [security_context.value.seccomp_profile] : []
                content {
                  localhost_profile = seccomp_profile.value.localhost_profile
                  type              = seccomp_profile.value.type
                }
              }
              supplemental_groups = security_context.value.supplemental_groups
              dynamic "sysctl" {
                for_each = security_context.value.sysctl != null ? security_context.value.sysctl : []
                content {
                  name  = sysctl.value.name
                  value = sysctl.value.value
                }
              }
              dynamic "windows_options" {
                for_each = security_context.value.windows_options != null ? [security_context.value.windows_options] : []
                content {
                  gmsa_credential_spec      = windows_options.value.gmsa_credential_spec
                  gmsa_credential_spec_name = windows_options.value.gmsa_credential_spec_name
                  host_process              = windows_options.value.host_process
                  run_as_username           = windows_options.value.run_as_username
                }
              }
            }
          }
          service_account_name             = spec.value.service_account_name
          share_process_namespace          = spec.value.share_process_namespace
          subdomain                        = spec.value.subdomain
          termination_grace_period_seconds = spec.value.termination_grace_period_seconds
          dynamic "toleration" {
            for_each = spec.value.toleration != null ? spec.value.toleration : []
            content {
              effect             = toleration.value.effect
              key                = toleration.value.key
              operator           = toleration.value.operator
              toleration_seconds = toleration.value.toleration_seconds
              value              = toleration.value.value
            }
          }
          dynamic "topology_spread_constraint" {
            for_each = spec.value.topology_spread_constraint != null ? spec.value.topology_spread_constraint : []
            content {
              dynamic "label_selector" {
                for_each = topology_spread_constraint.value.label_selector != null ? topology_spread_constraint.value.label_selector : []
                content {
                  dynamic "match_expressions" {
                    for_each = label_selector.value.match_expressions != null ? label_selector.value.match_expressions : []
                    content {
                      key      = match_expressions.value.key
                      operator = match_expressions.value.operator
                      values   = match_expressions.value.values
                    }
                  }
                  match_labels = label_selector.value.match_labels
                }
              }
              match_label_keys     = topology_spread_constraint.value.match_label_keys
              max_skew             = topology_spread_constraint.value.max_skew
              min_domains          = topology_spread_constraint.value.min_domains
              node_affinity_policy = topology_spread_constraint.value.node_affinity_policy
              node_taints_policy   = topology_spread_constraint.value.node_taints_policy
              topology_key         = topology_spread_constraint.value.topology_key
              when_unsatisfiable   = topology_spread_constraint.value.when_unsatisfiable
            }
          }
          dynamic "volume" {
            for_each = spec.value.volume != null ? spec.value.volume : []
            content {
              dynamic "aws_elastic_block_store" {
                for_each = volume.value.aws_elastic_block_store != null ? [volume.value.aws_elastic_block_store] : []
                content {
                  fs_type   = aws_elastic_block_store.value.fs_type
                  partition = aws_elastic_block_store.value.partition
                  read_only = aws_elastic_block_store.value.read_only
                  volume_id = aws_elastic_block_store.value.volume_id
                }
              }
              dynamic "azure_disk" {
                for_each = volume.value.azure_disk != null ? [volume.value.azure_disk] : []
                content {
                  caching_mode  = azure_disk.value.caching_mode
                  data_disk_uri = azure_disk.value.data_disk_uri
                  disk_name     = azure_disk.value.disk_name
                  fs_type       = azure_disk.value.fs_type
                  kind          = azure_disk.value.kind
                  read_only     = azure_disk.value.read_only
                }
              }
              dynamic "azure_file" {
                for_each = volume.value.azure_file != null ? [volume.value.azure_file] : []
                content {
                  read_only        = azure_file.value.read_only
                  secret_name      = azure_file.value.secret_name
                  secret_namespace = azure_file.value.secret_namespace
                  share_name       = azure_file.value.share_name
                }
              }
              dynamic "ceph_fs" {
                for_each = volume.value.ceph_fs != null ? [volume.value.ceph_fs] : []
                content {
                  monitors    = ceph_fs.value.monitors
                  path        = ceph_fs.value.path
                  read_only   = ceph_fs.value.read_only
                  secret_file = ceph_fs.value.secret_file
                  dynamic "secret_ref" {
                    for_each = ceph_fs.value.secret_ref != null ? [ceph_fs.value.secret_ref] : []
                    content {
                      name      = secret_ref.value.name
                      namespace = secret_ref.value.namespace
                    }
                  }
                  user = ceph_fs.value.user
                }
              }
              dynamic "cinder" {
                for_each = volume.value.cinder != null ? [volume.value.cinder] : []
                content {
                  fs_type   = cinder.value.fs_type
                  read_only = cinder.value.read_only
                  volume_id = cinder.value.volume_id
                }
              }
              dynamic "config_map" {
                for_each = volume.value.config_map != null ? [volume.value.config_map] : []
                content {
                  default_mode = config_map.value.default_mode
                  dynamic "items" {
                    for_each = config_map.value.items != null ? config_map.value.items : []
                    content {
                      key  = items.value.key
                      mode = items.value.mode
                      path = items.value.path
                    }
                  }
                  name     = config_map.value.name
                  optional = config_map.value.optional
                }
              }
              dynamic "csi" {
                for_each = volume.value.csi != null ? [volume.value.csi] : []
                content {
                  driver  = csi.value.driver
                  fs_type = csi.value.fs_type
                  dynamic "node_publish_secret_ref" {
                    for_each = csi.value.node_publish_secret_ref != null ? [csi.value.node_publish_secret_ref] : []
                    content {
                      name = node_publish_secret_ref.value.name
                    }
                  }
                  read_only         = csi.value.read_only
                  volume_attributes = csi.value.volume_attributes
                }
              }
              dynamic "downward_api" {
                for_each = volume.value.downward_api != null ? [volume.value.downward_api] : []
                content {
                  default_mode = downward_api.value.default_mode
                  dynamic "items" {
                    for_each = downward_api.value.items != null ? downward_api.value.items : []
                    content {
                      field_ref {
                        api_version = items.value.field_ref.api_version
                        field_path  = items.value.field_ref.field_path
                      }
                      mode = items.value.mode
                      path = items.value.path
                      dynamic "resource_field_ref" {
                        for_each = items.value.resource_field_ref != null ? [items.value.resource_field_ref] : []
                        content {
                          container_name = resource_field_ref.value.container_name
                          divisor        = resource_field_ref.value.divisor
                          resource       = resource_field_ref.value.resource
                        }
                      }
                    }
                  }
                }
              }
              dynamic "empty_dir" {
                for_each = volume.value.empty_dir != null ? [volume.value.empty_dir] : []
                content {
                  medium     = empty_dir.value.medium
                  size_limit = empty_dir.value.size_limit
                }
              }
              dynamic "ephemeral" {
                for_each = volume.value.ephemeral != null ? [volume.value.ephemeral] : []
                content {
                  volume_claim_template {
                    dynamic "metadata" {
                      for_each = ephemeral.value.volume_claim_template.metadata != null ? [ephemeral.value.volume_claim_template.metadata] : []
                      content {
                        annotations = metadata.value.annotations
                        labels      = metadata.value.labels
                      }
                    }
                    spec {
                      access_modes = ephemeral.value.volume_claim_template.spec.access_modes
                      resources {
                        limits   = ephemeral.value.volume_claim_template.spec.resources.limits
                        requests = ephemeral.value.volume_claim_template.spec.resources.requests
                      }
                      dynamic "selector" {
                        for_each = ephemeral.value.volume_claim_template.spec.selector != null ? [ephemeral.value.volume_claim_template.spec.selector] : []
                        content {
                          dynamic "match_expressions" {
                            for_each = selector.value.match_expressions != null ? selector.value.match_expressions : []
                            content {
                              key      = match_expressions.value.key
                              operator = match_expressions.value.operator
                              values   = match_expressions.value.values
                            }
                          }
                          match_labels = selector.value.match_labels
                        }
                      }
                      storage_class_name = ephemeral.value.volume_claim_template.spec.storage_class_name
                      volume_mode        = ephemeral.value.volume_claim_template.spec.volume_mode
                      volume_name        = ephemeral.value.volume_claim_template.spec.volume_name
                    }
                  }
                }
              }
              dynamic "fc" {
                for_each = volume.value.fc != null ? [volume.value.fc] : []
                content {
                  fs_type      = fc.value.fs_type
                  lun          = fc.value.lun
                  read_only    = fc.value.read_only
                  target_ww_ns = fc.value.target_ww_ns
                }
              }
              dynamic "flex_volume" {
                for_each = volume.value.flex_volume != null ? [volume.value.flex_volume] : []
                content {
                  driver    = flex_volume.value.driver
                  fs_type   = flex_volume.value.fs_type
                  options   = flex_volume.value.options
                  read_only = flex_volume.value.read_only
                  dynamic "secret_ref" {
                    for_each = flex_volume.value.secret_ref != null ? [flex_volume.value.secret_ref] : []
                    content {
                      name      = secret_ref.value.name
                      namespace = secret_ref.value.namespace
                    }
                  }
                }
              }
              dynamic "flocker" {
                for_each = volume.value.flocker != null ? [volume.value.flocker] : []
                content {
                  dataset_name = flocker.value.dataset_name
                  dataset_uuid = flocker.value.dataset_uuid
                }
              }
              dynamic "gce_persistent_disk" {
                for_each = volume.value.gce_persistent_disk != null ? [volume.value.gce_persistent_disk] : []
                content {
                  fs_type   = gce_persistent_disk.value.fs_type
                  partition = gce_persistent_disk.value.partition
                  pd_name   = gce_persistent_disk.value.pd_name
                  read_only = gce_persistent_disk.value.read_only
                }
              }
              dynamic "git_repo" {
                for_each = volume.value.git_repo != null ? [volume.value.git_repo] : []
                content {
                  directory  = git_repo.value.directory
                  repository = git_repo.value.repository
                  revision   = git_repo.value.revision
                }
              }
              dynamic "glusterfs" {
                for_each = volume.value.glusterfs != null ? [volume.value.glusterfs] : []
                content {
                  endpoints_name = glusterfs.value.endpoints_name
                  path           = glusterfs.value.path
                  read_only      = glusterfs.value.read_only
                }
              }
              dynamic "host_path" {
                for_each = volume.value.host_path != null ? [volume.value.host_path] : []
                content {
                  path = host_path.value.path
                  type = host_path.value.type
                }
              }
              dynamic "iscsi" {
                for_each = volume.value.iscsi != null ? [volume.value.iscsi] : []
                content {
                  fs_type         = iscsi.value.fs_type
                  iqn             = iscsi.value.iqn
                  iscsi_interface = iscsi.value.iscsi_interface
                  lun             = iscsi.value.lun
                  read_only       = iscsi.value.read_only
                  target_portal   = iscsi.value.target_portal
                }
              }
              dynamic "local" {
                for_each = volume.value.local != null ? [volume.value.local] : []
                content {
                  path = local.value.path
                }
              }
              name = volume.value.name
              dynamic "nfs" {
                for_each = volume.value.nfs != null ? [volume.value.nfs] : []
                content {
                  path      = nfs.value.path
                  read_only = nfs.value.read_only
                  server    = nfs.value.server
                }
              }
              dynamic "persistent_volume_claim" {
                for_each = volume.value.persistent_volume_claim != null ? [volume.value.persistent_volume_claim] : []
                content {
                  claim_name = persistent_volume_claim.value.claim_name
                  read_only  = persistent_volume_claim.value.read_only
                }
              }
              dynamic "photon_persistent_disk" {
                for_each = volume.value.photon_persistent_disk != null ? [volume.value.photon_persistent_disk] : []
                content {
                  fs_type = photon_persistent_disk.value.fs_type
                  pd_id   = photon_persistent_disk.value.pd_id
                }
              }
              dynamic "projected" {
                for_each = volume.value.projected != null ? volume.value.projected : []
                content {
                  default_mode = projected.value.default_mode
                  dynamic "sources" {
                    for_each = projected.value.sources
                    content {
                      dynamic "config_map" {
                        for_each = sources.value.config_map != null ? sources.value.config_map : []
                        content {
                          dynamic "items" {
                            for_each = config_map.value.items != null ? config_map.value.items : []
                            content {
                              key  = items.value.key
                              mode = items.value.mode
                              path = items.value.path
                            }
                          }
                          name     = config_map.value.name
                          optional = config_map.value.optional
                        }
                      }
                      dynamic "downward_api" {
                        for_each = sources.value.downward_api != null ? [sources.value.downward_api] : []
                        content {
                          dynamic "items" {
                            for_each = downward_api.value.items != null ? downward_api.value.items : []
                            content {
                              dynamic "field_ref" {
                                for_each = items.value.field_ref != null ? [items.value.field_ref] : []
                                content {
                                  api_version = field_ref.value.api_version
                                  field_path  = field_ref.value.field_path
                                }
                              }
                              mode = items.value.mode
                              path = items.value.path
                              dynamic "resource_field_ref" {
                                for_each = items.value.resource_field_ref != null ? [items.value.resource_field_ref] : []
                                content {
                                  container_name = resource_field_ref.value.container_name
                                  divisor        = resource_field_ref.value.divisor
                                  resource       = resource_field_ref.value.resource
                                }
                              }
                            }
                          }
                        }
                      }
                      dynamic "secret" {
                        for_each = sources.value.secret != null ? sources.value.secret : []
                        content {
                          dynamic "items" {
                            for_each = secret.value.items != null ? secret.value.items : []
                            content {
                              key  = items.value.key
                              mode = items.value.mode
                              path = items.value.path
                            }
                          }
                          name     = secret.value.name
                          optional = secret.value.optional
                        }
                      }
                      dynamic "service_account_token" {
                        for_each = sources.value.service_account_token != null ? [sources.value.service_account_token] : []
                        content {
                          audience           = service_account_token.value.audience
                          expiration_seconds = service_account_token.value.expiration_seconds
                          path               = service_account_token.value.path
                        }
                      }
                    }
                  }
                }
              }
              dynamic "quobyte" {
                for_each = volume.value.quobyte != null ? [volume.value.quobyte] : []
                content {
                  group     = quobyte.value.group
                  read_only = quobyte.value.read_only
                  registry  = quobyte.value.registry
                  user      = quobyte.value.user
                  volume    = quobyte.value.volume
                }
              }
              dynamic "rbd" {
                for_each = volume.value.rbd != null ? [volume.value.rbd] : []
                content {
                  ceph_monitors = rbd.value.ceph_monitors
                  fs_type       = rbd.value.fs_type
                  keyring       = rbd.value.keyring
                  rados_user    = rbd.value.rados_user
                  rbd_image     = rbd.value.rbd_image
                  rbd_pool      = rbd.value.rbd_pool
                  read_only     = rbd.value.read_only
                  dynamic "secret_ref" {
                    for_each = rbd.value.secret_ref != null ? [rbd.value.secret_ref] : []
                    content {
                      name      = secret_ref.value.name
                      namespace = secret_ref.value.namespace
                    }
                  }
                }
              }
              dynamic "secret" {
                for_each = volume.value.secret != null ? [volume.value.secret] : []
                content {
                  default_mode = secret.value.default_mode
                  dynamic "items" {
                    for_each = secret.value.items != null ? secret.value.items : []
                    content {
                      key  = items.value.key
                      mode = items.value.mode
                      path = items.value.path
                    }
                  }
                  optional    = secret.value.optional
                  secret_name = secret.value.secret_name
                }
              }
              dynamic "vsphere_volume" {
                for_each = volume.value.vsphere_volume != null ? [volume.value.vsphere_volume] : []
                content {
                  fs_type     = vsphere_volume.value.fs_type
                  volume_path = vsphere_volume.value.volume_path
                }
              }
            }
          }
        }
      }
    }
    dynamic "update_strategy" {
      for_each = each.value.spec.update_strategy != null ? each.value.spec.update_strategy : []
      content {
        dynamic "rolling_update" {
          for_each = update_strategy.value.rolling_update != null ? update_strategy.value.rolling_update : []
          content {
            partition = rolling_update.value.partition
          }
        }
        type = update_strategy.value.type
      }
    }
    dynamic "volume_claim_template" {
      for_each = each.value.spec.volume_claim_template != null ? each.value.spec.volume_claim_template : []
      content {
        metadata {
          annotations   = volume_claim_template.value.metadata.annotations
          generate_name = volume_claim_template.value.metadata.generate_name
          labels        = volume_claim_template.value.metadata.labels
          name          = volume_claim_template.value.metadata.name
          namespace     = volume_claim_template.value.metadata.namespace
        }
        spec {
          access_modes = volume_claim_template.value.spec.access_modes
          resources {
            limits   = volume_claim_template.value.spec.resources.limits
            requests = volume_claim_template.value.spec.resources.requests
          }
          dynamic "selector" {
            for_each = volume_claim_template.value.spec.selector != null ? [volume_claim_template.value.spec.selector] : []
            content {
              dynamic "match_expressions" {
                for_each = selector.value.match_expressions != null ? selector.value.match_expressions : []
                content {
                  key      = match_expressions.value.key
                  operator = match_expressions.value.operator
                  values   = match_expressions.value.values
                }
              }
              match_labels = selector.value.match_labels
            }
          }
          storage_class_name = volume_claim_template.value.spec.storage_class_name
          volume_mode        = volume_claim_template.value.spec.volume_mode
          volume_name        = volume_claim_template.value.spec.volume_name
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

