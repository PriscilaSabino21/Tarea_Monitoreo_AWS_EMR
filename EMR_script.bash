# Para crear una clúster EMR por SSH
# Crea un archivo con los comando :  nano crear-emr-cluster.sh
# poner permisos al archivo con el comando : chmod +x crear-emr-cluster.sh
# Ejecuta el script con el comando : ./create-emr-cluster.sh

#!/bin/bash

aws emr create-cluster \
 --name "EMR-Monitoring-iabd02" \
 --log-uri "s3://aws-logs-845783312919-us-east-1/elasticmapreduce" \
 --release-label "emr-7.8.0" \
 --service-role "arn:aws:iam::845783312919:role/EMR_DefaultRole" \
 --unhealthy-node-replacement \
 --ec2-attributes '{"InstanceProfile":"EMR_EC2_DefaultRole","EmrManagedMasterSecurityGroup":"sg-0ba28f0b1096b3004","EmrManagedSlaveSecurityGroup":"sg-0ba28f0b1096b3004","KeyName":"vockey","AdditionalMasterSecurityGroups":[],"AdditionalSlaveSecurityGroups":[],"SubnetIds":["subnet-00b1fd945d2487fa3"]}' \
 --applications Name=Hadoop Name=Hive Name=Spark \
 --instance-groups '[{"InstanceCount":2,"InstanceGroupType":"TASK","Name":"Tarea - 1","InstanceType":"m4.large","EbsConfiguration":{"EbsBlockDeviceConfigs":[{"VolumeSpecification":{"VolumeType":"gp2","SizeInGB":32},"VolumesPerInstance":1}]}},{"InstanceCount":1,"InstanceGroupType":"CORE","Name":"Central","InstanceType":"m4.large","EbsConfiguration":{"EbsBlockDeviceConfigs":[{"VolumeSpecification":{"VolumeType":"gp2","SizeInGB":32},"VolumesPerInstance":1}]}},{"InstanceCount":1,"InstanceGroupType":"MASTER","Name":"Principal","InstanceType":"m4.large","EbsConfiguration":{"EbsBlockDeviceConfigs":[{"VolumeSpecification":{"VolumeType":"gp2","SizeInGB":32},"VolumesPerInstance":1}]}}]' \
 --auto-scaling-role "arn:aws:iam::845783312919:role/EMR_AutoScaling_DefaultRole" \
 --scale-down-behavior "TERMINATE_AT_TASK_COMPLETION" \
 --region "us-east-1"