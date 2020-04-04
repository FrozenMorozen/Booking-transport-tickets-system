#!/bin/bash
sudo docker build -t BTTS_database .
sudo docker run -e POSTGRES_PASSWORD=sys -p 8080:5432 BTTS_database