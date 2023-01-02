FROM ubuntu:20.04 as unzip
RUN mkdir /NOP
RUN apt update && \
    apt install wget unzip -y && \
    cd /NOP && \
    wget https://github.com/nopSolutions/nopCommerce/releases/download/release-4.50.4/nopCommerce_4.50.4_NoSource_linux_x64.zip && \
    unzip /NOP/nopCommerce_4.50.4_NoSource_linux_x64.zip && \
    rm  /NOP/nopCommerce_4.50.4_NoSource_linux_x64.zip
FROM mcr.microsoft.com/dotnet/aspnet:6.0
LABEL author="me"
COPY --from=unzip /NOP /NOP
WORKDIR /NOP
EXPOSE 80
CMD ["dotnet","Nop.Web.dll"]