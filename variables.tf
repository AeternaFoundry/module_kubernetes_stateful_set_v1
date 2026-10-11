variable "stateful_set_v1s" {
  description = <<EOT
Map of stateful_set_v1s, attributes below
Required:
    - metadata (block):
        - annotations (optional)
        - generate_name (optional)
        - labels (optional)
        - name (optional)
        - namespace (optional)
    - spec (block):
        - min_ready_seconds (optional)
        - persistent_volume_claim_retention_policy (optional, block):
            - when_deleted (optional)
            - when_scaled (optional)
        - pod_management_policy (optional)
        - replicas (optional)
        - revision_history_limit (optional)
        - selector (required, block):
            - match_expressions (optional, block):
                - key (optional)
                - operator (optional)
                - values (optional)
            - match_labels (optional)
        - service_name (required)
        - template (required, block):
            - metadata (required, block):
                - annotations (optional)
                - generate_name (optional)
                - labels (optional)
                - name (optional)
                - namespace (optional)
            - spec (optional, block):
                - active_deadline_seconds (optional)
                - affinity (optional, block):
                    - node_affinity (optional, block):
                        - preferred_during_scheduling_ignored_during_execution (optional, block):
                            - preference (required, block):
                                - match_expressions (optional, block):
                                    - key (optional)
                                    - operator (optional)
                                    - values (optional)
                                - match_fields (optional, block):
                                    - key (required)
                                    - operator (required)
                                    - values (optional)
                            - weight (required)
                        - required_during_scheduling_ignored_during_execution (optional, block):
                            - node_selector_term (optional, block):
                                - match_expressions (optional, block):
                                    - key (optional)
                                    - operator (optional)
                                    - values (optional)
                                - match_fields (optional, block):
                                    - key (required)
                                    - operator (required)
                                    - values (optional)
                    - pod_affinity (optional, block):
                        - preferred_during_scheduling_ignored_during_execution (optional, block):
                            - pod_affinity_term (required, block):
                                - label_selector (optional, block):
                                    - match_expressions (optional, block):
                                        - key (optional)
                                        - operator (optional)
                                        - values (optional)
                                    - match_labels (optional)
                                - namespace_selector (optional, block):
                                    - match_expressions (optional, block):
                                        - key (optional)
                                        - operator (optional)
                                        - values (optional)
                                    - match_labels (optional)
                                - namespaces (optional)
                                - topology_key (required)
                            - weight (required)
                        - required_during_scheduling_ignored_during_execution (optional, block):
                            - label_selector (optional, block):
                                - match_expressions (optional, block):
                                    - key (optional)
                                    - operator (optional)
                                    - values (optional)
                                - match_labels (optional)
                            - namespace_selector (optional, block):
                                - match_expressions (optional, block):
                                    - key (optional)
                                    - operator (optional)
                                    - values (optional)
                                - match_labels (optional)
                            - namespaces (optional)
                            - topology_key (required)
                    - pod_anti_affinity (optional, block):
                        - preferred_during_scheduling_ignored_during_execution (optional, block):
                            - pod_affinity_term (required, block):
                                - label_selector (optional, block):
                                    - match_expressions (optional, block):
                                        - key (optional)
                                        - operator (optional)
                                        - values (optional)
                                    - match_labels (optional)
                                - namespace_selector (optional, block):
                                    - match_expressions (optional, block):
                                        - key (optional)
                                        - operator (optional)
                                        - values (optional)
                                    - match_labels (optional)
                                - namespaces (optional)
                                - topology_key (required)
                            - weight (required)
                        - required_during_scheduling_ignored_during_execution (optional, block):
                            - label_selector (optional, block):
                                - match_expressions (optional, block):
                                    - key (optional)
                                    - operator (optional)
                                    - values (optional)
                                - match_labels (optional)
                            - namespace_selector (optional, block):
                                - match_expressions (optional, block):
                                    - key (optional)
                                    - operator (optional)
                                    - values (optional)
                                - match_labels (optional)
                            - namespaces (optional)
                            - topology_key (required)
                - automount_service_account_token (optional)
                - container (optional, block):
                    - args (optional)
                    - command (optional)
                    - env (optional, block):
                        - name (required)
                        - value (optional)
                        - value_from (optional, block):
                            - config_map_key_ref (optional, block):
                                - key (optional)
                                - name (optional)
                                - optional (optional)
                            - field_ref (optional, block):
                                - api_version (optional)
                                - field_path (optional)
                            - resource_field_ref (optional, block):
                                - container_name (optional)
                                - divisor (optional)
                                - resource (required)
                            - secret_key_ref (optional, block):
                                - key (optional)
                                - name (optional)
                                - optional (optional)
                    - env_from (optional, block):
                        - config_map_ref (optional, block):
                            - name (required)
                            - optional (optional)
                        - prefix (optional)
                        - secret_ref (optional, block):
                            - name (required)
                            - optional (optional)
                    - image (optional)
                    - image_pull_policy (optional)
                    - lifecycle (optional, block):
                        - post_start (optional, block):
                            - exec (optional, block):
                                - command (optional)
                            - http_get (optional, block):
                                - host (optional)
                                - http_header (optional, block):
                                    - name (optional)
                                    - value (optional)
                                - path (optional)
                                - port (optional)
                                - scheme (optional)
                            - tcp_socket (optional, block):
                                - port (required)
                        - pre_stop (optional, block):
                            - exec (optional, block):
                                - command (optional)
                            - http_get (optional, block):
                                - host (optional)
                                - http_header (optional, block):
                                    - name (optional)
                                    - value (optional)
                                - path (optional)
                                - port (optional)
                                - scheme (optional)
                            - tcp_socket (optional, block):
                                - port (required)
                    - liveness_probe (optional, block):
                        - exec (optional, block):
                            - command (optional)
                        - failure_threshold (optional)
                        - grpc (optional, block):
                            - port (required)
                            - service (optional)
                        - http_get (optional, block):
                            - host (optional)
                            - http_header (optional, block):
                                - name (optional)
                                - value (optional)
                            - path (optional)
                            - port (optional)
                            - scheme (optional)
                        - initial_delay_seconds (optional)
                        - period_seconds (optional)
                        - success_threshold (optional)
                        - tcp_socket (optional, block):
                            - port (required)
                        - timeout_seconds (optional)
                    - name (required)
                    - port (optional, block):
                        - container_port (required)
                        - host_ip (optional)
                        - host_port (optional)
                        - name (optional)
                        - protocol (optional)
                    - readiness_probe (optional, block):
                        - exec (optional, block):
                            - command (optional)
                        - failure_threshold (optional)
                        - grpc (optional, block):
                            - port (required)
                            - service (optional)
                        - http_get (optional, block):
                            - host (optional)
                            - http_header (optional, block):
                                - name (optional)
                                - value (optional)
                            - path (optional)
                            - port (optional)
                            - scheme (optional)
                        - initial_delay_seconds (optional)
                        - period_seconds (optional)
                        - success_threshold (optional)
                        - tcp_socket (optional, block):
                            - port (required)
                        - timeout_seconds (optional)
                    - resources (optional, block):
                        - limits (optional)
                        - requests (optional)
                    - restart_policy (optional)
                    - security_context (optional, block):
                        - allow_privilege_escalation (optional)
                        - capabilities (optional, block):
                            - add (optional)
                            - drop (optional)
                        - privileged (optional)
                        - read_only_root_filesystem (optional)
                        - run_as_group (optional)
                        - run_as_non_root (optional)
                        - run_as_user (optional)
                        - se_linux_options (optional, block):
                            - level (optional)
                            - role (optional)
                            - type (optional)
                            - user (optional)
                        - seccomp_profile (optional, block):
                            - localhost_profile (optional)
                            - type (optional)
                    - startup_probe (optional, block):
                        - exec (optional, block):
                            - command (optional)
                        - failure_threshold (optional)
                        - grpc (optional, block):
                            - port (required)
                            - service (optional)
                        - http_get (optional, block):
                            - host (optional)
                            - http_header (optional, block):
                                - name (optional)
                                - value (optional)
                            - path (optional)
                            - port (optional)
                            - scheme (optional)
                        - initial_delay_seconds (optional)
                        - period_seconds (optional)
                        - success_threshold (optional)
                        - tcp_socket (optional, block):
                            - port (required)
                        - timeout_seconds (optional)
                    - stdin (optional)
                    - stdin_once (optional)
                    - termination_message_path (optional)
                    - termination_message_policy (optional)
                    - tty (optional)
                    - volume_device (optional, block):
                        - device_path (required)
                        - name (required)
                    - volume_mount (optional, block):
                        - mount_path (required)
                        - mount_propagation (optional)
                        - name (required)
                        - read_only (optional)
                        - sub_path (optional)
                        - sub_path_expr (optional)
                    - working_dir (optional)
                - dns_config (optional, block):
                    - nameservers (optional)
                    - option (optional, block):
                        - name (required)
                        - value (optional)
                    - searches (optional)
                - dns_policy (optional)
                - enable_service_links (optional)
                - host_aliases (optional, block):
                    - hostnames (required)
                    - ip (required)
                - host_ipc (optional)
                - host_network (optional)
                - host_pid (optional)
                - hostname (optional)
                - image_pull_secrets (optional, block):
                    - name (required)
                - init_container (optional, block):
                    - args (optional)
                    - command (optional)
                    - env (optional, block):
                        - name (required)
                        - value (optional)
                        - value_from (optional, block):
                            - config_map_key_ref (optional, block):
                                - key (optional)
                                - name (optional)
                                - optional (optional)
                            - field_ref (optional, block):
                                - api_version (optional)
                                - field_path (optional)
                            - resource_field_ref (optional, block):
                                - container_name (optional)
                                - divisor (optional)
                                - resource (required)
                            - secret_key_ref (optional, block):
                                - key (optional)
                                - name (optional)
                                - optional (optional)
                    - env_from (optional, block):
                        - config_map_ref (optional, block):
                            - name (required)
                            - optional (optional)
                        - prefix (optional)
                        - secret_ref (optional, block):
                            - name (required)
                            - optional (optional)
                    - image (optional)
                    - image_pull_policy (optional)
                    - lifecycle (optional, block):
                        - post_start (optional, block):
                            - exec (optional, block):
                                - command (optional)
                            - http_get (optional, block):
                                - host (optional)
                                - http_header (optional, block):
                                    - name (optional)
                                    - value (optional)
                                - path (optional)
                                - port (optional)
                                - scheme (optional)
                            - tcp_socket (optional, block):
                                - port (required)
                        - pre_stop (optional, block):
                            - exec (optional, block):
                                - command (optional)
                            - http_get (optional, block):
                                - host (optional)
                                - http_header (optional, block):
                                    - name (optional)
                                    - value (optional)
                                - path (optional)
                                - port (optional)
                                - scheme (optional)
                            - tcp_socket (optional, block):
                                - port (required)
                    - liveness_probe (optional, block):
                        - exec (optional, block):
                            - command (optional)
                        - failure_threshold (optional)
                        - grpc (optional, block):
                            - port (required)
                            - service (optional)
                        - http_get (optional, block):
                            - host (optional)
                            - http_header (optional, block):
                                - name (optional)
                                - value (optional)
                            - path (optional)
                            - port (optional)
                            - scheme (optional)
                        - initial_delay_seconds (optional)
                        - period_seconds (optional)
                        - success_threshold (optional)
                        - tcp_socket (optional, block):
                            - port (required)
                        - timeout_seconds (optional)
                    - name (required)
                    - port (optional, block):
                        - container_port (required)
                        - host_ip (optional)
                        - host_port (optional)
                        - name (optional)
                        - protocol (optional)
                    - readiness_probe (optional, block):
                        - exec (optional, block):
                            - command (optional)
                        - failure_threshold (optional)
                        - grpc (optional, block):
                            - port (required)
                            - service (optional)
                        - http_get (optional, block):
                            - host (optional)
                            - http_header (optional, block):
                                - name (optional)
                                - value (optional)
                            - path (optional)
                            - port (optional)
                            - scheme (optional)
                        - initial_delay_seconds (optional)
                        - period_seconds (optional)
                        - success_threshold (optional)
                        - tcp_socket (optional, block):
                            - port (required)
                        - timeout_seconds (optional)
                    - resources (optional, block):
                        - limits (optional)
                        - requests (optional)
                    - restart_policy (optional)
                    - security_context (optional, block):
                        - allow_privilege_escalation (optional)
                        - capabilities (optional, block):
                            - add (optional)
                            - drop (optional)
                        - privileged (optional)
                        - read_only_root_filesystem (optional)
                        - run_as_group (optional)
                        - run_as_non_root (optional)
                        - run_as_user (optional)
                        - se_linux_options (optional, block):
                            - level (optional)
                            - role (optional)
                            - type (optional)
                            - user (optional)
                        - seccomp_profile (optional, block):
                            - localhost_profile (optional)
                            - type (optional)
                    - startup_probe (optional, block):
                        - exec (optional, block):
                            - command (optional)
                        - failure_threshold (optional)
                        - grpc (optional, block):
                            - port (required)
                            - service (optional)
                        - http_get (optional, block):
                            - host (optional)
                            - http_header (optional, block):
                                - name (optional)
                                - value (optional)
                            - path (optional)
                            - port (optional)
                            - scheme (optional)
                        - initial_delay_seconds (optional)
                        - period_seconds (optional)
                        - success_threshold (optional)
                        - tcp_socket (optional, block):
                            - port (required)
                        - timeout_seconds (optional)
                    - stdin (optional)
                    - stdin_once (optional)
                    - termination_message_path (optional)
                    - termination_message_policy (optional)
                    - tty (optional)
                    - volume_device (optional, block):
                        - device_path (required)
                        - name (required)
                    - volume_mount (optional, block):
                        - mount_path (required)
                        - mount_propagation (optional)
                        - name (required)
                        - read_only (optional)
                        - sub_path (optional)
                        - sub_path_expr (optional)
                    - working_dir (optional)
                - node_name (optional)
                - node_selector (optional)
                - os (optional, block):
                    - name (required)
                - priority_class_name (optional)
                - readiness_gate (optional, block):
                    - condition_type (required)
                - restart_policy (optional)
                - runtime_class_name (optional)
                - scheduler_name (optional)
                - security_context (optional, block):
                    - fs_group (optional)
                    - fs_group_change_policy (optional)
                    - run_as_group (optional)
                    - run_as_non_root (optional)
                    - run_as_user (optional)
                    - se_linux_options (optional, block):
                        - level (optional)
                        - role (optional)
                        - type (optional)
                        - user (optional)
                    - seccomp_profile (optional, block):
                        - localhost_profile (optional)
                        - type (optional)
                    - supplemental_groups (optional)
                    - sysctl (optional, block):
                        - name (required)
                        - value (required)
                    - windows_options (optional, block):
                        - gmsa_credential_spec (optional)
                        - gmsa_credential_spec_name (optional)
                        - host_process (optional)
                        - run_as_username (optional)
                - service_account_name (optional)
                - share_process_namespace (optional)
                - subdomain (optional)
                - termination_grace_period_seconds (optional)
                - toleration (optional, block):
                    - effect (optional)
                    - key (optional)
                    - operator (optional)
                    - toleration_seconds (optional)
                    - value (optional)
                - topology_spread_constraint (optional, block):
                    - label_selector (optional, block):
                        - match_expressions (optional, block):
                            - key (optional)
                            - operator (optional)
                            - values (optional)
                        - match_labels (optional)
                    - match_label_keys (optional)
                    - max_skew (optional)
                    - min_domains (optional)
                    - node_affinity_policy (optional)
                    - node_taints_policy (optional)
                    - topology_key (optional)
                    - when_unsatisfiable (optional)
                - volume (optional, block):
                    - aws_elastic_block_store (optional, block):
                        - fs_type (optional)
                        - partition (optional)
                        - read_only (optional)
                        - volume_id (required)
                    - azure_disk (optional, block):
                        - caching_mode (required)
                        - data_disk_uri (required)
                        - disk_name (required)
                        - fs_type (optional)
                        - kind (optional)
                        - read_only (optional)
                    - azure_file (optional, block):
                        - read_only (optional)
                        - secret_name (required)
                        - secret_namespace (optional)
                        - share_name (required)
                    - ceph_fs (optional, block):
                        - monitors (required)
                        - path (optional)
                        - read_only (optional)
                        - secret_file (optional)
                        - secret_ref (optional, block):
                            - name (optional)
                            - namespace (optional)
                        - user (optional)
                    - cinder (optional, block):
                        - fs_type (optional)
                        - read_only (optional)
                        - volume_id (required)
                    - config_map (optional, block):
                        - default_mode (optional)
                        - items (optional, block):
                            - key (optional)
                            - mode (optional)
                            - path (optional)
                        - name (optional)
                        - optional (optional)
                    - csi (optional, block):
                        - driver (required)
                        - fs_type (optional)
                        - node_publish_secret_ref (optional, block):
                            - name (optional)
                        - read_only (optional)
                        - volume_attributes (optional)
                    - downward_api (optional, block):
                        - default_mode (optional)
                        - items (optional, block):
                            - field_ref (required, block):
                                - api_version (optional)
                                - field_path (optional)
                            - mode (optional)
                            - path (required)
                            - resource_field_ref (optional, block):
                                - container_name (required)
                                - divisor (optional)
                                - resource (required)
                    - empty_dir (optional, block):
                        - medium (optional)
                        - size_limit (optional)
                    - ephemeral (optional, block):
                        - volume_claim_template (required, block):
                            - metadata (optional, block):
                                - annotations (optional)
                                - labels (optional)
                            - spec (required, block):
                                - access_modes (required)
                                - resources (required, block):
                                    - limits (optional)
                                    - requests (optional)
                                - selector (optional, block):
                                    - match_expressions (optional, block):
                                        - key (optional)
                                        - operator (optional)
                                        - values (optional)
                                    - match_labels (optional)
                                - storage_class_name (optional)
                                - volume_mode (optional)
                                - volume_name (optional)
                    - fc (optional, block):
                        - fs_type (optional)
                        - lun (required)
                        - read_only (optional)
                        - target_ww_ns (required)
                    - flex_volume (optional, block):
                        - driver (required)
                        - fs_type (optional)
                        - options (optional)
                        - read_only (optional)
                        - secret_ref (optional, block):
                            - name (optional)
                            - namespace (optional)
                    - flocker (optional, block):
                        - dataset_name (optional)
                        - dataset_uuid (optional)
                    - gce_persistent_disk (optional, block):
                        - fs_type (optional)
                        - partition (optional)
                        - pd_name (required)
                        - read_only (optional)
                    - git_repo (optional, block):
                        - directory (optional)
                        - repository (optional)
                        - revision (optional)
                    - glusterfs (optional, block):
                        - endpoints_name (required)
                        - path (required)
                        - read_only (optional)
                    - host_path (optional, block):
                        - path (optional)
                        - type (optional)
                    - iscsi (optional, block):
                        - fs_type (optional)
                        - iqn (required)
                        - iscsi_interface (optional)
                        - lun (optional)
                        - read_only (optional)
                        - target_portal (required)
                    - local (optional, block):
                        - path (optional)
                    - name (optional)
                    - nfs (optional, block):
                        - path (required)
                        - read_only (optional)
                        - server (required)
                    - persistent_volume_claim (optional, block):
                        - claim_name (optional)
                        - read_only (optional)
                    - photon_persistent_disk (optional, block):
                        - fs_type (optional)
                        - pd_id (required)
                    - projected (optional, block):
                        - default_mode (optional)
                        - sources (required, block):
                            - config_map (optional, block):
                                - items (optional, block):
                                    - key (optional)
                                    - mode (optional)
                                    - path (optional)
                                - name (optional)
                                - optional (optional)
                            - downward_api (optional, block):
                                - items (optional, block):
                                    - field_ref (optional, block):
                                        - api_version (optional)
                                        - field_path (optional)
                                    - mode (optional)
                                    - path (required)
                                    - resource_field_ref (optional, block):
                                        - container_name (required)
                                        - divisor (optional)
                                        - resource (required)
                            - secret (optional, block):
                                - items (optional, block):
                                    - key (optional)
                                    - mode (optional)
                                    - path (optional)
                                - name (optional)
                                - optional (optional)
                            - service_account_token (optional, block):
                                - audience (optional)
                                - expiration_seconds (optional)
                                - path (required)
                    - quobyte (optional, block):
                        - group (optional)
                        - read_only (optional)
                        - registry (required)
                        - user (optional)
                        - volume (required)
                    - rbd (optional, block):
                        - ceph_monitors (required)
                        - fs_type (optional)
                        - keyring (optional)
                        - rados_user (optional)
                        - rbd_image (required)
                        - rbd_pool (optional)
                        - read_only (optional)
                        - secret_ref (optional, block):
                            - name (optional)
                            - namespace (optional)
                    - secret (optional, block):
                        - default_mode (optional)
                        - items (optional, block):
                            - key (optional)
                            - mode (optional)
                            - path (optional)
                        - optional (optional)
                        - secret_name (optional)
                    - vsphere_volume (optional, block):
                        - fs_type (optional)
                        - volume_path (required)
        - update_strategy (optional, block):
            - rolling_update (optional, block):
                - partition (optional)
            - type (optional)
        - volume_claim_template (optional, block):
            - metadata (required, block):
                - annotations (optional)
                - generate_name (optional)
                - labels (optional)
                - name (optional)
                - namespace (optional)
            - spec (required, block):
                - access_modes (required)
                - resources (required, block):
                    - limits (optional)
                    - requests (optional)
                - selector (optional, block):
                    - match_expressions (optional, block):
                        - key (optional)
                        - operator (optional)
                        - values (optional)
                    - match_labels (optional)
                - storage_class_name (optional)
                - volume_mode (optional)
                - volume_name (optional)
Optional:
    - wait_for_rollout
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - read (optional)
        - update (optional)
EOT

  type = map(object({
    wait_for_rollout = optional(bool)
    metadata = object({
      annotations   = optional(map(string))
      generate_name = optional(string)
      labels        = optional(map(string))
      name          = optional(string)
      namespace     = optional(string)
    })
    spec = object({
      min_ready_seconds = optional(number)
      persistent_volume_claim_retention_policy = optional(list(object({
        when_deleted = optional(string)
        when_scaled  = optional(string)
      })))
      pod_management_policy  = optional(string)
      replicas               = optional(string)
      revision_history_limit = optional(number)
      selector = object({
        match_expressions = optional(list(object({
          key      = optional(string)
          operator = optional(string)
          values   = optional(set(string))
        })))
        match_labels = optional(map(string))
      })
      service_name = string
      template = object({
        metadata = object({
          annotations   = optional(map(string))
          generate_name = optional(string)
          labels        = optional(map(string))
          name          = optional(string)
          namespace     = optional(string)
        })
        spec = optional(object({
          active_deadline_seconds = optional(number)
          affinity = optional(object({
            node_affinity = optional(object({
              preferred_during_scheduling_ignored_during_execution = optional(list(object({
                preference = object({
                  match_expressions = optional(list(object({
                    key      = optional(string)
                    operator = optional(string)
                    values   = optional(set(string))
                  })))
                  match_fields = optional(list(object({
                    key      = string
                    operator = string
                    values   = optional(set(string))
                  })))
                })
                weight = number
              })))
              required_during_scheduling_ignored_during_execution = optional(object({
                node_selector_term = optional(list(object({
                  match_expressions = optional(list(object({
                    key      = optional(string)
                    operator = optional(string)
                    values   = optional(set(string))
                  })))
                  match_fields = optional(list(object({
                    key      = string
                    operator = string
                    values   = optional(set(string))
                  })))
                })))
              }))
            }))
            pod_affinity = optional(object({
              preferred_during_scheduling_ignored_during_execution = optional(list(object({
                pod_affinity_term = object({
                  label_selector = optional(list(object({
                    match_expressions = optional(list(object({
                      key      = optional(string)
                      operator = optional(string)
                      values   = optional(set(string))
                    })))
                    match_labels = optional(map(string))
                  })))
                  namespace_selector = optional(list(object({
                    match_expressions = optional(list(object({
                      key      = optional(string)
                      operator = optional(string)
                      values   = optional(set(string))
                    })))
                    match_labels = optional(map(string))
                  })))
                  namespaces   = optional(set(string))
                  topology_key = string
                })
                weight = number
              })))
              required_during_scheduling_ignored_during_execution = optional(list(object({
                label_selector = optional(list(object({
                  match_expressions = optional(list(object({
                    key      = optional(string)
                    operator = optional(string)
                    values   = optional(set(string))
                  })))
                  match_labels = optional(map(string))
                })))
                namespace_selector = optional(list(object({
                  match_expressions = optional(list(object({
                    key      = optional(string)
                    operator = optional(string)
                    values   = optional(set(string))
                  })))
                  match_labels = optional(map(string))
                })))
                namespaces   = optional(set(string))
                topology_key = string
              })))
            }))
            pod_anti_affinity = optional(object({
              preferred_during_scheduling_ignored_during_execution = optional(list(object({
                pod_affinity_term = object({
                  label_selector = optional(list(object({
                    match_expressions = optional(list(object({
                      key      = optional(string)
                      operator = optional(string)
                      values   = optional(set(string))
                    })))
                    match_labels = optional(map(string))
                  })))
                  namespace_selector = optional(list(object({
                    match_expressions = optional(list(object({
                      key      = optional(string)
                      operator = optional(string)
                      values   = optional(set(string))
                    })))
                    match_labels = optional(map(string))
                  })))
                  namespaces   = optional(set(string))
                  topology_key = string
                })
                weight = number
              })))
              required_during_scheduling_ignored_during_execution = optional(list(object({
                label_selector = optional(list(object({
                  match_expressions = optional(list(object({
                    key      = optional(string)
                    operator = optional(string)
                    values   = optional(set(string))
                  })))
                  match_labels = optional(map(string))
                })))
                namespace_selector = optional(list(object({
                  match_expressions = optional(list(object({
                    key      = optional(string)
                    operator = optional(string)
                    values   = optional(set(string))
                  })))
                  match_labels = optional(map(string))
                })))
                namespaces   = optional(set(string))
                topology_key = string
              })))
            }))
          }))
          automount_service_account_token = optional(bool)
          container = optional(list(object({
            args    = optional(list(string))
            command = optional(list(string))
            env = optional(list(object({
              name  = string
              value = optional(string)
              value_from = optional(object({
                config_map_key_ref = optional(object({
                  key      = optional(string)
                  name     = optional(string)
                  optional = optional(bool)
                }))
                field_ref = optional(object({
                  api_version = optional(string)
                  field_path  = optional(string)
                }))
                resource_field_ref = optional(object({
                  container_name = optional(string)
                  divisor        = optional(string)
                  resource       = string
                }))
                secret_key_ref = optional(object({
                  key      = optional(string)
                  name     = optional(string)
                  optional = optional(bool)
                }))
              }))
            })))
            env_from = optional(list(object({
              config_map_ref = optional(object({
                name     = string
                optional = optional(bool)
              }))
              prefix = optional(string)
              secret_ref = optional(object({
                name     = string
                optional = optional(bool)
              }))
            })))
            image             = optional(string)
            image_pull_policy = optional(string)
            lifecycle = optional(object({
              post_start = optional(list(object({
                exec = optional(object({
                  command = optional(list(string))
                }))
                http_get = optional(object({
                  host = optional(string)
                  http_header = optional(list(object({
                    name  = optional(string)
                    value = optional(string)
                  })))
                  path   = optional(string)
                  port   = optional(string)
                  scheme = optional(string)
                }))
                tcp_socket = optional(list(object({
                  port = string
                })))
              })))
              pre_stop = optional(list(object({
                exec = optional(object({
                  command = optional(list(string))
                }))
                http_get = optional(object({
                  host = optional(string)
                  http_header = optional(list(object({
                    name  = optional(string)
                    value = optional(string)
                  })))
                  path   = optional(string)
                  port   = optional(string)
                  scheme = optional(string)
                }))
                tcp_socket = optional(list(object({
                  port = string
                })))
              })))
            }))
            liveness_probe = optional(object({
              exec = optional(object({
                command = optional(list(string))
              }))
              failure_threshold = optional(number)
              grpc = optional(list(object({
                port    = number
                service = optional(string)
              })))
              http_get = optional(object({
                host = optional(string)
                http_header = optional(list(object({
                  name  = optional(string)
                  value = optional(string)
                })))
                path   = optional(string)
                port   = optional(string)
                scheme = optional(string)
              }))
              initial_delay_seconds = optional(number)
              period_seconds        = optional(number)
              success_threshold     = optional(number)
              tcp_socket = optional(list(object({
                port = string
              })))
              timeout_seconds = optional(number)
            }))
            name = string
            port = optional(list(object({
              container_port = number
              host_ip        = optional(string)
              host_port      = optional(number)
              name           = optional(string)
              protocol       = optional(string)
            })))
            readiness_probe = optional(object({
              exec = optional(object({
                command = optional(list(string))
              }))
              failure_threshold = optional(number)
              grpc = optional(list(object({
                port    = number
                service = optional(string)
              })))
              http_get = optional(object({
                host = optional(string)
                http_header = optional(list(object({
                  name  = optional(string)
                  value = optional(string)
                })))
                path   = optional(string)
                port   = optional(string)
                scheme = optional(string)
              }))
              initial_delay_seconds = optional(number)
              period_seconds        = optional(number)
              success_threshold     = optional(number)
              tcp_socket = optional(list(object({
                port = string
              })))
              timeout_seconds = optional(number)
            }))
            resources = optional(object({
              limits   = optional(map(string))
              requests = optional(map(string))
            }))
            restart_policy = optional(string)
            security_context = optional(object({
              allow_privilege_escalation = optional(bool)
              capabilities = optional(object({
                add  = optional(list(string))
                drop = optional(list(string))
              }))
              privileged                = optional(bool)
              read_only_root_filesystem = optional(bool)
              run_as_group              = optional(string)
              run_as_non_root           = optional(bool)
              run_as_user               = optional(string)
              se_linux_options = optional(object({
                level = optional(string)
                role  = optional(string)
                type  = optional(string)
                user  = optional(string)
              }))
              seccomp_profile = optional(object({
                localhost_profile = optional(string)
                type              = optional(string)
              }))
            }))
            startup_probe = optional(object({
              exec = optional(object({
                command = optional(list(string))
              }))
              failure_threshold = optional(number)
              grpc = optional(list(object({
                port    = number
                service = optional(string)
              })))
              http_get = optional(object({
                host = optional(string)
                http_header = optional(list(object({
                  name  = optional(string)
                  value = optional(string)
                })))
                path   = optional(string)
                port   = optional(string)
                scheme = optional(string)
              }))
              initial_delay_seconds = optional(number)
              period_seconds        = optional(number)
              success_threshold     = optional(number)
              tcp_socket = optional(list(object({
                port = string
              })))
              timeout_seconds = optional(number)
            }))
            stdin                      = optional(bool)
            stdin_once                 = optional(bool)
            termination_message_path   = optional(string)
            termination_message_policy = optional(string)
            tty                        = optional(bool)
            volume_device = optional(list(object({
              device_path = string
              name        = string
            })))
            volume_mount = optional(list(object({
              mount_path        = string
              mount_propagation = optional(string)
              name              = string
              read_only         = optional(bool)
              sub_path          = optional(string)
              sub_path_expr     = optional(string)
            })))
            working_dir = optional(string)
          })))
          dns_config = optional(object({
            nameservers = optional(list(string))
            option = optional(list(object({
              name  = string
              value = optional(string)
            })))
            searches = optional(list(string))
          }))
          dns_policy           = optional(string)
          enable_service_links = optional(bool)
          host_aliases = optional(list(object({
            hostnames = list(string)
            ip        = string
          })))
          host_ipc     = optional(bool)
          host_network = optional(bool)
          host_pid     = optional(bool)
          hostname     = optional(string)
          image_pull_secrets = optional(list(object({
            name = string
          })))
          init_container = optional(list(object({
            args    = optional(list(string))
            command = optional(list(string))
            env = optional(list(object({
              name  = string
              value = optional(string)
              value_from = optional(object({
                config_map_key_ref = optional(object({
                  key      = optional(string)
                  name     = optional(string)
                  optional = optional(bool)
                }))
                field_ref = optional(object({
                  api_version = optional(string)
                  field_path  = optional(string)
                }))
                resource_field_ref = optional(object({
                  container_name = optional(string)
                  divisor        = optional(string)
                  resource       = string
                }))
                secret_key_ref = optional(object({
                  key      = optional(string)
                  name     = optional(string)
                  optional = optional(bool)
                }))
              }))
            })))
            env_from = optional(list(object({
              config_map_ref = optional(object({
                name     = string
                optional = optional(bool)
              }))
              prefix = optional(string)
              secret_ref = optional(object({
                name     = string
                optional = optional(bool)
              }))
            })))
            image             = optional(string)
            image_pull_policy = optional(string)
            lifecycle = optional(object({
              post_start = optional(list(object({
                exec = optional(object({
                  command = optional(list(string))
                }))
                http_get = optional(object({
                  host = optional(string)
                  http_header = optional(list(object({
                    name  = optional(string)
                    value = optional(string)
                  })))
                  path   = optional(string)
                  port   = optional(string)
                  scheme = optional(string)
                }))
                tcp_socket = optional(list(object({
                  port = string
                })))
              })))
              pre_stop = optional(list(object({
                exec = optional(object({
                  command = optional(list(string))
                }))
                http_get = optional(object({
                  host = optional(string)
                  http_header = optional(list(object({
                    name  = optional(string)
                    value = optional(string)
                  })))
                  path   = optional(string)
                  port   = optional(string)
                  scheme = optional(string)
                }))
                tcp_socket = optional(list(object({
                  port = string
                })))
              })))
            }))
            liveness_probe = optional(object({
              exec = optional(object({
                command = optional(list(string))
              }))
              failure_threshold = optional(number)
              grpc = optional(list(object({
                port    = number
                service = optional(string)
              })))
              http_get = optional(object({
                host = optional(string)
                http_header = optional(list(object({
                  name  = optional(string)
                  value = optional(string)
                })))
                path   = optional(string)
                port   = optional(string)
                scheme = optional(string)
              }))
              initial_delay_seconds = optional(number)
              period_seconds        = optional(number)
              success_threshold     = optional(number)
              tcp_socket = optional(list(object({
                port = string
              })))
              timeout_seconds = optional(number)
            }))
            name = string
            port = optional(list(object({
              container_port = number
              host_ip        = optional(string)
              host_port      = optional(number)
              name           = optional(string)
              protocol       = optional(string)
            })))
            readiness_probe = optional(object({
              exec = optional(object({
                command = optional(list(string))
              }))
              failure_threshold = optional(number)
              grpc = optional(list(object({
                port    = number
                service = optional(string)
              })))
              http_get = optional(object({
                host = optional(string)
                http_header = optional(list(object({
                  name  = optional(string)
                  value = optional(string)
                })))
                path   = optional(string)
                port   = optional(string)
                scheme = optional(string)
              }))
              initial_delay_seconds = optional(number)
              period_seconds        = optional(number)
              success_threshold     = optional(number)
              tcp_socket = optional(list(object({
                port = string
              })))
              timeout_seconds = optional(number)
            }))
            resources = optional(object({
              limits   = optional(map(string))
              requests = optional(map(string))
            }))
            restart_policy = optional(string)
            security_context = optional(object({
              allow_privilege_escalation = optional(bool)
              capabilities = optional(object({
                add  = optional(list(string))
                drop = optional(list(string))
              }))
              privileged                = optional(bool)
              read_only_root_filesystem = optional(bool)
              run_as_group              = optional(string)
              run_as_non_root           = optional(bool)
              run_as_user               = optional(string)
              se_linux_options = optional(object({
                level = optional(string)
                role  = optional(string)
                type  = optional(string)
                user  = optional(string)
              }))
              seccomp_profile = optional(object({
                localhost_profile = optional(string)
                type              = optional(string)
              }))
            }))
            startup_probe = optional(object({
              exec = optional(object({
                command = optional(list(string))
              }))
              failure_threshold = optional(number)
              grpc = optional(list(object({
                port    = number
                service = optional(string)
              })))
              http_get = optional(object({
                host = optional(string)
                http_header = optional(list(object({
                  name  = optional(string)
                  value = optional(string)
                })))
                path   = optional(string)
                port   = optional(string)
                scheme = optional(string)
              }))
              initial_delay_seconds = optional(number)
              period_seconds        = optional(number)
              success_threshold     = optional(number)
              tcp_socket = optional(list(object({
                port = string
              })))
              timeout_seconds = optional(number)
            }))
            stdin                      = optional(bool)
            stdin_once                 = optional(bool)
            termination_message_path   = optional(string)
            termination_message_policy = optional(string)
            tty                        = optional(bool)
            volume_device = optional(list(object({
              device_path = string
              name        = string
            })))
            volume_mount = optional(list(object({
              mount_path        = string
              mount_propagation = optional(string)
              name              = string
              read_only         = optional(bool)
              sub_path          = optional(string)
              sub_path_expr     = optional(string)
            })))
            working_dir = optional(string)
          })))
          node_name     = optional(string)
          node_selector = optional(map(string))
          os = optional(object({
            name = string
          }))
          priority_class_name = optional(string)
          readiness_gate = optional(list(object({
            condition_type = string
          })))
          restart_policy     = optional(string)
          runtime_class_name = optional(string)
          scheduler_name     = optional(string)
          security_context = optional(object({
            fs_group               = optional(string)
            fs_group_change_policy = optional(string)
            run_as_group           = optional(string)
            run_as_non_root        = optional(bool)
            run_as_user            = optional(string)
            se_linux_options = optional(object({
              level = optional(string)
              role  = optional(string)
              type  = optional(string)
              user  = optional(string)
            }))
            seccomp_profile = optional(object({
              localhost_profile = optional(string)
              type              = optional(string)
            }))
            supplemental_groups = optional(set(number))
            sysctl = optional(list(object({
              name  = string
              value = string
            })))
            windows_options = optional(object({
              gmsa_credential_spec      = optional(string)
              gmsa_credential_spec_name = optional(string)
              host_process              = optional(bool)
              run_as_username           = optional(string)
            }))
          }))
          service_account_name             = optional(string)
          share_process_namespace          = optional(bool)
          subdomain                        = optional(string)
          termination_grace_period_seconds = optional(number)
          toleration = optional(list(object({
            effect             = optional(string)
            key                = optional(string)
            operator           = optional(string)
            toleration_seconds = optional(string)
            value              = optional(string)
          })))
          topology_spread_constraint = optional(list(object({
            label_selector = optional(list(object({
              match_expressions = optional(list(object({
                key      = optional(string)
                operator = optional(string)
                values   = optional(set(string))
              })))
              match_labels = optional(map(string))
            })))
            match_label_keys     = optional(set(string))
            max_skew             = optional(number)
            min_domains          = optional(number)
            node_affinity_policy = optional(string)
            node_taints_policy   = optional(string)
            topology_key         = optional(string)
            when_unsatisfiable   = optional(string)
          })))
          volume = optional(list(object({
            aws_elastic_block_store = optional(object({
              fs_type   = optional(string)
              partition = optional(number)
              read_only = optional(bool)
              volume_id = string
            }))
            azure_disk = optional(object({
              caching_mode  = string
              data_disk_uri = string
              disk_name     = string
              fs_type       = optional(string)
              kind          = optional(string)
              read_only     = optional(bool)
            }))
            azure_file = optional(object({
              read_only        = optional(bool)
              secret_name      = string
              secret_namespace = optional(string)
              share_name       = string
            }))
            ceph_fs = optional(object({
              monitors    = set(string)
              path        = optional(string)
              read_only   = optional(bool)
              secret_file = optional(string)
              secret_ref = optional(object({
                name      = optional(string)
                namespace = optional(string)
              }))
              user = optional(string)
            }))
            cinder = optional(object({
              fs_type   = optional(string)
              read_only = optional(bool)
              volume_id = string
            }))
            config_map = optional(object({
              default_mode = optional(string)
              items = optional(list(object({
                key  = optional(string)
                mode = optional(string)
                path = optional(string)
              })))
              name     = optional(string)
              optional = optional(bool)
            }))
            csi = optional(object({
              driver  = string
              fs_type = optional(string)
              node_publish_secret_ref = optional(object({
                name = optional(string)
              }))
              read_only         = optional(bool)
              volume_attributes = optional(map(string))
            }))
            downward_api = optional(object({
              default_mode = optional(string)
              items = optional(list(object({
                field_ref = object({
                  api_version = optional(string)
                  field_path  = optional(string)
                })
                mode = optional(string)
                path = string
                resource_field_ref = optional(object({
                  container_name = string
                  divisor        = optional(string)
                  resource       = string
                }))
              })))
            }))
            empty_dir = optional(object({
              medium     = optional(string)
              size_limit = optional(string)
            }))
            ephemeral = optional(object({
              volume_claim_template = object({
                metadata = optional(object({
                  annotations = optional(map(string))
                  labels      = optional(map(string))
                }))
                spec = object({
                  access_modes = set(string)
                  resources = object({
                    limits   = optional(map(string))
                    requests = optional(map(string))
                  })
                  selector = optional(object({
                    match_expressions = optional(list(object({
                      key      = optional(string)
                      operator = optional(string)
                      values   = optional(set(string))
                    })))
                    match_labels = optional(map(string))
                  }))
                  storage_class_name = optional(string)
                  volume_mode        = optional(string)
                  volume_name        = optional(string)
                })
              })
            }))
            fc = optional(object({
              fs_type      = optional(string)
              lun          = number
              read_only    = optional(bool)
              target_ww_ns = set(string)
            }))
            flex_volume = optional(object({
              driver    = string
              fs_type   = optional(string)
              options   = optional(map(string))
              read_only = optional(bool)
              secret_ref = optional(object({
                name      = optional(string)
                namespace = optional(string)
              }))
            }))
            flocker = optional(object({
              dataset_name = optional(string)
              dataset_uuid = optional(string)
            }))
            gce_persistent_disk = optional(object({
              fs_type   = optional(string)
              partition = optional(number)
              pd_name   = string
              read_only = optional(bool)
            }))
            git_repo = optional(object({
              directory  = optional(string)
              repository = optional(string)
              revision   = optional(string)
            }))
            glusterfs = optional(object({
              endpoints_name = string
              path           = string
              read_only      = optional(bool)
            }))
            host_path = optional(object({
              path = optional(string)
              type = optional(string)
            }))
            iscsi = optional(object({
              fs_type         = optional(string)
              iqn             = string
              iscsi_interface = optional(string)
              lun             = optional(number)
              read_only       = optional(bool)
              target_portal   = string
            }))
            local = optional(object({
              path = optional(string)
            }))
            name = optional(string)
            nfs = optional(object({
              path      = string
              read_only = optional(bool)
              server    = string
            }))
            persistent_volume_claim = optional(object({
              claim_name = optional(string)
              read_only  = optional(bool)
            }))
            photon_persistent_disk = optional(object({
              fs_type = optional(string)
              pd_id   = string
            }))
            projected = optional(list(object({
              default_mode = optional(string)
              sources = list(object({
                config_map = optional(list(object({
                  items = optional(list(object({
                    key  = optional(string)
                    mode = optional(string)
                    path = optional(string)
                  })))
                  name     = optional(string)
                  optional = optional(bool)
                })))
                downward_api = optional(object({
                  items = optional(list(object({
                    field_ref = optional(object({
                      api_version = optional(string)
                      field_path  = optional(string)
                    }))
                    mode = optional(string)
                    path = string
                    resource_field_ref = optional(object({
                      container_name = string
                      divisor        = optional(string)
                      resource       = string
                    }))
                  })))
                }))
                secret = optional(list(object({
                  items = optional(list(object({
                    key  = optional(string)
                    mode = optional(string)
                    path = optional(string)
                  })))
                  name     = optional(string)
                  optional = optional(bool)
                })))
                service_account_token = optional(object({
                  audience           = optional(string)
                  expiration_seconds = optional(number)
                  path               = string
                }))
              }))
            })))
            quobyte = optional(object({
              group     = optional(string)
              read_only = optional(bool)
              registry  = string
              user      = optional(string)
              volume    = string
            }))
            rbd = optional(object({
              ceph_monitors = set(string)
              fs_type       = optional(string)
              keyring       = optional(string)
              rados_user    = optional(string)
              rbd_image     = string
              rbd_pool      = optional(string)
              read_only     = optional(bool)
              secret_ref = optional(object({
                name      = optional(string)
                namespace = optional(string)
              }))
            }))
            secret = optional(object({
              default_mode = optional(string)
              items = optional(list(object({
                key  = optional(string)
                mode = optional(string)
                path = optional(string)
              })))
              optional    = optional(bool)
              secret_name = optional(string)
            }))
            vsphere_volume = optional(object({
              fs_type     = optional(string)
              volume_path = string
            }))
          })))
        }))
      })
      update_strategy = optional(list(object({
        rolling_update = optional(list(object({
          partition = optional(number)
        })))
        type = optional(string)
      })))
      volume_claim_template = optional(list(object({
        metadata = object({
          annotations   = optional(map(string))
          generate_name = optional(string)
          labels        = optional(map(string))
          name          = optional(string)
          namespace     = optional(string)
        })
        spec = object({
          access_modes = set(string)
          resources = object({
            limits   = optional(map(string))
            requests = optional(map(string))
          })
          selector = optional(object({
            match_expressions = optional(list(object({
              key      = optional(string)
              operator = optional(string)
              values   = optional(set(string))
            })))
            match_labels = optional(map(string))
          }))
          storage_class_name = optional(string)
          volume_mode        = optional(string)
          volume_name        = optional(string)
        })
      })))
    })
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.stateful_set_v1s : (
        v.spec.template.spec == null || (v.spec.template.spec.volume == null || alltrue([for item in v.spec.template.spec.volume : (item.projected == null || alltrue([for item in item.projected : (length(item.sources) >= 1)]))]))
      )
    ])
    error_message = "Each sources list must contain at least 1 items"
  }
}

