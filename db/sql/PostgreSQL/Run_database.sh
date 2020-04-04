#!/bin/bash
sudo docker build -t btts_database .
sudo docker run -d -e POSTGRES_PASSWORD=sys -p 8080:5432 btts_database