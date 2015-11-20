# splunkforwarder-windows-formula
Salt formula to install and configure the Splunk Universal Forwarder on
Windows. This formula requires a winrepo package definition containing the
specification for installing the splunkforwarder.


## Available States

- [splunkforwarder-windows](#splunkforwarder-windows)


### splunkforwarder-windows

Install and configure the Splunk Universal Forwarder for Windows.

## Configuration

This formula requires configuration via pillar. If the required parameters are
not configured in pillar, the formula will fail.

### splunkforwarder:deploymentclient

This parameter is a map containing the `source` and `source_hash` of the
deploymentclient.conf file.

>**Required**: `True`

**Example**:

```
splunkforwarder:
  deploymentclient:
    source: 'https://path/to/my/deploymentclient.conf'
    source_hash: 'https://path/to/my/deploymentclient.conf.HASH'
```

### splunkforwarder:log_local

This parameter is a map containing the `source` and `source_hash` of the
log-local.cfg file.

>**Required**: `True`

**Example**:

```
splunkforwarder:
  log_local:
    source: 'https://path/to/my/log-local.cfg'
    source_hash: 'https://path/to/my/log-local.cfg.HASH'
```

### splunkforwarder:package

The `package` parameter is the name of the package as defined in the winrepo
package definition.

>**Required**: `False`

>**Default**: `'splunkforwarder'`

**Example**:

```
splunkforwarder:
  package: 'splunkforwarder'
```

### splunkforwarder:server

The `service` parameter is the name of the Windows service for the Splunk
Universal Forwarder.

>**Required**: `False`

>**Default**: `'SplunkForwarder'`

**Example**:

```
splunkforwarder:
  service: 'SplunkForwarder'
```
