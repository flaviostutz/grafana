FROM debian:stretch-slim

ENV GF_SECURITY_ADMIN_USER admin
ENV GF_SECURITY_ADMIN_PASSWORD admin
ENV GF_LOG_LEVEL info

RUN apt-get update && apt-get install -y wget libfontconfig ca-certificates
RUN apt-get autoremove -y && rm -rf /var/lib/apt/lists/*

RUN wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana_5.2.2_amd64.deb -O /grafana.deb
RUN dpkg -i grafana.deb
RUN rm grafana.deb

#PANELS
RUN grafana-cli plugins install grafana-worldmap-panel
RUN grafana-cli plugins install grafana-piechart-panel
RUN grafana-cli plugins install petrslavotinek-carpetplot-panel
RUN grafana-cli plugins install neocat-cal-heatmap-panel
RUN grafana-cli plugins install briangann-gauge-panel
RUN grafana-cli plugins install jdbranham-diagram-panel
RUN grafana-cli plugins install citilogics-geoloop-panel
RUN grafana-cli plugins install mtanda-histogram-panel
RUN grafana-cli plugins install mtanda-heatmap-epoch-panel
RUN grafana-cli plugins install natel-plotly-panel 
RUN grafana-cli plugins install bessler-pictureit-panel
RUN grafana-cli plugins install grafana-clock-panel
RUN grafana-cli plugins install novalabs-annotations-panel
RUN grafana-cli plugins install digrich-bubblechart-panel
RUN grafana-cli plugins install briangann-datatable-panel
RUN grafana-cli plugins install natel-discrete-panel
RUN grafana-cli plugins install savantly-heatmap-panel
RUN grafana-cli plugins install snuids-radar-panel
RUN grafana-cli plugins install blackmirror1-statusbygroup-panel
RUN grafana-cli plugins install vonage-status-panel
RUN grafana-cli plugins install zuburqan-parity-report-panel

#DATASOURCES
RUN grafana-cli plugins install camptocamp-prometheus-alertmanager-datasource


ADD run.sh /run.sh

VOLUME [ "/data" ]

EXPOSE 3000

CMD [ "/run.sh" ]