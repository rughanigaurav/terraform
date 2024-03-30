resource "aws_ses_configuration_set" "test-Configuration-Set" {

    name = "test-Configuration-Set"
    sending_enabled = true
    reputation_metrics_enabled = false
}

resource "aws_ses_domain_identity" "test" {

    domain = "xyz.com"
    
}

resource "aws_ses_email_identity" "verifiedmail" {
  
    email = "test.prolix@gmail.com"
    
}