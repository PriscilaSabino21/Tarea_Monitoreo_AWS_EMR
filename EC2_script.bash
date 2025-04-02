#!/bin/bash

# Variables
AMI_ID="ami-084568db4383264d4"  #ID de la AMI que estás usando
INSTANCE_TYPE="t2.micro"
KEY_NAME="vockey"  # clave SSH
SECURITY_GROUP_ID="sg-0a55689fa845b6bcd"  #  grupo de seguridad
SUBNET_ID="subnet-0c0fabb2604e65d5f"  # ID de subred
IAM_ROLE="EMR_EC2_DefaultRole"  # nombre del rol IAM si lo necesitas

# Crear la nueva instancia EC2
INSTANCE_ID=$(aws ec2 run-instances \
  --image-id $AMI_ID \
  --count 1 \
  --instance-type $INSTANCE_TYPE \
  --key-name $KEY_NAME \
  --security-group-ids $SECURITY_GROUP_ID \
  --subnet-id $SUBNET_ID \
  --block-device-mappings "DeviceName=/dev/sda1,Ebs={VolumeSize=100,VolumeType=gp2}" \
  --iam-instance-profile Name=$IAM_ROLE \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=MiInstanciaEC2},{Key=Environment,Value=Production}]' \
  --query 'Instances[0].InstanceId' \
  --output text)

# Output de la instancia creada
echo "Instancia EC2 creada con ID: $INSTANCE_ID"

# Habilitar protección contra terminación
aws ec2 modify-instance-attribute --instance-id $INSTANCE_ID --no-disable-api-termination

# Output adicional
echo "Protección contra terminación habilitada para la instancia $INSTANCE_ID."
