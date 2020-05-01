# economic-monitoring

[![Netlify Status](https://api.netlify.com/api/v1/badges/79b229f6-c4b1-4d60-8392-7f9decb56f87/deploy-status)](https://app.netlify.com/sites/kofdata/deploys)


This repository disseminates **high frequency** economic datasets to monitor the Swiss economy.
**Data** in this respository are published in **machine readable** fashion in order to foster effective, frustration free data exchange and processing. The [KOF High Frequency Economic Monitoring dashboard](https://kofdata.netlify.com/#/) provides an regularly updated overview of which datasets are available here. 

![HFD Dashboard](dashboard.png)


## Project Structure 

This repository acts as the backend for the [Vue.js dashboard application](https://github.com/KOF-ch/hfd-dashboard). 
Data are available in 2 formats as described below.

### data/

contains all data and data descriptions in a lite weight format that is friendly to machines and humans alike. This data format was suggested by the swissdata project and has been in use at KOF Swiss Economic Institute since 2018. For more a more elaborate discussion and examples on the swissdata format visit the [swissdata demo repository](https://github.com/swissdata/demo). The data folder of this repository contains .csv data files and .json data descriptions.

### data folder data-statistikZH-monitoring/ 

contains indicators created and/or processed by the KOF Swiss Economic Institute. Made available in a .csv format flavor suggested by statistikZH. Data are exported to feed https://statistikzh.github.io/covid19monitoring/ .

