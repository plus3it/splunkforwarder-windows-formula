{%- from 'splunkforwarder-windows/map.jinja' import splunkforwarder with context %}

splunkforwarder-install:
  pkg.installed:
    - name: {{ splunkforwarder.package }}
    - allow_updates: True
    - require_in:
      - file: splunkforwarder-deploymentclient.conf
      - file: splunkforwarder-log-local.cfg

splunkforwarder-deploymentclient.conf:
  file.managed:
    - name: {{ splunkforwarder.deploymentclient.conf }}
    - source: {{ splunkforwarder.deploymentclient.source }}
    - source_hash: {{ splunkforwarder.deploymentclient.source_hash }}
    - makedirs: True
    - watch_in:
      - service: splunkforwarder-service

splunkforwarder-log-local.cfg:
  file.managed:
    - name: {{ splunkforwarder.log_local.conf }}
    - source: {{ splunkforwarder.log_local.source }}
    - source_hash: {{ splunkforwarder.log_local.source_hash }}
    - makedirs: True
    - watch_in:
      - service: splunkforwarder-service

splunkforwarder-service:
  service.running:
    - name: {{ splunkforwarder.service }}
