#Linux distribuition
FROM kalilinux/kali-rolling

#update packages
RUN apt update && apt upgrade -y

RUN apt install -y wget curl nmap net-tools iputils-ping sqlmap wfuzz tar amass git vim parallel host netcat

	
	
#Install go
RUN wget https://go.dev/dl/go1.21.0.linux-amd64.tar.gz -O /tmp/go.tar.gz && \
	cd /tmp && tar -xf go.tar.gz && \
	mv go /opt && ln -s /opt/go/bin/go /bin/go && rm -rf /tmp/go.tar.gz


#Install packages go
RUN go install github.com/tomnomnom/assetfinder@latest && ln -s /root/go/bin/assetfinder /bin/assetfinder &&\
	go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest && ln -s /root/go/bin/subfinder /bin/subfinder &&\
	go install -v github.com/tomnomnom/anew@latest && ln -s /root/go/bin/anew /bin/anew &&\
	go install -v github.com/lc/gau/v2/cmd/gau@latest && ln -s /root/go/bin/gau /bin/gau &&\
	go install -v github.com/tomnomnom/waybackurls@latest && ln -s /root/go/bin/waybackurls /bin/waybackurls &&\
	go install -v github.com/bp0lr/gauplus@latest && ln -s /root/go/bin/gauplus /bin/gauplus &&\
	go install -v github.com/projectdiscovery/notify/cmd/notify@latest && ln -s /root/go/bin/notify /bin/notify &&\
	go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest && ln -s /root/go/bin/httpx /bin/httpx



#For dont stop after init
CMD ["tail" ,"-f" ,"/dev/null"]
