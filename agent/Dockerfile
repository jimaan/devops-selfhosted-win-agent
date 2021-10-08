# escape=`
FROM mcr.microsoft.com/windows/servercore:ltsc2019

ENV AGENT_VERSION 2.192.0

WORKDIR /azp

COPY scripts/ scripts/

COPY setup.ps1 .

RUN powershell -executionpolicy unrestricted .\setup.ps1

COPY start.ps1 .

CMD powershell -executionpolicy unrestricted .\start.ps1
