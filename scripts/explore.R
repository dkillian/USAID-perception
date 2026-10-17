
names(wbg24)

frq(wbg24$q1h)
frq(wbg24$seen_USAID)
frq(wbg24$q2h)

frq(wbg24$q3)
frq(wbg24$q5)
frq(wbg24$q6)

frq(wbg24$msgpretreatment)

frq(wbg24$treatmentmsg1)
frq(wbg24$treatmentmsg2)
frq(wbg24$treatmentmsg3)
frq(wbg24$treatmentmsg4)

frq(wbg24$treat_msg)

var_label(wbg24$treatmentmsg1)

wbg24 <- wbg24 %>%
    mutate(treatment = ifelse(treat_msg>0, 1,0),
           treat_msg = set_labels(treat_msg, labels=c("No treatment", 
                                                      "Two-state solution",
                                                      "Continued assistance",
                                                      "Local engagement and funding",
                                                      "Total funding support")),
           treat_fac = factor(treat_msg, labels=c("No treatment", 
                                                      "Two-state solution",
                                                      "Continued assistance",
                                                      "Local engagement and funding",
                                                      "Total funding support")),
           perf_bin = ifelse(q15==4 | q15==5, 1,0))

frq(wbg24$treatment)
frq(wbg24$treat_msg)
frq(wbg24$treat_fac)
frq(wbg24$q15)
frq(wbg24$perf_bin)
frq(wbg24$percept_message)

lm(perf_bin ~ treatment,
   data=wbg24) %>%
    summary()

trt_mes <- wbg24 %>%
    group_by(treat_fac) %>%
    summarise(perf=mean(perf_bin))

trt_mes

m1 <- lmer(perf_bin ~ (1|treat_fac),
     data=wbg24) 

summary(m1)
ranef(m1)

m1_aov <- anova(m1)
m1_aov

library(emmeans)
?emmeans
lemmeans

m1_em <- emmeans(m1, ".")
m1_em


l1 <- lm(perf_bin ~ treat_fac,
         data=wbg24)
summary(l1)

l1_em <- emmeans(l1, ~treat_fac)
l1_em
pairs(l1_em)

l2 <- lm(perf_bin ~ seen_USAID + treat_fac,
         data=wbg24)

summary(l2)
l2_em <- emmeans(l2, ~treat_fac)
pairs(l2_em)

l3 <- lm(perf_bin ~ seen_USAID + usaid_famil_bin + treat_fac,
         data=wbg24)
summary(l3)


m2 <- lmer(perf_bin ~ treat_fac|seen_USAID,
           data=wbg24)

summary(m2)
ranef(m2)

m3 <- lmer(perf_bin ~ seen_USAID + (treat_fac|usaid_famil_bin),
           data=wbg24)

summary(m3)
ranef(m3)

sat <- wbg24 %>%
    group_by(seen_USAID, usaid_famil_bin, treat_fac) %>%
    summarise(perf=mean(perf_bin)) %>%
    arrange(seen_USAID, usaid_famil_bin)

sat
