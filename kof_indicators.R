library(kofdata)
library(zoo)

# Download data ---------------------------------------------------------------

# KOF Business Situation Indicator for the manufacturing sector and
# Expected order intake in the manufacturing sector
kof_ts <- get_time_series(c(
  "ch.kof.inu.ng08.fx.q_ql_ass_bs.balance",
  "ch.kof.inu.ng08.fx.q_ql_exp_chg_order_in_n3m.balance.d11"
))

# data with structure specification ------------------------------------------

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

kof_ind<-rbind(bs_manufactur, 
               exp_chg_order_in_manufactur)


# Export  ---------------------------------------------------------------------
write.table(kof_ind, "kof_indicators.csv", sep=",", fileEncoding="UTF-8", row.names = F)
