# grafana
Grafana container with simplified build and some visualization panels pre-installed.

* Internal sqlite storage is located at "/data". Bind a volume there for resiliency.
* Default user is "admin" and default password is "admin". You will be prompted to change initial password on first login.
* You can create containers FROM this one in order to add pre-installed dashboards and datasources. Simply add your json dashboards/datasources to /provisioning on your Dockerfile. See http://github.com/flaviostutz/docker-swarm-grafana as an example.

## Usage

docker-compose.yml

```
version: '3.5'

services:

  grafana:
    image: flaviostutz/grafana
    ports:
      - 3000:3000
    volumes:
      - grafana:/data
    environment:
      - GF_SECURITY_ADMIN_PASSWORD=mypass

volumes:
  grafana:

```

Open your browser at http://localhost:3000/

## Pre-installed visualization panels
  * grafana-worldmap-panel
  * grafana-piechart-panel
  * petrslavotinek-carpetplot-panel
  * neocat-cal-heatmap-panel
  * briangann-gauge-panel
  * jdbranham-diagram-panel
  * citilogics-geoloop-panel
  * mtanda-histogram-panel
  * mtanda-heatmap-epoch-panel
  * natel-plotly-panel 
  * bessler-pictureit-panel
