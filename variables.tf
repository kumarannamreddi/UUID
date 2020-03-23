variable "vpc_id" {
        description     =        "The default VPC"
        type            =        "string"
        default         =        ""
}

variable "db_ami" {
        description     =       "providing the ami id"
        type            =       "string"
        default         =       ""
}

variable "security_groups" {
    type                =  "list"
    description         = "list of security groups"
    default             =  [""]
}

variable "type" {
        type            =       "string"
        default         =       "r5.2xlarge"
}

variable "subnet_id" {
        type            =       "string"
        default         =       ""
}

variable "key_name" {
        type            =       "string"
        default         =       "ctestmt"
}

variable "tag_snapshot" {
	type		=	"string"
	default 	=	""
}
variable "oraclesid" {
	type 		=	"string"
	default		=	""
}

variable "tag_instance" {
	type 		=	"string"
	default		=	"CTE-CombinedDB-Test"
}
variable "policy" {
        type            =       "string"
        default         =       "CTEEc2InstanceProfile"
}
variable "tag_application" {
        type            =       "string"
        default         =       "CTE"
}
variable "tag_department" {
        type            =       "string"
        default         =       "CTE"
}
variable "enviornment" {
        type            =       "string"
        default         =       "prod"
}

variable "tag_owners" {
	type 		=	"string"
	default		=	"745078641086"
}

variable "tag_type" {
	type		=	"string"
	default		=	"gp2"
}
variable "tag_size" {
        type            =       "string"
        default         =       "16384"
}
variable "tag_az" {
	type		= 	"string"
	default		=	"us-east-1a"
}

variable "tag_term" {
	type		=	"string"
	default		=	"true"
}
