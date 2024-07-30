# Get the available AZs
data "huaweicloud_availability_zones" "azs" {
  region = var.credentialshwc[0]
}

# Create a VPC
resource "huaweicloud_vpc" "vpc" {
    name = "vpc-tf"
    cidr = "192.168.0.0/16"
}

# Create a Subnet
resource "huaweicloud_vpc_subnet" "subnet" {
    name       = "subnet-tf"
    cidr       = "192.168.0.0/24"
    gateway_ip = "192.168.0.1"
    vpc_id     = huaweicloud_vpc.vpc.id
}

# Create a DCS Instance
resource "huaweicloud_dcs_instance" "instance" {
  name               = var.redis_name
  engine             = var.redis_engine
  engine_version     = var.redis_engine_version
  capacity           = 4
  flavor             = var.redis_flavor
  availability_zones = [data.huaweicloud_availability_zones.azs.names[0], data.huaweicloud_availability_zones.azs.names[1]]
  password           = var.redis_password
  vpc_id             = huaweicloud_vpc.vpc.id
  subnet_id          = huaweicloud_vpc_subnet.subnet.id
  port               = var.redis_port
  whitelist_enable   = var.redis_whitelist_enable

#  charging_mode = "postPaid"

  backup_policy {
    backup_type = var.redis_backup_type
    save_days   = var.redis_backup_save_days
    backup_at   = var.redis_backup_at
    begin_at    = var.redis_backup_begin_at
  }

  whitelists {
    group_name = var.redis_whitelist_group_name1
    ip_address = var.redis_whitelist_ip_address1
  }
  whitelists {
    group_name = var.redis_whitelist_group_name2
    ip_address = var.redis_whitelist_ip_address2
  }
}

# Endpoint = dcs.sa-brazil-1.myhuaweicloud.com


# Create a DDS Instance
resource "huaweicloud_dds_instance" "instance" {
  name = var.dds_instance_name
  datastore {
    type           = var.dds_datastore_type
    version        = var.dds_datastore_version
    storage_engine = var.dds_datastore_storage_engine
  }

  availability_zone = data.huaweicloud_availability_zones.azs.names[0]
  vpc_id            = huaweicloud_vpc.vpc.id
  subnet_id         = huaweicloud_vpc_subnet.subnet.id
  security_group_id = data.huaweicloud_networking_secgroup.secgroup.id
  password          = var.dds_instance_password
  mode              = var.dds_instance_mode

  flavor {
    type      = var.dds_flavor_type1
    num       = var.dds_flavor_num1
    spec_code = var.dds_flavor_spec_code1
  }
  flavor {
    type      = var.dds_flavor_type2
    num       = var.dds_flavor_num2
    storage   = var.dds_flavor_storage2
    size      = var.dds_flavor_size2
    spec_code = var.dds_flavor_spec_code2
  }
  flavor {
    type      = var.dds_flavor_type3
    num       = var.dds_flavor_num3
    storage   = var.dds_flavor_storage3
    size      = var.dds_flavor_size3
    spec_code = var.dds_flavor_spec_code3
  }
}

# Endpoint dds.sa-brazil-1.myhuaweicloud.com

# Create a DMS Instance
data "huaweicloud_dms_rabbitmq_flavors" "rabbit" {
  type               = var.rabbit_type
  storage_spec_code  = var.rabbit_storage_type
  availability_zones = [data.huaweicloud_availability_zones.azs.names[0]]
}

resource "huaweicloud_dms_rabbitmq_instance" "rabbit" {
  name              = var.rabbit_instance_name
  flavor_id         = var.rabbit_instance_flavor
  engine_version    = var.rabbit_instance_engine
  storage_spec_code = data.huaweicloud_dms_rabbitmq_flavors.rabbit.flavors[0].ios[0].storage_spec_code
  broker_num        = var.rabbit_instance_broker_num
  storage_space     = var.rabbit_instance_broker_storage

  vpc_id             = huaweicloud_vpc.vpc.id
  network_id         = huaweicloud_vpc_subnet.subnet.id
  security_group_id  = data.huaweicloud_networking_secgroup.secgroup.id
  availability_zones = [data.huaweicloud_availability_zones.azs.names[0]]

  access_user = var.rabbit_instance_user
  password    = var.rabbit_instance_password
}

# Endpoint dms.sa-brazil-1.myhuaweicloud.com