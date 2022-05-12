library(lubridate)
library(stringr)
library(readr)
library(tidyverse)
library(MASS)
library(ggplot2)

# Load in the dataset
NCAAF2019 <- read_csv("NCAAF2019_complete.csv")

# Vector for team names
team_name <- c("AbileneChristian",
               "AirForce",
               "Akron",
               "Alabama",
               "Alabama-Birmingham",
               "AlabamaState",
               "Albany",
               "AlcornState",
               "AppalachianState",
               "Arizona",
               "ArizonaState",
               "Arkansas",
               "Arkansas-PineBluff",
               "ArkansasState",
               "Army",
               "Auburn",
               "BallState",
               "Baylor",
               "Bethune-Cookman",
               "BoiseState",
               "BostonCollege",
               "BowlingGreenState",
               "BrighamYoung",
               "Bucknell",
               "Buffalo",
               "California",
               "California-Davis",
               "CalPoly",
               "Campbell",
               "CentralArkansas",
               "CentralConnecticutState",
               "CentralFlorida",
               "CentralMichigan",
               "CharlestonSouthern",
               "Charlotte",
               "Chattanooga",
               "Cincinnati",
               "Citadel",
               "Clemson",
               "CoastalCarolina",
               "Colgate",
               "Colorado",
               "ColoradoState",
               "Connecticut",
               "Delaware",
               "Duke",
               "EastCarolina",
               "EasternIllinois",
               "EasternKentucky",
               "EasternMichigan",
               "EasternWashington",
               "EastTennesseeState",
               "Elon",
               "Florida",
               "FloridaA&M",
               "FloridaAtlantic",
               "FloridaInternational",
               "FloridaState",
               "Fordham",
               "FresnoState",
               "Furman",
               "Gardner-Webb",
               "Georgia",
               "GeorgiaSouthern",
               "GeorgiaState",
               "GeorgiaTech",
               "GramblingState",
               "Hampton",
               "Hawaii",
               "HolyCross",
               "Houston",
               "HoustonBaptist",
               "Howard",
               "Idaho",
               "IdahoState",
               "Illinois",
               "IllinoisState",
               "IncarnateWord",
               "Indiana",
               "IndianaState",
               "Iowa",
               "IowaState",
               "JacksonState",
               "JamesMadison",
               "Kansas",
               "KansasState",
               "KennesawState",
               "KentState",
               "Kentucky",
               "Lamar",
               "Liberty",
               "Louisiana",
               "Louisiana-Monroe",
               "LouisianaState",
               "LouisianaTech",
               "Louisville",
               "Maine",
               "Marshall",
               "Maryland",
               "Massachusetts",
               "McNeeseState",
               "Memphis",
               "Mercer",
               "Miami(FL)",
               "Miami(OH)",
               "Michigan",
               "MichiganState",
               "MiddleTennesseeState",
               "Minnesota",
               "Mississippi",
               "MississippiState",
               "Missouri",
               "MissouriState",
               "Monmouth",
               "Montana",
               "MontanaState",
               "MorganState",
               "MurrayState",
               "Navy",
               "Nebraska",
               "Nevada",
               "Nevada-LasVegas",
               "NewHampshire",
               "NewMexico",
               "NewMexicoState",
               "NichollsState",
               "NorfolkState",
               "NorthCarolina",
               "NorthCarolinaA&T",
               "NorthCarolinaState",
               "NorthernArizona",
               "NorthernColorado",
               "NorthernIllinois",
               "NorthernIowa",
               "NorthTexas",
               "Northwestern",
               "NorthwesternState",
               "NotreDame",
               "Ohio",
               "OhioState",
               "Oklahoma",
               "OklahomaState",
               "OldDominion",
               "Oregon",
               "OregonState",
               "PennState",
               "Pittsburgh",
               "PortlandState",
               "PrairieViewA&M",
               "Purdue",
               "RhodeIsland",
               "Rice",
               "Richmond",
               "RobertMorris",
               "Rutgers",
               "SacramentoState",
               "Samford",
               "SamHoustonState",
               "SanDiegoState",
               "SanJoseState",
               "SouthAlabama",
               "SouthCarolina",
               "SouthCarolinaState",
               "SouthDakota",
               "SouthDakotaState",
               "SoutheasternLouisiana",
               "SoutheastMissouriState",
               "Southern",
               "SouthernCalifornia",
               "SouthernIllinois",
               "SouthernMethodist",
               "SouthernMississippi",
               "SouthernUtah",
               "SouthFlorida",
               "Stanford",
               "StephenF.Austin",
               "StonyBrook",
               "Syracuse",
               "Temple",
               "Tennessee",
               "Tennessee-Martin",
               "TennesseeState",
               "TennesseeTech",
               "Texas",
               "Texas-ElPaso",
               "Texas-SanAntonio",
               "TexasA&M",
               "TexasChristian",
               "TexasSouthern",
               "TexasState",
               "TexasTech",
               "Toledo",
               "Towson",
               "Troy",
               "Tulane",
               "Tulsa",
               "UCLA",
               "Utah",
               "UtahState",
               "Vanderbilt",
               "Virginia",
               "VirginiaMilitaryInstitute",
               "VirginiaTech",
               "Wagner",
               "WakeForest",
               "Washington",
               "WashingtonState",
               "WeberState",
               "WesternCarolina",
               "WesternIllinois",
               "WesternKentucky",
               "WesternMichigan",
               "WestVirginia",
               "William&Mary",
               "Wisconsin",
               "Wofford",
               "Wyoming")

