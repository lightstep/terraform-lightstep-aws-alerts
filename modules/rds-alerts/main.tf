terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = ">= 1.60.1"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_condition" "rds_cpu_usage" {
  project_name = var.lightstep_project
  name         = "RDS CPU Utilization"

  expression {
    evaluation_window   = "2m"
    evaluation_criteria = "on_average"
    operand             = "above"
    is_multi            = true
    thresholds {
      warning  = 80
      critical = 90
    }
  }

  metric_query {
    metric              = "aws.rds.cpu_utilization_max"
    query_name          = "a"
    timeseries_operator = "last"
    hidden              = false
    display             = "line"

    group_by {
      aggregation_method = "max"
      keys               = ["DBInstanceIdentifier"]
    }
  }
}

resource "lightstep_metric_condition" "rds_freeable_memory" {
  project_name = var.lightstep_project
  name         = "RDS Freeable Memory"

  expression {
    evaluation_window   = "2m"
    evaluation_criteria = "on_average"
    operand             = "below"
    is_multi            = true
    thresholds {
      critical = 268435456
    }
  }

  metric_query {
    metric              = "aws.rds.free_storage_space_min"
    query_name          = "a"
    timeseries_operator = "last"
    hidden              = false
    display             = "line"

    group_by {
      aggregation_method = "max"
      keys               = ["DBInstanceIdentifier"]
    }
  }
}

resource "lightstep_metric_condition" "rds_swap_usage" {
  project_name = var.lightstep_project
  name         = "RDS Swap Usage"

  expression {
    evaluation_window   = "2m"
    evaluation_criteria = "on_average"
    operand             = "above"
    is_multi            = true
    thresholds {
      critical = 268435456
    }
  }

  metric_query {
    metric              = "aws.rds.swap_usage_max"
    query_name          = "a"
    timeseries_operator = "last"
    hidden              = false
    display             = "line"

    group_by {
      aggregation_method = "max"
      keys               = ["DBInstanceIdentifier"]
    }
  }
}

resource "lightstep_metric_condition" "rds_disk_queue_depth" {
  project_name = var.lightstep_project
  name         = "RDS Disk Queue Depth"

  expression {
    evaluation_window   = "2m"
    evaluation_criteria = "on_average"
    operand             = "above"
    is_multi            = true
    thresholds {
      critical = 64
    }
  }

  metric_query {
    metric              = "aws.rds.disk_queue_depth_count"
    query_name          = "a"
    timeseries_operator = "delta"
    hidden              = false
    display             = "line"

    group_by {
      aggregation_method = "max"
      keys               = ["DBInstanceIdentifier"]
    }
  }
}