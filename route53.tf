resource "aws_route53_zone" "Domain-name"{
    
    name = var.domain-name

}


resource "aws_route53_record" "Recordset" {
  
  zone_id = aws_route53_zone.Domain-name.id
  name = var.record-name
  type = "A"

alias {
  
name = aws_lb.Frontend_alb.dns_name
zone_id = aws_lb.Frontend_alb.zone_id
evaluate_target_health = true
  

}


}