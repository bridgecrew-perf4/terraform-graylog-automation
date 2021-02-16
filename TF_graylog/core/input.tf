# available types in node .../api/system/inputs/types/all
# org.graylog2.inputs.gelf.udp.GELFUDPInput
# org.graylog.plugins.cef.input.CEFUDPInput
# org.graylog2.inputs.syslog.amqp.SyslogAMQPInput
# org.graylog2.inputs.gelf.kafka.GELFKafkaInput
# org.graylog.plugins.beats.Beats2Input
# org.graylog2.inputs.syslog.udp.SyslogUDPInput
# org.graylog2.inputs.syslog.tcp.SyslogTCPInput
# org.graylog.plugins.netflow.inputs.NetFlowUdpInput
# org.graylog2.inputs.misc.jsonpath.JsonPathInput
# org.graylog.plugins.cef.input.CEFTCPInput
# org.graylog2.inputs.raw.tcp.RawTCPInput
# org.graylog2.inputs.gelf.tcp.GELFTCPInput
# org.graylog2.inputs.raw.udp.RawUDPInput
# org.graylog2.inputs.random.FakeHttpMessageInput
# org.graylog.aws.inputs.cloudtrail.CloudTrailInput
# org.graylog.plugins.cef.input.CEFKafkaInput
# org.graylog.aws.inputs.flowlogs.FlowLogsInput
# org.graylog2.inputs.gelf.http.GELFHttpInput
# org.graylog.plugins.beats.BeatsInput
# org.graylog2.inputs.syslog.kafka.SyslogKafkaInput
# org.graylog2.inputs.raw.amqp.RawAMQPInput
# org.graylog.aws.inputs.cloudwatch.CloudWatchLogsInput
# org.graylog.plugins.cef.input.CEFAmqpInput
# org.graylog2.inputs.gelf.amqp.GELFAMQPInput
# org.graylog2.inputs.raw.kafka.RawKafkaInput

resource "graylog_input" "gelf_tcp" {
  title   = "GELF TCP"
  type    = "org.graylog2.inputs.gelf.tcp.GELFTCPInput"
  global  = true

  attributes = jsonencode({
    bind_address          = "0.0.0.0"
    port                  = 12201
    recv_buffer_size      = 1048576
    number_worker_threads = 2
    tls_enable            = false
    tls_client_auth       = "disabled"
    use_null_delimiter    = true
    max_message_size      = 2097152
  })
}

# useful for multi project or team setup workaround for non-enterprise graylog
resource "graylog_input_static_fields" "gelf_tcp_static_fields" {
  input_id = graylog_input.gelf_tcp.id
  fields = {
    project = "visitor-management-portal"
  }
}