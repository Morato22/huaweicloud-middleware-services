variable "redis_name" {
    type = string
  default = "redis_name"
}

variable "redis_engine" {
    type = string
  default = "Redis"
}

variable "redis_engine_version" {
    type = string
  default = "6.0"
}

variable "redis_flavor" {
    type = string
    default = "redis.cluster.xu1.large.r2.4"
}

variable "redis_password" {
    type = string
  default = ".."
}

variable "redis_port" {
    type = number
  default = 6379
}

variable "redis_whitelist_enable" {
    type = bool
  default = true
}

variable "redis_backup_type" {
    type = string
    default = "auto"
}

variable "redis_backup_save_days" {
  type = number
  default = 3
}

variable "redis_backup_at" {
  type = list(number)
  default = [1,3,5,7]
}

variable "redis_backup_begin_at" {
    type = string
    default = "02:00-04:00"
}

variable "redis_whitelist_group_name1" {
    type = string
    default = "test-group1"
}

variable "redis_whitelist_ip_address1" {
  type = list(string)
  default = [ "192.168.10.100", "192.168.0.0/24" ]
}

variable "redis_whitelist_group_name2" {
    type = string
    default = "test-group2"
}

variable "redis_whitelist_ip_address2" {
    type = list(string)
    default = [ "172.16.10.100", "172.16.0.0/24" ]
  
}

variable "dds_instance_name" {
  type = string
  default = "dds-instance"
}

variable "dds_datastore_type" {
    type = string
    default = "DDS-Community"
}

variable "dds_datastore_version" {
  type = string
  default = "4.4"
}

variable "dds_datastore_storage_engine" {
  type = string
  default = "rocksDB"
}

variable "dds_instance_password" {
  type = string
  default = ".."
}

variable "dds_instance_mode" {
    type = string
    default = "Sharding"
}

variable "dds_flavor_type1" {
    type = string
    default = "mongos"
}

variable "dds_flavor_num1" {
    type = number
    default = 2
}

variable "dds_flavor_spec_code1" {
  type = string
  default = "dds.mongodb.s6.large.4.mongos"
}

variable "dds_flavor_type2" {
  type = string
  default = "shard"
}

variable "dds_flavor_num2" {
  type = number
  default = 2
}

variable "dds_flavor_storage2" {
  type = string
  default = "ULTRAHIGH"
}

variable "dds_flavor_size2" {
  type = number
  default = 100
}

variable "dds_flavor_spec_code2" {
    type = string
    default = "dds.mongodb.s6.xlarge.4.shard"
}

variable "dds_flavor_type3" {
  type = string
  default = "config"
}

variable "dds_flavor_num3" {
  type = number
  default = 1
}

variable "dds_flavor_storage3" {
  type = string
  default = "ULTRAHIGH"
}

variable "dds_flavor_size3" {
  type = number
  default = 20
}

variable "dds_flavor_spec_code3" {
  type = string
  default = "dds.mongodb.s6.large.2.config"
}

variable rabbit_type {
  type = string
  default = "cluster"
  description = "DMS type can be Single-Node or Cluster."
}

variable rabbit_storage_type {
  type = string
  default = "dms.physical.storage.ultra.v2"
  description = "DMS Storage type per broker. Can be High I/O (dms.physical.storage.high.v2) or Ultra-high I/O (dms.physical.storage.ultra.v2)."
}

variable rabbit_instance_name {
  type = string
  default = "rabbit-tf"
  description = "DMS RabbitMQ Name"
}

variable rabbit_instance_flavor {
  type = string
  default = "rabbitmq.2u4g.cluster"
  description = "DMS RabbitMQ flavor"
}

variable rabbit_instance_engine {
  type = string
  default = "3.8.35"
  description = "DMS RabbitMQ Engine Version"
}

variable rabbit_instance_broker_num {
  type = number
  default = 3
  description = "DMS RabbitMQ Broker Number"
}

variable rabbit_instance_broker_storage {
  type = number
  default = 300
  description = "DMS RabbitMQ Broker storage space"
}

variable rabbit_instance_user {
  type = string
  default = "user"
  description = "DMS RabbitMQ user"
}

variable rabbit_instance_password {
  type = string
  default = ".."
  description = "DMS RabbitMQ password"
}