# Vector for conferences
team_conf <- c("NonFBS",
               "MW",
               "MAC",
               "SEC",
               "CUSA",
               "NonFBS",
               "NonFBS",
               "NonFBS",
               "SB",
               "PAC12",
               "PAC12",
               "SEC",
               "NonFBS",
               "SB",
               "IND",
               "SEC",
               "MAC",
               "BIG12",
               "NonFBS",
               "MW",
               "ACC",
               "MAC",
               "IND",
               "NonFBS",
               "MAC",
               "PAC12",
               "NonFBS",
               "NonFBS",
               "NonFBS",
               "NonFBS",
               "NonFBS",
               "AAC",
               "MAC",
               "NonFBS",
               "CUSA",
               "NonFBS",
               "AAC",
               "NonFBS",
               "ACC",
               "SB",
               "NonFBS",
               "PAC12",
               "MW",
               "AAC",
               "NonFBS",
               "ACC",
               "AAC",
               "NonFBS",
               "NonFBS",
               "MAC",
               "NonFBS",
               "NonFBS",
               "NonFBS",
               "SEC",
               "NonFBS",
               "CUSA",
               "CUSA",
               "ACC",
               "NonFBS",
               "MW",
               "NonFBS",
               "NonFBS",
               "SEC",
               "SB",
               "SB",
               "ACC",
               "NonFBS",
               "NonFBS",
               "MW",
               "NonFBS",
               "AAC",
               "NonFBS",
               "NonFBS",
               "NonFBS",
               "NonFBS",
               "BIG10",
               "NonFBS",
               "NonFBS",
               "BIG10",
               "NonFBS",
               "BIG10",
               "BIG12",
               "NonFBS",
               "NonFBS",
               "BIG12",
               "BIG12",
               "NonFBS",
               "MAC",
               "SEC",
               "NonFBS",
               "IND",
               "SB",
               "SB",
               "SEC",
               "CUSA",
               "ACC",
               "NonFBS",
               "CUSA",
               "BIG10",
               "IND",
               "NonFBS",
               "AAC",
               "NonFBS",
               "ACC",
               "MAC",
               "BIG10",
               "BIG10",
               "CUSA",
               "BIG10",
               "SEC",
               "SEC",
               "SEC",
               "NonFBS",
               "NonFBS",
               "NonFBS",
               "NonFBS",
               "NonFBS",
               "NonFBS",
               "AAC",
               "BIG10",
               "MW",
               "MW",
               "NonFBS",
               "MW",
               "IND",
               "NonFBS",
               "NonFBS",
               "ACC",
               "NonFBS",
               "ACC",
               "NonFBS",
               "NonFBS",
               "MAC",
               "NonFBS",
               "CUSA",
               "BIG10",
               "NonFBS",
               "IND",
               "MAC",
               "BIG10",
               "BIG12",
               "BIG12",
               "CUSA",
               "PAC12",
               "PAC12",
               "BIG10",
               "ACC",
               "NonFBS",
               "NonFBS",
               "BIG10",
               "NonFBS",
               "CUSA",
               "NonFBS",
               "NonFBS",
               "BIG10",
               "NonFBS",
               "NonFBS",
               "NonFBS",
               "MW",
               "MW",
               "SB",
               "SEC",
               "NonFBS",
               "NonFBS",
               "NonFBS",
               "NonFBS",
               "NonFBS",
               "NonFBS",
               "PAC12",
               "NonFBS",
               "AAC",
               "CUSA",
               "NonFBS",
               "AAC",
               "PAC12",
               "NonFBS",
               "NonFBS",
               "ACC",
               "AAC",
               "SEC",
               "NonFBS",
               "NonFBS",
               "NonFBS",
               "BIG12",
               "CUSA",
               "CUSA",
               "SEC",
               "BIG12",
               "NonFBS",
               "SB",
               "BIG12",
               "MAC",
               "NonFBS",
               "SB",
               "AAC",
               "AAC",
               "PAC12",
               "PAC12",
               "MW",
               "SEC",
               "ACC",
               "NonFBS",
               "ACC",
               "NonFBS",
               "ACC",
               "PAC12",
               "PAC12",
               "NonFBS",
               "NonFBS",
               "NonFBS",
               "CUSA",
               "MAC",
               "BIG12",
               "NonFBS",
               "BIG10",
               "NonFBS",
               "MW")

