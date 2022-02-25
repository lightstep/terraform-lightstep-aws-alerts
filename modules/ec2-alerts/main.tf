terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = ">= 1.60.1"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_condition" "ec2_cpu_usage" {
  project_name = var.lightstep_project
  name         = "EC2 CPU Utilization"

  expression {
    evaluation_window   = "2m"
    evaluation_criteria = "on_average"
    is_multi            = true
    operand             = "above"
    thresholds {
      warning  = 80
      critical = 90
    }
  }

  metric_query {
    metric              = "aws.ec2.cpu_utilization_max"
    query_name          = "a"
    timeseries_operator = "last"
    hidden              = false
    display             = "line"


    group_by {
      aggregation_method = "max"
      keys               = ["InstanceId"]
    }
  }

}