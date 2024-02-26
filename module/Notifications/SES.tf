resource "aws_ses_configuration_set" "Linx-Configuration-Set" {

    name = "Linx-Configuration-Set"
    sending_enabled = true
    reputation_metrics_enabled = false
}

resource "aws_ses_domain_identity" "linx" {

    domain = "staging.linxap.com"
    
}

resource "aws_ses_email_identity" "verifiedmail" {
  
    email = "linx.prolix@gmail.com"
    
}