# network
# output "network" {
#   value       = module.network["sharedvpc01"].network
#   description = "The VPC resource being created"
# }

output "network_id" {
  value       = module.network["sharedvpc01"].network.id
  description = "The VPC resource being created"
}
