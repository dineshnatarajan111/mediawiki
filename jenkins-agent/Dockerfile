# Use the official Azure CLI image from Microsoft
FROM redhat/ubi8:8.9

USER root

ENV AZURE_CONFIG_DIR = "$WORKSPACE/.azure"

RUN dnf update -y
RUN dnf install -y https://packages.microsoft.com/config/rhel/8/packages-microsoft-prod.rpm
RUN dnf install azure-cli -y
RUN dnf install -y dnf-plugins-core && \
    dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo && \
    dnf install terraform -y

RUN curl -L https://mirror.openshift.com/pub/openshift-v4/clients/helm/latest/helm-linux-amd64 -o /usr/local/bin/helm
RUN chmod +x /usr/local/bin/helm

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

RUN useradd -m -d /home/jenkins -s /bin/bash jenkins

RUN chown -R jenkins:jenkins /home && chmod -R 755 /home

USER jenkins

# Start a shell by default
CMD ["sh"]

LABEL maintainer="Dinesh NATARAJAN"
LABEL description="This Dockerimage has azure-cli, terrafrom, kubectl, HELM installed on top of RHEL-ubi:8.9"
