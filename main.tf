resource "aws_vpc" "main-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public_subnets" {
  vpc_id                  = aws_vpc.main-vpc.id
  count                   = length(var.public_subnets)
  cidr_block              = var.public_subnets[count.index]
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zones[count.index]

  tags = {
    Name = "public-${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnets" {
  vpc_id            = aws_vpc.main-vpc.id
  count             = length(var.private_subnets)
  cidr_block        = var.private_subnets[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "private-${count.index + 1}"
  }

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main-vpc.id

  tags = {
    Name = "igw"
  }
}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block = var.public_routes
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public"
  }
}

resource "aws_route_table_association" "public" {
  count          = length(var.public_subnets)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public.id
}