# Vector for divisions
team_div <- c("NonFBS",
              "MW_M",
              "MAC_East",
              "SEC_West",
              "CUSA_West",
              "NonFBS",
              "NonFBS",
              "NonFBS",
              "SB_East",
              "PAC12_South",
              "PAC12_South",
              "SEC_West",
              "NonFBS",
              "SB_West",
              "IND",
              "SEC_West",
              "MAC_West",
              "BIG12",
              "NonFBS",
              "MW_M",
              "ACC_A",
              "MAC_East",
              "IND",
              "NonFBS",
              "MAC_East",
              "PAC12_North",
              "NonFBS",
              "NonFBS",
              "NonFBS",
              "NonFBS",
              "NonFBS",
              "AAC_East",
              "MAC_West",
              "NonFBS",
              "CUSA_East",
              "NonFBS",
              "AAC_East",
              "NonFBS",
              "ACC_A",
              "SB_East",
              "NonFBS",
              "PAC12_South",
              "MW_M",
              "AAC_East",
              "NonFBS",
              "ACC_C",
              "AAC_East",
              "NonFBS",
              "NonFBS",
              "MAC_West",
              "NonFBS",
              "NonFBS",
              "NonFBS",
              "SEC_East",
              "NonFBS",
              "CUSA_East",
              "CUSA_East",
              "ACC_A",
              "NonFBS",
              "MW_W",
              "NonFBS",
              "NonFBS",
              "SEC_East",
              "SB_East",
              "SB_East",
              "ACC_C",
              "NonFBS",
              "NonFBS",
              "MW_W",
              "NonFBS",
              "AAC_West",
              "NonFBS",
              "NonFBS",
              "NonFBS",
              "NonFBS",
              "BIG10_West",
              "NonFBS",
              "NonFBS",
              "BIG10_East",
              "NonFBS",
              "BIG10_West",
              "BIG12",
              "NonFBS",
              "NonFBS",
              "BIG12",
              "BIG12",
              "NonFBS",
              "MAC_East",
              "SEC_East",
              "NonFBS",
              "IND",
              "SB_West",
              "SB_West",
              "SEC_West",
              "CUSA_West",
              "ACC_A",
              "NonFBS",
              "CUSA_East",
              "BIG10_East",
              "IND",
              "NonFBS",
              "AAC_West",
              "NonFBS",
              "ACC_C",
              "MAC_East",
              "BIG10_East",
              "BIG10_East",
              "CUSA_East",
              "BIG10_West",
              "SEC_West",
              "SEC_West",
              "SEC_East",
              "NonFBS",
              "NonFBS",
              "NonFBS",
              "NonFBS",
              "NonFBS",
              "NonFBS",
              "AAC_West",
              "BIG10_West",
              "MW_W",
              "MW_W",
              "NonFBS",
              "MW_M",
              "IND",
              "NonFBS",
              "NonFBS",
              "ACC_C",
              "NonFBS",
              "ACC_A",
              "NonFBS",
              "NonFBS",
              "MAC_West",
              "NonFBS",
              "CUSA_West",
              "BIG10_West",
              "NonFBS",
              "IND",
              "MAC_East",
              "BIG10_East",
              "BIG12",
              "BIG12",
              "CUSA_East",
              "PAC12_North",
              "PAC12_North",
              "BIG10_East",
              "ACC_C",
              "NonFBS",
              "NonFBS",
              "BIG10_West",
              "NonFBS",
              "CUSA_West",
              "NonFBS",
              "NonFBS",
              "BIG10_East",
              "NonFBS",
              "NonFBS",
              "NonFBS",
              "MW_W",
              "MW_W",
              "SB_West",
              "SEC_East",
              "NonFBS",
              "NonFBS",
              "NonFBS",
              "NonFBS",
              "NonFBS",
              "NonFBS",
              "PAC12_South",
              "NonFBS",
              "AAC_West",
              "CUSA_West",
              "NonFBS",
              "AAC_East",
              "PAC12_North",
              "NonFBS",
              "NonFBS",
              "ACC_A",
              "AAC_East",
              "SEC_East",
              "NonFBS",
              "NonFBS",
              "NonFBS",
              "BIG12",
              "CUSA_West",
              "CUSA_West",
              "SEC_West",
              "BIG12",
              "NonFBS",
              "SB_West",
              "BIG12",
              "MAC_West",
              "NonFBS",
              "SB_East",
              "AAC_West",
              "AAC_West",
              "PAC12_South",
              "PAC12_South",
              "MW_M",
              "SEC_East",
              "ACC_C",
              "NonFBS",
              "ACC_C",
              "NonFBS",
              "ACC_A",
              "PAC12_North",
              "PAC12_North",
              "NonFBS",
              "NonFBS",
              "NonFBS",
              "CUSA_East",
              "MAC_West",
              "BIG12",
              "NonFBS",
              "BIG10_West",
              "NonFBS",
              "MW_M")

# Vector for subdivisions
subdivision <- rep(NA, length(team_name))
for(i in 1:length(team_name)) {
  if(team_conf[i] == "NonFBS") {
    subdivision[i] <- "NonFBS"
  } else {
    subdivision[i] <- "FBS"
  }
}

# Vector for home/away/neutral
for(i in 1:nrow(NCAAF2019)) {
  if(is.na(NCAAF2019$`Home/Away/Neutral`[i])) {
    NCAAF2019$`Home/Away/Neutral`[i] = "H"
  } else if(NCAAF2019$`Home/Away/Neutral`[i] == "@") {
    NCAAF2019$`Home/Away/Neutral`[i] = "A"
  } else {
    NCAAF2019$`Home/Away/Neutral`[i] = "N"
  }
}

# Vector for month of the year
NCAAF2019$month <- rep(NA, nrow(NCAAF2019))
for(i in 1:nrow(NCAAF2019)) {
  NCAAF2019$month[i] <- substr(NCAAF2019$Date[i], 1, 3)
}

# Vector for numerical month of the year
NCAAF2019$month_n <- rep(NA, nrow(NCAAF2019))
for(i in 1:nrow(NCAAF2019)) {
  if(NCAAF2019$month[i] == "Aug") {
    NCAAF2019$month_n[i] <- 1
  } else if(NCAAF2019$month[i] == "Sep") {
    NCAAF2019$month_n[i] <- 2
  } else if(NCAAF2019$month[i] == "Oct") {
    NCAAF2019$month_n[i] <- 3
  } else if(NCAAF2019$month[i] == "Nov") {
    NCAAF2019$month_n[i] <- 4
  } else if(NCAAF2019$month[i] == "Dec") {
    NCAAF2019$month_n[i] <- 5
  } else if(NCAAF2019$month[i] == "Jan") {
    NCAAF2019$month_n[i] <- 6
  }
}

# List of opponents
opp <- vector(mode = "list", length = length(team_name))

# Vector of games played
games_played <- rep(0, length(team_name))

# Vector for win margin
win_margin <- rep(0, length(team_name))

# Vector for wins
wins <- rep(0, length(team_name))

# Vector for points scored
points_scored <- rep(0, length(team_name))

# Vector for points allowed
points_allowed <- rep(0, length(team_name))

# Vector for opponent's win margin
opp_wm <- rep(0, length(team_name))

# Vector for opponent's win percentage
opp_wp <- rep(0, length(team_name))

