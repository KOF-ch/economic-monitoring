library(kofdata)
library(zoo)

# Download data ---------------------------------------------------------------

# kofbarometer
# KOF Business Situation Indicator for the manufacturing sector
# Expected order intake in the manufacturing sector
# Job seekers according to job-room.ch
kof_ts <- get_time_series(c(
  "kofbarometer",
  "ch.kof.inu.ng08.fx.q_ql_ass_bs.balance",
  "ch.kof.inu.ng08.fx.q_ql_exp_chg_order_in_n3m.balance.d11",
  "ch.seco.jobroom.candidates.tot.tot"
))

# data with structure specification ------------------------------------------

# kofbarometer
kofbarometer <- data.frame(
  date = as.POSIXct(paste(as.Date(time(kof_ts$kofbarometer)),
                          "00:00:00",
                          sep = " "
  )),
  value = coredata(kof_ts$kofbarometer),
  topic = "Wirtschaft",
  variable_short = "konjunkturbarometer",
  variable_long = "Indikator für die Schweizer Konjunktur",
  location = "CH",
  unit = "Anteil",
  source = "KOF Konjunkturforschungsstelle",
  update = "monatlich",
  public = "ja",
  description = "https://github.com/KOF-ch/economic-monitoring"
)

# Business Situation Indicator for the manufacturing sector
bs_manufactur <- data.frame(
  date = as.POSIXct(paste(as.Date(time(kof_ts$ch.kof.inu.ng08.fx.q_ql_ass_bs.balance)),
                          "00:00:00",
                          sep = " "
  )),
  value = coredata(kof_ts$ch.kof.inu.ng08.fx.q_ql_ass_bs.balance),
  topic = "Wirtschaft",
  variable_short = "geschaeftslage_verarbeitenden",
  variable_long = "Geschäftslageindikator für das Verarbeitende Gewerbe",
  location = "CH",
  unit = "Anteil",
  source = "KOF Konjunkturforschungsstelle",
  update = "monatlich",
  public = "ja",
  description = "https://github.com/KOF-ch/economic-monitoring"
)

# Expected order intake in the manufacturing sector
exp_chg_order_in_manufactur <- data.frame(
  date = as.POSIXct(paste(as.Date(time(kof_ts$ch.kof.inu.ng08.fx.q_ql_exp_chg_order_in_n3m.balance.d11)),
                          "00:00:00",
                          sep = " "
  )),
  value = coredata(kof_ts$ch.kof.inu.ng08.fx.q_ql_exp_chg_order_in_n3m.balance.d11),
  topic = "Wirtschaft",
  variable_short = "erw_bestelleingang_verarbeitenden",
  variable_long = "Bestellungseingang, erwartete Änderung nächste 3 Monate für das Verarbeitende Gewerbe",
  location = "CH",
  unit = "Anteil",
  source = "KOF Konjunkturforschungsstelle",
  update = "monatlich",
  public = "ja",
  description = "https://github.com/KOF-ch/economic-monitoring"
)

# Job seekers according to www.job-room.ch
jobroom <- data.frame(
  date = as.POSIXct(paste(as.Date(time(kof_ts$ch.seco.jobroom.candidates.tot.tot)),
                          "00:00:00",
                          sep = " "
  )),
  value = coredata(kof_ts$ch.seco.jobroom.candidates.tot.tot),
  topic = "Wirtschaft",
  variable_short = "arbeitsuchende_jobroom",
  variable_long = "Arbeitsuchende gemäss Jobroom.ch",
  location = "CH",
  unit = "Anzahl",
  source = "SECO job-room.ch und KOF Konjunkturforschungsstelle",
  update = "täglich",
  public = "ja",
  description = "https://github.com/KOF-ch/economic-monitoring"
)


kof_ind<-rbind(kofbarometer[!is.na(kofbarometer$value),],
               bs_manufactur[!is.na(bs_manufactur$value),], 
               exp_chg_order_in_manufactur[!is.na(exp_chg_order_in_manufactur$value),],
               jobroom[!is.na(jobroom$value),])



# Export  ---------------------------------------------------------------------
write.table(kof_ind, 
            file.path("data-statistikZH-monitoring","kof_indicators.csv"), 
            sep=",", fileEncoding="UTF-8", row.names = F)

