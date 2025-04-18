cat <<EOF | sudo tee /etc/docker/daemon.json
{
	"log-driver": "json-file",
	"log-opts": {
    	"max-size": "64m",
    	"max-file": "1"
	}
}
EOF