# Vector for opponent's points scored
opp_ps <- rep(0, length(team_name))

# Vector for opponent's points allowed
opp_pa <- rep(0, length(team_name))

# Vector for opponent's games played
opp_gp <- rep(0, length(team_name))

# Vector for opponent's opponent's win margin
opp_opp_wm <- rep(0, length(team_name))

# Vector for opponent's opponent's win percentage
opp_opp_wp <- rep(0, length(team_name))

# Vector for opponent's opponent's points scored
opp_opp_ps <- rep(0, length(team_name))

# Vector for opponent's opponent's points allowed
opp_opp_pa <- rep(0, length(team_name))

# Vector for opponent's opponent's opponent's win margin
opp_opp_opp_wm <- rep(0, length(team_name))

# Vector for opponent's opponent's opponent's win percentage
opp_opp_opp_wp <- rep(0, length(team_name))

# Vector for opponent's opponent's opponent's points scored
opp_opp_opp_ps <- rep(0, length(team_name))

# Vector for opponent's opponent's opponent's points allowed
opp_opp_opp_pa <- rep(0, length(team_name))

# Vector for average opponent's opponent's opponent's win margin
avg_opp_opp_opp_wm <- rep(0, length(team_name))

# Vector for average opponent's opponent's opponent's win percentage
avg_opp_opp_opp_wp <- rep(0, length(team_name))

# Vector for average opponent's opponent's opponent's points scored
avg_opp_opp_opp_ps <- rep(0, length(team_name))

# Vector for average opponent's opponent's opponent's points allowed
avg_opp_opp_opp_pa <- rep(0, length(team_name))

# Calculate list of opponents, games played, points scored, points allowed, win margin,
# and wins for each team
for(i in 1:nrow(NCAAF2019)) {
  for(j in 1:length(team_name)) {
    if(NCAAF2019[i, 1] == team_name[j]) {
      opp[[j]] <- c(opp[[j]], NCAAF2019[i,]$Loser)
      games_played[j] <- games_played[j] + 1
      points_scored[j] <- points_scored[j] + as.numeric(NCAAF2019[i, 2])
      points_allowed[j] <- points_allowed[j] + as.numeric(NCAAF2019[i, 3])
      win_margin[j] <- points_scored[j] - points_allowed[j]
      if(as.numeric(NCAAF2019[i, 2]) > as.numeric(NCAAF2019[i, 3])) {
        wins[j] <- wins[j] + 1
      }
    } else if(NCAAF2019[i, 4] == team_name[j]) {
      opp[[j]] <- c(opp[[j]], NCAAF2019[i,]$Winner)
      games_played[j] <- games_played[j] + 1
      points_scored[j] <- points_scored[j] + as.numeric(NCAAF2019[i, 3])
      points_allowed[j] <- points_allowed[j] + as.numeric(NCAAF2019[i, 2])
      win_margin[j] <- points_scored[j] - points_allowed[j]
      if(as.numeric(NCAAF2019[i, 3]) > as.numeric(NCAAF2019[i, 2])) {
        wins[j] <- wins[j] + 1
      }
    }
  }
}

# Calculate averages 
avg_wm <- win_margin / games_played

win_percentage <- wins / games_played

avg_ps <- points_scored / games_played

avg_pa <- points_allowed / games_played

# Calculate opponent's win margin, win percentage, points scored, and points allowed
for(i in 1:length(team_name)) {
  for(j in 1:length(opp[[i]])) {
    for(k in 1:length(team_name)) {
      if(opp[[i]][j] == team_name[k]) {
        opp_wm[i] <- opp_wm[i] + avg_wm[k]
        opp_wp[i] <- opp_wp[i] + win_percentage[k]
        opp_ps[i] <- opp_ps[i] + avg_ps[k]
        opp_pa[i] <- opp_pa[i] + avg_pa[k]
      }
    }
  }
}

# Calculate averages
avg_opp_wm <- opp_wm / games_played

avg_opp_wp <- opp_wp / games_played

avg_opp_ps <- opp_ps / games_played

avg_opp_pa <- opp_pa / games_played

# Calculate opponent's opponent's win margin, win percentage, points scored, and points allowed
for(i in 1:length(team_name)) {
  for(j in 1:length(opp[[i]])) {
    for(k in 1:length(team_name)) {
      if(opp[[i]][j] == team_name[k]) {
        opp_opp_wm[i] <- opp_opp_wm[i] + avg_opp_wm[k]
        opp_opp_wp[i] <- opp_opp_wp[i] + avg_opp_wp[k]
        opp_opp_ps[i] <- opp_opp_ps[i] + avg_opp_ps[k]
        opp_opp_pa[i] <- opp_opp_pa[i] + avg_opp_pa[k]
      }
    }
  }
}

# Calculate averages
avg_opp_opp_wm <- opp_opp_wm / games_played

avg_opp_opp_wp <- opp_opp_wp / games_played

avg_opp_opp_ps <- opp_opp_ps / games_played

avg_opp_opp_pa <- opp_opp_pa / games_played

# Calculate opponent's opponent's opponent's win margin, win percentage,
# points scored, and points allowed
for(i in 1:length(team_name)) {
  for(j in 1:length(opp[[i]])) {
    for(k in 1:length(team_name)) {
      if(opp[[i]][j] == team_name[k]) {
        opp_opp_opp_wm[i] <- opp_opp_opp_wm[i] + avg_opp_opp_wm[k]
        opp_opp_opp_wp[i] <- opp_opp_opp_wp[i] + avg_opp_opp_wp[k]
        opp_opp_opp_ps[i] <- opp_opp_opp_ps[i] + avg_opp_opp_ps[k]
        opp_opp_opp_pa[i] <- opp_opp_opp_pa[i] + avg_opp_opp_pa[k]
      }
    }
  }
}

