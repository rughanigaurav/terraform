resource "aws_cloudwatch_metric_alarm" "frontalarm" {
    alarm_name = "warning"
    comparison_operator = "LessThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "CPUUtilization"
    namespace = "AWS/EC2"
    period = "120"
    statistic = "Average"
    threshold = "10"
    alarm_description = "Monitor CPU Utilization"
    insufficient_data_actions = []
    dimensions = {

        instance_id=aws_instance.Frontend-S1.id
    }
    alarm_actions = ["arn:aws:automate:us-east-1:ec2:stop"]

}

resource "aws_cloudwatch_metric_alarm" "backalarm" {
    alarm_name = "warning"
    comparison_operator = "LessThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "CPUUtilization"
    namespace = "AWS/EC2"
    period = "120"
    statistic = "Average"
    threshold = "10"
    alarm_description = "Monitor CPU Utilization"
    insufficient_data_actions = []
    dimensions = {

        instance_id=aws_instance.Backend-S1.id
    }
    alarm_actions = ["arn:aws:automate:us-east-1:ec2:stop"]

}


