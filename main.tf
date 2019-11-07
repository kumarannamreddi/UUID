provider "aws" {
        region          =       "us-east-1"
}
resource "aws_instance" "CombinedDB" {
        ami                     =       "${var.db_ami}"
        instance_type           =       "${var.type}"
        subnet_id               =       "${var.subnet_id}"
        vpc_security_group_ids  =       "${var.security_groups}"
        key_name                =       "${var.key_name}"
        iam_instance_profile    =       "${var.policy}"
        ebs_optimized           =       "${var.tag_term}"
        tags ={
                Name                    =       "${var.tag_instance}"
                applicationid           =       "${var.tag_application}"
                unique_id               =       "CTE_CUSTOMER"
                version                 =       "1"
                department              =       "${var.tag_department}"
                env                     =       "${var.enviornment}"
		DATE                    =       "${formatdate("DD-MMM-YYYY hh:mm:ss ZZZ", timestamp())}"

           }
}

resource "aws_ebs_volume" "vol1-CombinedDB" {
        availability_zone 	= 	"us-east-1a"
        size 			= 	"${var.tag_size}"
        type 			= 	"${var.tag_type}"
        tags  = {
		Name 		= 	"CombinedDB_${formatdate("DD-MMM-YYYY", timestamp())}"
                DATE            = 	"${formatdate("DD-MMM-YYYY hh:mm:ss ZZZ", timestamp())}"

        }
}

resource "aws_volume_attachment" "vol1-CombinedDB-attachment" {
        device_name 		= 	"/dev/xvdi"
        volume_id 		= 	"${aws_ebs_volume.vol1-CombinedDB.id}"
        instance_id 		= 	"${aws_instance.CombinedDB.id}"
}

resource "aws_ebs_volume" "vol2-CombinedDB" {
        availability_zone       =       "us-east-1a"
        size                    =       "${var.tag_size}"
        type                    =       "${var.tag_type}"
        tags  = {
                Name            =       "CombinedDB_${formatdate("DD-MMM-YYYY", timestamp())}"
                DATE            =       "${formatdate("DD-MMM-YYYY hh:mm:ss ZZZ", timestamp())}"

        }
}

resource "aws_volume_attachment" "vol2-CombinedDB-attachment" {
        device_name             =       "/dev/xvdj"
        volume_id               =       "${aws_ebs_volume.vol2-CombinedDB.id}"
        instance_id             =       "${aws_instance.CombinedDB.id}"
}

output "instance_ip" {
        value                   =       "${aws_instance.CombinedDB.*.private_ip[0]}"
}