# Calculate averages
avg_opp_opp_opp_wm <- opp_opp_opp_wm / games_played

avg_opp_opp_opp_wp <- opp_opp_opp_wp / games_played

avg_opp_opp_opp_ps <- opp_opp_opp_ps / games_played

avg_opp_opp_opp_pa <- opp_opp_opp_pa / games_played

# Create a dataset with variables to use for model building
model_data <- tibble("w" = rep(NA, nrow(NCAAF2019) * 2), "wm" = rep(NA, nrow(NCAAF2019) * 2),
                     "ps" = rep(NA, nrow(NCAAF2019) * 2), "pa" = rep(NA, nrow(NCAAF2019) * 2), 
                     "month" = rep(NA, nrow(NCAAF2019) * 2), "subdiv" = rep(NA, nrow(NCAAF2019) * 2), 
                     "div" = rep(NA, nrow(NCAAF2019) * 2), "conf" = rep(NA, nrow(NCAAF2019) * 2), 
                     "home_away_neutral" = rep(NA, nrow(NCAAF2019) * 2),
                     "month_n" = rep(NA, nrow(NCAAF2019) * 2),
                     "dif_avg_wm" = rep(NA, nrow(NCAAF2019) * 2),
                     "dif_win_percentage" = rep(NA, nrow(NCAAF2019) * 2),
                     "dif_avg_ps" = rep(NA, nrow(NCAAF2019) * 2), 
                     "dif_avg_pa" = rep(NA, nrow(NCAAF2019) * 2), 
                     "dif_avg_opp_wm" = rep(NA, nrow(NCAAF2019) * 2),
                     "dif_avg_opp_wp" = rep(NA, nrow(NCAAF2019) * 2),
                     "dif_avg_opp_ps" = rep(NA, nrow(NCAAF2019) * 2), 
                     "dif_avg_opp_pa" = rep(NA, nrow(NCAAF2019) * 2),
                     "dif_avg_opp_opp_wm" = rep(NA, nrow(NCAAF2019) * 2),
                     "dif_avg_opp_opp_wp" = rep(NA, nrow(NCAAF2019) * 2), 
                     "dif_avg_opp_opp_ps" = rep(NA, nrow(NCAAF2019) * 2),
                     "dif_avg_opp_opp_pa" = rep(NA, nrow(NCAAF2019) * 2),
                     "dif_avg_opp_opp_opp_wm" = rep(NA, nrow(NCAAF2019) * 2),
                     "dif_avg_opp_opp_opp_wp" = rep(NA, nrow(NCAAF2019) * 2), 
                     "dif_avg_opp_opp_opp_ps" = rep(NA, nrow(NCAAF2019) * 2),
                     "dif_avg_opp_opp_opp_pa" = rep(NA, nrow(NCAAF2019) * 2),
                     "opp_div" = rep(NA, nrow(NCAAF2019) * 2), "opp_conf" = rep(NA, nrow(NCAAF2019) * 2),
                     "opp_subdiv" = rep(NA, nrow(NCAAF2019) * 2),
                     "team" = rep(NA, nrow(NCAAF2019) * 2), "opp" = rep(NA, nrow(NCAAF2019) * 2))

