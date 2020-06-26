# Specify the provider and access details
provider "aws" {
  region = "${var.aws_region}"
}

data "aws_vpc" "current" {
  tags {
    Name = "test"
  }
}

data "aws_subnet_ids" "public" {
  vpc_id = "${data.aws_vpc.current.id}"

  tags {
    Visibility = "public"
  }
}

data "aws_subnet" "public" {
  count  = "${length(data.aws_subnet_ids.public.ids)}"
  vpc_id = "${data.aws_vpc.current.id}"

  tags {
    Name = "AZ-${count.index + 1}"
  }
}