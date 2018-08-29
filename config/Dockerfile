FROM amazonlinux

Run yum -y update  

ADD requirements.txt /tmp/requirements.txt

Run curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python get-pip.py \
    && pip install -r /tmp/requirements.txt

Run yum -y install \
    unzip \
    awscli \
    make

Run curl https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip  --output /tmp/terraform.zip \
    && unzip /tmp/terraform.zip -d /usr/bin \
    && rm  /tmp/terraform.zip