# Input all needed data into the model building dataset
for(i in 1:nrow(NCAAF2019)) {
  model_data$w[i] <- 1
  model_data$wm[i] <- NCAAF2019$ScoreW[i] - NCAAF2019$ScoreL[i]
  model_data$ps[i] <- NCAAF2019$ScoreW[i]
  model_data$pa[i] <- NCAAF2019$ScoreL[i]
  model_data$month[i] <- NCAAF2019$month[i]
  model_data$month_n[i] <- NCAAF2019$month_n[i]
  model_data$week[i] <- NCAAF2019$Wk[i]
  if(NCAAF2019$`Home/Away/Neutral`[i] == "H") {
    model_data$home_away_neutral[i] <- "H"
  } else if(NCAAF2019$`Home/Away/Neutral`[i] == "A") {
    model_data$home_away_neutral[i] <- "A"
  } else {
    model_data$home_away_neutral[i] <- "N"
  }
  model_data$team[i] <- NCAAF2019$Winner[i]
  model_data$opp[i] <- NCAAF2019$Loser[i]
  for(j in 1:length(team_name)) {
    for(k in 1:length(team_name)) {
      if(NCAAF2019$Winner[i] == team_name[j]) {
        if(NCAAF2019$Loser[i] == team_name[k]) {
          model_data$div[i] <- team_div[j]
          model_data$conf[i] <- team_conf[j]
          model_data$subdiv[i] <- subdivision[j]
          model_data$dif_avg_wm[i] <- avg_wm[j] - avg_wm[k]
          model_data$dif_win_percentage[i] <- win_percentage[j] - win_percentage[k]
          model_data$dif_avg_ps[i] <- avg_ps[j] - avg_ps[k]
          model_data$dif_avg_pa[i] <- avg_pa[j] - avg_pa[k]
          model_data$dif_avg_opp_wm[i] <- avg_opp_wm[j] - avg_opp_wm[k]
          model_data$dif_avg_opp_wp[i] <- avg_opp_wp[j] - avg_opp_wp[k]
          model_data$dif_avg_opp_ps[i] <- avg_opp_ps[j] - avg_opp_ps[k]
          model_data$dif_avg_opp_pa[i] <- avg_opp_pa[j] - avg_opp_pa[k]
          model_data$dif_avg_opp_opp_wm[i] <- avg_opp_opp_wm[j] - avg_opp_opp_wm[k]
          model_data$dif_avg_opp_opp_wp[i] <- avg_opp_opp_wp[j] - avg_opp_opp_wp[k]
          model_data$dif_avg_opp_opp_ps[i] <- avg_opp_opp_ps[j] - avg_opp_opp_ps[k]
          model_data$dif_avg_opp_opp_pa[i] <- avg_opp_opp_pa[j] - avg_opp_opp_pa[k]
          model_data$dif_avg_opp_opp_opp_wm[i] <- avg_opp_opp_opp_wm[j] - avg_opp_opp_opp_wm[k]
          model_data$dif_avg_opp_opp_opp_wp[i] <- avg_opp_opp_opp_wp[j] - avg_opp_opp_opp_wp[k]
          model_data$dif_avg_opp_opp_opp_ps[i] <- avg_opp_opp_opp_ps[j] - avg_opp_opp_opp_ps[k]
          model_data$dif_avg_opp_opp_opp_pa[i] <- avg_opp_opp_opp_pa[j] - avg_opp_opp_opp_pa[k]
          model_data$opp_div[i] <- team_div[k]
          model_data$opp_conf[i] <- team_conf[k]
          model_data$opp_subdiv[i] <- subdivision[k]
        }
      }
    }
  }
  model_data$w[i + nrow(NCAAF2019)] <- 0
  model_data$wm[i + nrow(NCAAF2019)] <- NCAAF2019$ScoreL[i] - NCAAF2019$ScoreW[i]
  model_data$ps[i + nrow(NCAAF2019)] <- NCAAF2019$ScoreL[i]
  model_data$pa[i + nrow(NCAAF2019)] <- NCAAF2019$ScoreW[i]
  model_data$month[i + nrow(NCAAF2019)] <- NCAAF2019$month[i]
  model_data$month_n[i + nrow(NCAAF2019)] <- NCAAF2019$month_n[i]
  model_data$week[i + nrow(NCAAF2019)] <- NCAAF2019$Wk[i]
  if(NCAAF2019$`Home/Away/Neutral`[i] == "H") {
    model_data$home_away_neutral[i + nrow(NCAAF2019)] <- "A"
  } else if(NCAAF2019$`Home/Away/Neutral`[i] == "A") {
    model_data$home_away_neutral[i + nrow(NCAAF2019)] <- "H"
  } else {
    model_data$home_away_neutral[i + nrow(NCAAF2019)] <- "N"
  }
  model_data$team[i + nrow(NCAAF2019)] <- NCAAF2019$Loser[i]
  model_data$opp[i + nrow(NCAAF2019)] <- NCAAF2019$Winner[i]
  for(j in 1:length(team_name)) {
    for(k in 1:length(team_name)) {
      if(NCAAF2019$Loser[i] == team_name[j]) {
        if(NCAAF2019$Winner[i] == team_name[k]) {
          model_data$div[i + nrow(NCAAF2019)] <- team_div[j]
          model_data$conf[i + nrow(NCAAF2019)] <- team_conf[j]
          model_data$subdiv[i + nrow(NCAAF2019)] <- subdivision[j]
          model_data$dif_avg_wm[i + nrow(NCAAF2019)] <- avg_wm[j] - avg_wm[k]
          model_data$dif_win_percentage[i + nrow(NCAAF2019)] <- win_percentage[j] - win_percentage[k]
          model_data$dif_avg_ps[i + nrow(NCAAF2019)] <- avg_ps[j] - avg_ps[k]
          model_data$dif_avg_pa[i + nrow(NCAAF2019)] <- avg_pa[j] - avg_pa[k]
          model_data$dif_avg_opp_wm[i + nrow(NCAAF2019)] <- avg_opp_wm[j] - avg_opp_wm[k]
          model_data$dif_avg_opp_wp[i + nrow(NCAAF2019)] <- avg_opp_wp[j] - avg_opp_wp[k]
          model_data$dif_avg_opp_ps[i + nrow(NCAAF2019)] <- avg_opp_ps[j] - avg_opp_ps[k]
          model_data$dif_avg_opp_pa[i + nrow(NCAAF2019)] <- avg_opp_pa[j] - avg_opp_pa[k]
          model_data$dif_avg_opp_opp_wm[i + nrow(NCAAF2019)] <- avg_opp_opp_wm[j] - avg_opp_opp_wm[k]
          model_data$dif_avg_opp_opp_wp[i + nrow(NCAAF2019)] <- avg_opp_opp_wp[j] - avg_opp_opp_wp[k]
          model_data$dif_avg_opp_opp_ps[i + nrow(NCAAF2019)] <- avg_opp_opp_ps[j] - avg_opp_opp_ps[k]
          model_data$dif_avg_opp_opp_pa[i + nrow(NCAAF2019)] <- avg_opp_opp_pa[j] - avg_opp_opp_pa[k]
          model_data$dif_avg_opp_opp_opp_wm[i + nrow(NCAAF2019)] <- avg_opp_opp_opp_wm[j] 
          - avg_opp_opp_opp_wm[k]
          model_data$dif_avg_opp_opp_opp_wp[i + nrow(NCAAF2019)] <- avg_opp_opp_opp_wp[j] 
          - avg_opp_opp_opp_wp[k]
          model_data$dif_avg_opp_opp_opp_ps[i + nrow(NCAAF2019)] <- avg_opp_opp_opp_ps[j] 
          - avg_opp_opp_opp_ps[k]
          model_data$dif_avg_opp_opp_opp_pa[i + nrow(NCAAF2019)] <- avg_opp_opp_opp_pa[j] 
          - avg_opp_opp_opp_pa[k]
          model_data$opp_div[i + nrow(NCAAF2019)] <- team_div[k]
          model_data$opp_conf[i + nrow(NCAAF2019)] <- team_conf[k]
          model_data$opp_subdiv[i + nrow(NCAAF2019)] <- subdivision[k]
        }
      }
    }
  }
}



