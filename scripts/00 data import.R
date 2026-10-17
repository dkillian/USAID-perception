
# Libya ---- 

lib <- read_rds("data/prepared/Libya/Libya GFA phone survey 2024 - prepared.rds")


# WBG 2024 ---- 

wbg24 <- read_rds("data/prepared/WBG/West Bank Perception Study 2024 - prepared.rds")

# WBG flash ---- 

wbgf <- read_rds("data/prepared/WBG/WBG perception panel survey 2022-2024.rds")

# WBG 2022 ---- 

wbg_full <- read_rds("data/prepared/WBG/Palestinian Perception Study 2022 - prepared.rds") %>%
    mutate(study="WB-Gaza",
           perception_ord = case_when(usaid_perf_cen > 0 ~ 1,
                                      usaid_perf_cen == 0 ~ 0,
                                      usaid_perf_cen < 0 ~ -1,
                                      TRUE ~ NA_real_))

names(wbg_full)
frq(wbg_full$usaid_perf_cen)
frq(wbg_full$perception_ord)

wbg <- wbg_full %>%
    select(study, 
           info=info_trt, 
           perception=usaid_perf_bin,
           perception_ord) %>%
    na.omit()

# Iraq ---- 

irq_perf_full <- read_dta("data/prepared/Iraq/perf_merg.dta") %>%
    mutate(perception_ord = case_when(USAID_perf_ord > 0 ~ 1,
                                      USAID_perf_ord == 0 ~ 0,
                                      USAID_perf_ord < 0 ~ -1,
                                      TRUE ~ NA_real_))

names(irq_full)
frq(irq_full$USAID_perf_ord)
frq(irq_full$perception_ord)

irq <- irq_full %>%
    mutate(study = case_when(hh==1 ~ "Iraq - household",
                             TRUE ~ "Iraq - crowdsource")) %>%
    select(study, 
           info=info_treat, 
           perception=USAID_performance,
           perception_ord) %>%
    na.omit()


# Afghanistan ---- 

afg_full <- read_rds("data/prepared/BPPS prepared.rds") %>%
    mutate(study="Afghanistan",
           perception_ord = case_when(USAID_perception_ord > 3 ~ 1,
                                      USAID_perception_ord < 3 ~ -1,
                                      USAID_perception_ord == 3 ~ 0,
                                      TRUE ~ NA_real_))
#         USAID_perception_cen=USAID_perception_ord-3)

frq(afg_full$perception_ord)
names(afg_full)

frq(afg_full$USAID_perception_ord)
frq(afg_full$perception_ord)

afg <- afg_full %>%
    select(study, 
           info,
           perception=USAID_perception_bin,
           perception_ord) %>%
    na.omit()

# Bangladesh ---- 

bd <- read_dta("data/prepared/Bangladesh/Branding_Bangladesh_November2015.dta")












