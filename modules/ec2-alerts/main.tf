terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = ">= 1.51.2"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_condition" "ec2_cpu_usage" {
  project_name = var.lightstep_project
  name         = "EC2 CPU Usage"

  expression {
    evaluation_window   = "2m"
    evaluation_criteria = "on_average"
    is_no_data          = true
    operand             = "below"
    thresholds {
      warning  = 9
      critical = 8
    }
  }

  metric_query {
    metric              = "requests"
    query_name          = "a"
    timeseries_operator = "delta"
    hidden              = false
    display             = "line"

    include_filters = [
      {
        key   = "kube_instance"
        value = "3"
      }
    ]

    group_by {
      aggregation_method = "max"
      keys               = ["InstanceId"]
    }
  }

}