# Build a model using win margin variables and subdivisions
# (Not using win percentage variables since win margin and win percentage will be highly correlated)
model <- lm(model_data$wm ~ model_data$dif_avg_wm*model_data$subdiv + 
              model_data$dif_avg_opp_wm*model_data$subdiv + 
              model_data$dif_avg_opp_opp_wm*model_data$subdiv +
              model_data$dif_avg_opp_opp_opp_wm*model_data$subdiv +
              model_data$subdiv - 1)
summary(model)
AIC(model)

# Use stepAIC on the previous model to build a new model
model2 <- stepAIC(model)
summary(model2)
AIC(model2)

# Create a factor variable for home/away/neutral
model_data$home_away_neutral <- relevel(factor(model_data$home_away_neutral), "N")

# for home away neutral variable, make H=1, A=-1, and N=0
model_data$h_a_n_num <- rep(0, nrow(model_data))
for(i in 1:nrow(model_data)) {
  if(model_data$home_away_neutral[i] == "H") {
    model_data$h_a_n_num[i] <- 1
  } else if (model_data$home_away_neutral[i] == "A") {
    model_data$h_a_n_num[i] <- -1
  }
}

# Use previous model but now with the home/away/neutral factor variable
model3 <- lm(model_data$wm ~ model_data$dif_avg_wm*model_data$subdiv*model_data$h_a_n_num + 
               model_data$dif_avg_opp_wm*model_data$subdiv*model_data$h_a_n_num + 
               model_data$dif_avg_opp_opp_wm*model_data$subdiv*model_data$h_a_n_num +
               model_data$dif_avg_opp_opp_opp_wm*model_data$subdiv*model_data$h_a_n_num +
               model_data$subdiv*model_data$h_a_n_num)
summary(model3)
AIC(model3)

# Use stepAIC on previous model
model4 <- stepAIC(model3)
summary(model4)
AIC(model4)

# Of these Models I believe Model4 is the best, so I will create a method of viewing the team rankings
# using this model and check the assumptions
rankings$team <- team_name
rankings$ranking <- rep(NA, length(team_name))
rankings$subdiv <- subdivision
for(i in 1:length(team_name)) {
  rankings$ranking <- as.numeric(model4$coefficients[2]) *  avg_wm +
    as.numeric(model4$coefficients[4]) *  avg_opp_wm +
    as.numeric(model4$coefficients[5]) *  avg_opp_opp_wm +
    as.numeric(model4$coefficients[6]) *  avg_opp_opp_opp_wm
}

ranks <- tibble(team = rankings$team, ranking = rankings$ranking, subdiv = rankings$subdiv)

ranks <- tibble(team = ranks[ranks$subdiv == "FBS",]$team, 
                ranking = ranks[ranks$subdiv == "FBS",]$ranking)

ranks <- ranks[with(ranks, order(-ranking)),]

hist(model4$residuals)
qqnorm(model4$residuals)
qqline(model4$residuals)
plot(model4$fitted.values, model4$residuals)
abline(lm(model4$residuals ~ model4$fitted.values))
plot(model_data$wm, model4$fitted.values)
abline(0, 1)
abline(10, 1)
abline(-10, 1)
# Assumptions appear to be good here

# Check to see what percent of the time this model has the correct teams winning
sum <- 0
for(i in 1:nrow(model_data)) {
  sum <- sum + sum((model4$fitted.values[i] > 0) && (model_data$wm[i] > 0))
  sum <- sum + sum((model4$fitted.values[i] < 0) && (model_data$wm[i] < 0))
}
sum / nrow(model_data)
# This is a pretty solid number I'm happy with here

# Next I will go through a model building process using principle components of analysis

# Gather the data to be used for pcas
X <- cbind(model_data$dif_avg_wm, model_data$dif_avg_opp_wm, model_data$dif_avg_opp_opp_wm,
           model_data$dif_avg_opp_opp_opp_wm, model_data$dif_win_percentage, model_data$dif_avg_opp_wp,
           model_data$dif_avg_opp_opp_wp, model_data$dif_avg_opp_opp_opp_wp)
pcas <- prcomp(X)
plot(pcas)
summary(pcas)
# Based on this, the first 2 or 3 pcas will probably be appropriate to use

PC1 <- pcas$x[,1]
PC2 <- pcas$x[,2]
PC3 <- pcas$x[,3]
PC4 <- pcas$x[,4]

# Build model with pcas and home/away/neutral variable
model5 <- lm(model_data$wm ~ PC1 + PC2 + PC3 + model_data$h_a_n_num)
summary(model5)
AIC(model5)

# Create rankings for this model
rankings <- rep(NA, length(team_name))
for(i in 1:length(team_name)) {
  rankings <- model5$coefficients[[2]] * (pcas$rotation[[1,1]] * avg_wm +
                                            pcas$rotation[[2,1]] * avg_opp_wm +
                                            pcas$rotation[[3,1]] * avg_opp_opp_wm +
                                            pcas$rotation[[4,1]] * avg_opp_opp_opp_wm +
                                            pcas$rotation[[5,1]] * win_percentage +
                                            pcas$rotation[[6,1]] * avg_opp_wp +
                                            pcas$rotation[[7,1]] * avg_opp_opp_wp +
                                            pcas$rotation[[8,1]] * avg_opp_opp_opp_wp) +
    model5$coefficients[[3]] * (pcas$rotation[[1,2]] * avg_wm +
                                  pcas$rotation[[2,2]] * avg_opp_wm +
                                  pcas$rotation[[3,2]] * avg_opp_opp_wm +
                                  pcas$rotation[[4,2]] * avg_opp_opp_opp_wm +
                                  pcas$rotation[[5,2]] * win_percentage +
                                  pcas$rotation[[6,2]] * avg_opp_wp +
                                  pcas$rotation[[7,2]] * avg_opp_opp_wp +
                                  pcas$rotation[[8,2]] * avg_opp_opp_opp_wp) +
    model5$coefficients[[4]] * (pcas$rotation[[1,3]] * avg_wm +
                                  pcas$rotation[[2,3]] * avg_opp_wm +
                                  pcas$rotation[[3,3]] * avg_opp_opp_wm +
                                  pcas$rotation[[4,3]] * avg_opp_opp_opp_wm +
                                  pcas$rotation[[5,3]] * win_percentage +
                                  pcas$rotation[[6,3]] * avg_opp_wp +
                                  pcas$rotation[[7,3]] * avg_opp_opp_wp +
                                  pcas$rotation[[8,3]] * avg_opp_opp_opp_wp)
}

