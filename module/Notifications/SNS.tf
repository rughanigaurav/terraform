# resource "aws_sns_topic" "sns" {
#   name = "Linx-Notification"  
# }
# data "aws_sns_topic" "sns" {
#     name = "Linx-Notification"

# }
# resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
#   topic_arn = data.aws_sns_topic.sns.arn
#   protocol  = "email"
#   endpoint  = "gaurav.prolix@gmail.com"
# }
