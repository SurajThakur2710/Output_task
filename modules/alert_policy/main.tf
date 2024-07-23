resource "newrelic_alert_policy" "policy" {
  name = var.policy_name
}

resource "newrelic_nrql_alert_condition" "condition" {
  policy_id = newrelic_alert_policy.policy.id
  name      = var.condition_name

  nrql {
    query      = "SELECT count(*) FROM Transaction "
    
  }
    critical {
    operator              = "above"
    threshold             = 5
    threshold_duration    = 300
    threshold_occurrences = "ALL"
    }

    warning {
    operator              = "above"
    threshold             = 3
    threshold_duration    = 300
    threshold_occurrences = "ALL"
    }
}