ranks <- tibble(team = team_name, ranking = rankings, subdiv = subdivision, conf = team_conf)

ranks <- tibble(team = ranks[ranks$subdiv == "FBS",]$team, 
                ranking = ranks[ranks$subdiv == "FBS",]$ranking,
                conf = ranks[ranks$subdiv == "FBS",]$conf)

ranks <- ranks[with(ranks, order(-ranking)),]

avg_conf_ranks <- ranks %>% group_by(conf) %>% summarise_at(vars(ranking), list(avg_ranking = mean))

# Check assumptions
hist(model5$residuals)
qqnorm(model5$residuals)
qqline(model5$residuals)
plot(model5$fitted.values, model5$residuals)
abline(lm(model5$residuals ~ model5$fitted.values))
plot(model_data$wm, model5$fitted.values)
abline(0, 1)
abline(10, 1)
abline(-10, 1)

# Check to see what percent of the time this model has the correct teams winning
sum <- 0
for(i in 1:nrow(model_data)) {
  sum <- sum + sum((model5$fitted.values[i] > 0) && (model_data$wm[i] > 0))
  sum <- sum + sum((model5$fitted.values[i] < 0) && (model_data$wm[i] < 0))
}
sum / nrow(model_data)
# Again a solid number

# Check prediction intervals for model4 and model5
plot(model_data$wm, model5$fitted.values)
abline(0, 1)
pred_interval <- predict(model4, newdata=data.frame(model5$fitted.values), 
                         interval="prediction", level = 0.99)
lines(model5$fitted.values, pred_interval[,2], col="blue", lty=2)
lines(model5$fitted.values, pred_interval[,3], col="blue", lty=2)
mean(pred_interval[,1] - pred_interval[,2])

plot(model_data$wm, model4$fitted.values)
abline(0, 1)
pred_interval <- predict(model4, newdata=data.frame(model4$fitted.values), 
                         interval="prediction", level = 0.99)
lines(model4$fitted.values, pred_interval[,2], col="blue", lty=2)
lines(model4$fitted.values, pred_interval[,3], col="blue", lty=2)
mean(pred_interval[,1] - pred_interval[,2])

# Build another model with different pcas
X <- cbind(model_data$dif_avg_wm, model_data$dif_avg_opp_wm, model_data$dif_avg_opp_opp_wm,
           model_data$dif_avg_opp_opp_opp_wm, model_data$dif_win_percentage, model_data$dif_avg_opp_wp,
           model_data$dif_avg_opp_opp_wp, model_data$dif_avg_opp_opp_opp_wp)
pcas <- prcomp(X)
plot(pcas)
summary(pcas)
# Again first 2 or 3 pcas should be good here

PC1 <- pcas$x[,1]
PC2 <- pcas$x[,2]
PC3 <- pcas$x[,3]
PC4 <- pcas$x[,4]

# build the new model
model0 <- lm(model_data$wm ~ 0 + PC1 + PC2 + model_data$team + model_data$opp + model_data$h_a_n_num)
summary(model0)
AIC(model0)

# Another even simpler model without pcas
model11 <- lm(model_data$wm ~ 0 + model_data$team + model_data$opp + model_data$h_a_n_num)
summary(model11)

# Check assumptions
hist(model0$residuals)
qqnorm(model0$residuals)
qqline(model0$residuals)
plot(model0$fitted.values, model0$residuals)
abline(lm(model0$residuals ~ model0$fitted.values))
plot(model_data$wm, model0$fitted.values)
abline(0, 1)
abline(10, 1)
abline(-10, 1)
# The nonconstant variance in these plots bothers me, lets look at the simpler model
hist(model11$residuals)
qqnorm(model11$residuals)
qqline(model11$residuals)
plot(model11$fitted.values, model11$residuals)
abline(lm(model11$residuals ~ model11$fitted.values))
plot(model_data$wm, model11$fitted.values)
abline(0, 1)
abline(10, 1)
abline(-10, 1)
# Much better

# Create rankings for this model
rankings <- rep(NA, length(team_name))
rankings[1] <- 0
for(i in 2:length(team_name)) {
  rankings[i] <- (model11$coefficients[i] - model11$coefficients[i + 216]) / 2
}

ranks <- tibble(team = team_name, ranking = rankings - mean(rankings), subdiv = subdivision, conf = team_conf)

ranks <- tibble(team = ranks[ranks$subdiv == "FBS",]$team, 
                ranking = ranks[ranks$subdiv == "FBS",]$ranking,
                conf = ranks[ranks$subdiv == "FBS",]$conf)

avg_conf_ranks <- ranks %>% group_by(conf) %>% summarise_at(vars(ranking), list(avg_ranking = mean))


# I have decided to use model11 as the final model since it appears to work well
# and is simple and easy to understand as well