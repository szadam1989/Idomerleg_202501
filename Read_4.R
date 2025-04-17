#A regisztrációs, felnőtt/GYERMEK, háztartási, valamint napló utáni kérdőívek beolvasása 4. negyedév
library("RODBC")
channel <- odbcDriverConnect(paste("DRIVER={Oracle in OraClient18Home1};DBQ=EMERALD.KSH.HU;UID=", Sys.getenv("userid"), ";PWD=", Sys.getenv("pwd")), DBMSencoding = "ISO-8859-2")
ALAP4 <- sqlQuery(channel, "select REGISZT.TEV, REGISZT.MHO, REGISZT.ISZAK, REGISZT.MC01 OSAP_REG, REGISZT.LAKAZON, REGISZT.HSOR, 
                 FIBD001, FIBD002, FIBD003, FIBD004, FIBD017, FIBD018, FIBD019, FIBD020, FIBD021, FIBD022, FIBD023, FIBD024, FIBD025, 
                 FIBD026, FIBD027, FIBD028, FIBD041, FIBD042, FIBD043, KERDOIV_KITOLTHETO_EVTOL, KERDOIV_KITOLTHETO_HOTOL, 
                 KERDOIV_KITOLTHETO_NAPTOL, KERDOIV_KITOLTHETO_EVIG, KERDOIV_KITOLTHETO_HOIG, KERDOIV_KITOLTHETO_NAPIG, NAPLO_KITOLTHETO_EVTOL, 
                 NAPLO_KITOLTHETO_HOTOL, NAPLO_KITOLTHETO_NAPTOL, NAPLO_KITOLTHETO_EVIG, NAPLO_KITOLTHETO_HOIG, NAPLO_KITOLTHETO_NAPIG, 
                 REGISZT.MEGHI MEGHI_REG, KERDOIVEK.MC01 OSAP_SzemGyerHazt, FIBB001, FIBB002, FIBB003, FIBB004, FIBB005, FIBB006, FIBB007, 
                 FIBB008, FIBB009, FIBB010, FIBB011, FIBB012, FIBB013, FIBB014, FIBB015, FIBB016, FIBB017, FIBB018, FIBB019, FIBB020, FIBB021, 
                 FIBB022, FIBB023, FIBB101, FIBB102, FIBB103, FIBB104, FIBB105, FIBB106, FIBB107, FIBB108, FIBB109, FIBB110, FIBB111, FIBB112, 
                 FIBB113, FIBB114, FIBB115, FIBB116, FIBB117, FIBB118, FIBB119, FIBB120, FIBB121, FIBB122, FIBB123, FIBB124, FIBB125, FIBB126, 
                 FIBB127, FIBB128, FIBB129, FIBB130, FIBB201, FIBB202, FIBB203, FIBB204, FIBB205, FIBB206, FIBB207, FIBB208, FIBB209, FIBB210, 
                 FIBB211, FIBB212, FIBB213, FIBB214, FIBB215, FIBB216, FIBB217, FIBB218, FIBB219, FIBB220, FIBB221, FIBB222, FIBB223, FIBB224, 
                 FIBB225, FIBB226, FIBB227, FIBB228, FIBB229, FIBB230, FIBB231, FIBB232, FIBB233, FIBB234, FIBB235, FIBB236, FIBB237, FIBB238, 
                 FIBB239, FIBB240, FIBB241, FIBB242, FIBB243, FIBB244, FIBB245, FIBB246, FIBB247, FIBB248, FIBB249, FIBB250, FIBB251, FIBB252, 
                 FIBB253, FIBB254, FIBB255, FIBB256, FIBB257, FIBB258, FIBB259, FIBB300, FIBB301, FIBB302, FIBB303, FIBB304, FIBB305, FIBB306, 
                 FIBB307, FIBB308, FIBB309, FIBB310, FIBB311, FIBB312, FIBB313, FIBB314, FIBB315, FIBB316, FIBB317, FIBB318, FIBB319, FIBB401, 
                 FIBB402, FIBB403, FIBB404, FIBB405, FIBB406, FIBB407, FIBB408, FIBB409, FIBB410, FIBB411, FIBB412, FIBB413, FIBB414, FIBB415, 
                 FIBB416, FIBB417, FIBB418, FIBB419, FIBB420, FIBB421, FIBB422, FIBB423, FIBB424, FIBB425, FIBB426, FIBB427, FIBB428, FIBB429, 
                 FIBB430, FIBB431, FIBB432, FIBB433, FIBB434, FIBB435, FIBB436, FIBB437, FIBB438, FIBB439, FIBB440, FIBB441, FIBB505, FIBB506, 
                 FIBB507, FIBB508, FIBB509, FIBB510, FIBB511, FIBB512, FIBB513, FIBB514, FIBB515, FIBB516, FIBB517, FIBB518, FIBB519, FIBB520, 
                 FIBB521, FIBB522, FIBB523, FIBB601, FIBB602, FIBB603, FIBB604, FIBB605, FIBB606, FIBB607, FIBB608, FIBB609, FIBB610, FIBB611, 
                 FIBB612, FIBB613, FIBB614, FIBB615, FIBB616, FIBB617, FIBB618, FIBB619, FIBB620, FIBB621, FIBB622, FIBB623, FIBB624, FIBB625,
                 FIBB626, FIBB627, FIBB628, FIBB629, FIBB630, FIBB631, FIBB632, FIBB633, FIBB634, FIBB701, FIBB702, FIBB703, FIBB704, FIBB705,
                 FIBB706, FIBB707, FIBB708, FIBB709, FIBB710, FIBB711, FIBB712, FIBB713, FIBB714, FIBB044, FIBB024, FIBB025, FIBB026, FIBB027, 
                 FIBB028, FIBB029, FIBB030, FIBB031, FIBB032, FIBB033, FIBB034, FIBB035, FIBB036, FIBB037, FIBB038, FIBB039, FIBB040, FIBB041, 
                 FIBB042, FIBB043, FIBB261, FIBB262, FIBB263, FIBB264, FIBB265, FIBB266, FIBB267, FIBB268, FIBB269, FIBB270, FIBB271, FIBB272, 
                 FIBB273, FIBB274, FIBB275, FIBB276, FIBB277, FIBB278, FIBB279, FIBB321, FIBB322, FIBB323, FIBB324, FIBB325, FIBB326, FIBB327, 
                 FIBB328, FIBB329, FIBB330, FIBB331, FIBB332, FIBB333, FIBB334, FIBB335, FIBB336, FIBB337, FIBB442, FIBB443, FIBB444, FIBB445, 
                 FIBB446, FIBB447, FIBB448, FIBB449, FIBB450, FIBB451, FIBB452, FIBB453, FIBB454, FIBB455, FIBB456, FIBB457, FIBB458, FIBB459, 
                 FIBB460, FIBB461, FIBB462, FIBB463, FIBB464, FIBB465, FIBB466, FIBB467, FIBB468, FIBB469, FIBB470, FIBB471, FIBB472, FIBB473,
                 FIBB474, FIBB475, FIBB476, FIBB477, FIBB478, FIBB479, FIBB480, FIBB481, FIBB482, FIBB715, FIBB716, FIBB717, FIBB718, FIBB719,
                 FIBB720, FIBB721, FIBB722, FIBB723, FIBB724, FIBB725, FIBB726, FIBB727, FIBB728, FIBB045, FIBD101, FIBD102, FIBD103, FIBD104, 
                 FIBD105, FIBD106, FIBD107, FIBA001, FIBA002, FIBA003, FIBA004, FIBA005, FIBA006, FIBA007, FIBA008, FIBA009, FIBA201, FIBA202, 
                 FIBA203, FIBA204, FIBA205, FIBA206, FIBA207, FIBA208, FIBA209, KERDOIVEK.MEGHI MEGHI_SZEMGYERHAZT, NAPLOUTANI.MC01 OSAP_NAPLOUTANI,
                 FIBC001, FIBC002, FIBC003, FIBC004, FIBC005, FIBC006, FIBC007, FIBC008, FIBC009, FIBC010, FIBC011, FIBC012, FIBC013, FIBC014, 
                 FIBC015, FIBC016, FIBC017, FIBC018, FIBC019, FIBC020, FIBC021, FIBC022, FIBC023, FIBC024, FIBC025, FIBC026, FIBC027, FIBC028, 
                 FIBC029, FIBC030, NAPLOUTANI.MEGHI MEGHI_NAPLOUTANI 
                 from FI.FI_8074_REGISZT_NEZET_V24_V00_01 REGISZT, 
                 FI.FI_1711_KERDOIVEK_V24_V00_01 KERDOIVEK, 
                 FI.FI_8075_NAPLOUTANI_V24_V00_01 NAPLOUTANI 
                 where REGISZT.TEV = KERDOIVEK.TEV(+) and REGISZT.ISZAK = KERDOIVEK.ISZAK(+) and REGISZT.LAKAZON = KERDOIVEK.LAKAZON(+) 
                 and REGISZT.TEV = NAPLOUTANI.TEV(+) and REGISZT.ISZAK = NAPLOUTANI.ISZAK(+) and REGISZT.LAKAZON = NAPLOUTANI.LAKAZON(+) 
                 and REGISZT.ISZAK = '01' and
                 REGISZT.MEGHI in ('1', '2', '3', '4', '5', '6', '11', '12', '13', '14', '15', '16')  
                 order by REGISZT.TEV, REGISZT.ISZAK, REGISZT.LAKAZON", as.is = TRUE)

odbcClose(channel)

dim(ALAP4)#3753 sor és 450 oszlop
View(ALAP4)


#Adatbázis oszlopkommentek beolvasása
library("RODBC")
channel <- odbcDriverConnect(paste("DRIVER={Oracle in OraClient18Home1};DBQ=EMERALD.KSH.HU;UID=", Sys.getenv("userid"), ";PWD=", Sys.getenv("pwd")), DBMSencoding = "ISO-8859-2")
COMMENTS <- sqlQuery(channel, "select distinct column_name, comments FROM ALL_COL_COMMENTS 
                     where owner like 'FI' and table_name in ('FI_8074_REGISZT_V24_V00_01', 'FI_1711_KERDOIVEK_V24_V00_01', 
                     'FI_8075_NAPLOFOTEV_V24_V00_01', 'FI_8075_NAPLOALTEV_V24_V00_01', 'FI_8075_NAPLOUTANI_V24_V00_01', 'FI_1711_VALTKOV_V24_V00', 'YS_1711_VALTKOVHTTAG_V24_V00') 
                     order by column_name", as.is = TRUE)

odbcClose(channel)

#Oszlopkommentek hozzárendelése az adatkerethez
for(i in 1:length(colnames(ALAP4))){
  
  comment <- subset(COMMENTS, COLUMN_NAME == colnames(ALAP4)[i], select = c("COMMENTS"))
  
  if(nrow(comment) > 0){
    print(colnames(ALAP4)[i])
    attr(ALAP4[[colnames(ALAP4)[i]]], "label") <- as.character(comment)
    
  }
  
}


attr(ALAP4[["OSAP_REG"]], "label") <- "Regisztrációs kérdőív OSAP száma"
attr(ALAP4[["MEGHI_REG"]], "label") <- "Regisztrációs kérdőív MEGHI kódja"
attr(ALAP4[["MEGHI_SZEMGYERHAZT"]], "label") <- "SzemGyerHazt kérdőívek MEGHI kódja"
attr(ALAP4[["MEGHI_NAPLOUTANI"]], "label") <- "Napló utáni kérdőív MEGHI kódja"
attr(ALAP4[["OSAP_SZEMGYERHAZT"]], "label") <- "SzemGyerHazt kérdőívek OSAP száma"
attr(ALAP4[["OSAP_NAPLOUTANI"]], "label") <- "Napló utáni kérdőív OSAP száma"
attr(ALAP4[["KERDOIV_KITOLTHETO_EVTOL"]], "label") <- "A kérdőív kitölthető: (évtől)"
attr(ALAP4[["KERDOIV_KITOLTHETO_HOTOL"]], "label") <- "A kérdőív kitölthető: (hónaptól)"
attr(ALAP4[["KERDOIV_KITOLTHETO_NAPTOL"]], "label") <- "A kérdőív kitölthető: (naptól)"
attr(ALAP4[["KERDOIV_KITOLTHETO_EVIG"]], "label") <- "A kérdőív kitölthető: (évig)"
attr(ALAP4[["KERDOIV_KITOLTHETO_HOIG"]], "label") <- "A kérdőív kitölthető: (hónapig)"
attr(ALAP4[["KERDOIV_KITOLTHETO_NAPIG"]], "label") <- "A kérdőív kitölthető: (napig)"
attr(ALAP4[["NAPLO_KITOLTHETO_EVTOL"]], "label") <- "A napló kitölthető: (évtől)"
attr(ALAP4[["NAPLO_KITOLTHETO_HOTOL"]], "label") <- "A napló kitölthető: (hónaptól)"
attr(ALAP4[["NAPLO_KITOLTHETO_NAPTOL"]], "label") <- "A napló kitölthető: (naptól)"
attr(ALAP4[["NAPLO_KITOLTHETO_EVIG"]], "label") <- "A napló kitölthető: (évig)"
attr(ALAP4[["NAPLO_KITOLTHETO_HOIG"]], "label") <- "A napló kitölthető: (hónapig)"
attr(ALAP4[["NAPLO_KITOLTHETO_NAPIG"]], "label") <- "A napló kitölthető: (napig)"


library("RODBC")
channel <- odbcDriverConnect(paste("DRIVER={Oracle in OraClient18Home1};DBQ=EMERALD.KSH.HU;UID=", Sys.getenv("userid"), ";PWD=", Sys.getenv("pwd")), DBMSencoding = "ISO-8859-2")

FOTEV4 <- sqlQuery(channel, "select LAKAZON, FIBC126, FIBC111, FIBC104, FIBC101, FIBC102, FIBC105, FIBC106, FIBC107, FIBC108, FIBC109, FIBC110, FIBC112, FIBC113, FIBC114, FIBC115, FIBC116, FIBC117, FIBC118, FIBC119, FIBC120, FIBC121, FIBC128, ALTEVUUID, MEGHI MEGHI_FOTEV from FI.FI_8075_NAPLOFOTEV_V24_V00_01 where ISZAK = '01' order by LAKAZON, replace(replace(replace(replace(FIBC126, '00:', '24:'), '01:', '25:'), '02:', '26:'), '03:', '27:'), FIBC111", as.is = TRUE)
ALTEV4 <- sqlQuery(channel, "select LAKAZON, ID, ALTEVUUID, FIBC123, FIBC127, FIBC124, FIBC125, MEGHI MEGHI_ALTEV from FI.FI_8075_NAPLOALTEV_V24_V00_01 where ISZAK = '01' order by LAKAZON, id, ALTEVUUID, FIBC127, FIBC124", as.is = TRUE)

maxALTEV4 <- sqlQuery(channel, "select LAKAZON, ALTEVUUID, count(ALTEVUUID) mennyi from FI.FI_8075_NAPLOALTEV_V24_V00_01 where ISZAK = '01' group by LAKAZON, ALTEVUUID order by count(ALTEVUUID) desc offset 0 row fetch first 1 row only", as.is = TRUE)
maxALTEV4 <- as.numeric(maxALTEV4[, "MENNYI"])#5

maxFOTEV4 <- sqlQuery(channel, "select LAKAZON, count(LAKAZON) mennyi from FI.FI_8075_NAPLOFOTEV_V24_V00_01 where ISZAK = '01' group by LAKAZON, UUID order by count(UUID) desc offset 0 row fetch first 1 row only", as.is = TRUE)
maxFOTEV4 <- as.numeric(maxFOTEV4[, "MENNYI"])#64

FOTEV4_ROW <- sqlQuery(channel, "select FIBC126, FIBC111, FIBC104, FIBC101, FIBC102, FIBC105, FIBC106, FIBC107, FIBC108, FIBC109, FIBC110, FIBC112, FIBC113, FIBC114, FIBC115, FIBC116, FIBC117, FIBC118, FIBC119, FIBC120, FIBC121, FIBC128, MEGHI MEGHI_FOTEV from FI.FI_8075_NAPLOFOTEV_V24_V00_01 where ISZAK = '01' and LAKAZON is null order by LAKAZON", as.is = TRUE)
ALTEV4_ROW <- sqlQuery(channel, "select FIBC123, FIBC127, FIBC124, FIBC125 from FI.FI_8075_NAPLOALTEV_V24_V00_01 where ISZAK = '01' and LAKAZON is null order by LAKAZON, id, ALTEVUUID", as.is = TRUE)

odbcClose(channel)
dim(FOTEV4)#65794 sor és 25 oszlop
dim(ALTEV4)#11716 sor és 8 oszlop
dim(FOTEV4_ROW)#23 oszlop
dim(ALTEV4_ROW)#4 oszlop

View(FOTEV4)
View(ALTEV4)


for(i in 1:length(colnames(FOTEV4))){
  
  comment <- subset(COMMENTS, COLUMN_NAME == colnames(FOTEV4)[i], select = c("COMMENTS"))
  
  if(nrow(comment) > 0){
    
    attr(FOTEV4[[colnames(FOTEV4)[i]]], "label") <- as.character(comment)
    
  }
  
}

for(i in 1:length(colnames(ALTEV4))){
  
  comment <- subset(COMMENTS, COLUMN_NAME == colnames(ALTEV4)[i], select = c("COMMENTS"))
  
  if(nrow(comment) > 0){
    
    attr(ALTEV4[[colnames(ALTEV4)[i]]], "label") <- as.character(comment)
    
  }
  
}

for(i in 1:length(colnames(FOTEV4_ROW))){
  
  comment <- subset(COMMENTS, COLUMN_NAME == colnames(FOTEV4_ROW)[i], select = c("COMMENTS"))
  
  if(nrow(comment) > 0){
    
    attr(FOTEV4_ROW[[colnames(FOTEV4_ROW)[i]]], "label") <- as.character(comment)
    
  }
  
}

for(i in 1:length(colnames(ALTEV4_ROW))){
  
  comment <- subset(COMMENTS, COLUMN_NAME == colnames(ALTEV4_ROW)[i], select = c("COMMENTS"))
  
  if(nrow(comment) > 0){
    
    attr(ALTEV4_ROW[[colnames(ALTEV4_ROW)[i]]], "label") <- as.character(comment)
    
  }
  
}

FOTEV4_ROW[nrow(FOTEV4_ROW) + 1, ] <- NA
ALTEV4_ROW[nrow(ALTEV4_ROW) + 1, ] <- NA
#, ALTEV4_ROW, ALTEV4_ROW, ALTEV4_ROW
FOTEV4TABLE <- cbind(FOTEV4_ROW, ALTEV4_ROW, ALTEV4_ROW, ALTEV4_ROW, ALTEV4_ROW, ALTEV4_ROW)
#, ALTEV4_ROW, ALTEV4_ROW, ALTEV4_ROW
FOTEV4TABLE_COLUMN <- cbind(FOTEV4_ROW, ALTEV4_ROW, ALTEV4_ROW, ALTEV4_ROW, ALTEV4_ROW, ALTEV4_ROW)
ALTEV_ATNEV_HONNANTOL4 <- ncol(FOTEV4_ROW) + 1 #+ ncol(ALTEV_ROW)
for(i in ALTEV_ATNEV_HONNANTOL4:length(colnames(FOTEV4TABLE))){
  
  if(i < ALTEV_ATNEV_HONNANTOL4 + ncol(ALTEV4_ROW)){
    
    colnames(FOTEV4TABLE)[i] <- paste0(colnames(FOTEV4TABLE)[i], "_A")
    
  }else if(i < (ALTEV_ATNEV_HONNANTOL4 + ncol(ALTEV4_ROW) * 2)){
    
    colnames(FOTEV4TABLE)[i] <- paste0(colnames(FOTEV4TABLE)[i], "_B")
    
  }else if(i < (ALTEV_ATNEV_HONNANTOL4 + ncol(ALTEV4_ROW) * 3)){
    
    colnames(FOTEV4TABLE)[i] <- paste0(colnames(FOTEV4TABLE)[i], "_C")
    
  }else if(i < (ALTEV_ATNEV_HONNANTOL4 + ncol(ALTEV4_ROW) * 4)){
    
    colnames(FOTEV4TABLE)[i] <- paste0(colnames(FOTEV4TABLE)[i], "_D")
    
  }else if(i < (ALTEV_ATNEV_HONNANTOL4 + ncol(ALTEV4_ROW) * 5)){
    
    colnames(FOTEV4TABLE)[i] <- paste0(colnames(FOTEV4TABLE)[i], "_E")
    
  }else if(i < (ALTEV_ATNEV_HONNANTOL4 + ncol(ALTEV4_ROW) * 6)){
    
    colnames(FOTEV4TABLE)[i] <- paste0(colnames(FOTEV4TABLE)[i], "_F")
    
  }else if(i < (ALTEV_ATNEV_HONNANTOL4 + ncol(ALTEV4_ROW) * 7)){
    
    colnames(FOTEV4TABLE)[i] <- paste0(colnames(FOTEV4TABLE)[i], "_G")
    
  }else {
    
    colnames(FOTEV4TABLE)[i] <- paste0(colnames(FOTEV4TABLE)[i], "_H")
    
  }
  
  
}
colnames(FOTEV4TABLE)

FOTEV4TABLE_COLUMN_for_Rename <- cbind(FOTEV4_ROW, ALTEV4_ROW, ALTEV4_ROW, ALTEV4_ROW, ALTEV4_ROW, ALTEV4_ROW)
for(i in ALTEV_ATNEV_HONNANTOL4:length(colnames(FOTEV4TABLE_COLUMN_for_Rename))){
  
  if(i < ALTEV_ATNEV_HONNANTOL4 + ncol(ALTEV4_ROW)){
    
    colnames(FOTEV4TABLE_COLUMN_for_Rename)[i] <- paste0(colnames(FOTEV4TABLE_COLUMN_for_Rename)[i], "_A")
    
  }else if(i < (ALTEV_ATNEV_HONNANTOL4 + ncol(ALTEV4_ROW) * 2)){
    
    colnames(FOTEV4TABLE_COLUMN_for_Rename)[i] <- paste0(colnames(FOTEV4TABLE_COLUMN_for_Rename)[i], "_B")
    
  }else if(i < (ALTEV_ATNEV_HONNANTOL4 + ncol(ALTEV4_ROW) * 3)){
    
    colnames(FOTEV4TABLE_COLUMN_for_Rename)[i] <- paste0(colnames(FOTEV4TABLE_COLUMN_for_Rename)[i], "_C")
    
  }else if(i < (ALTEV_ATNEV_HONNANTOL4 + ncol(ALTEV4_ROW) * 4)){
    
    colnames(FOTEV4TABLE_COLUMN_for_Rename)[i] <- paste0(colnames(FOTEV4TABLE_COLUMN_for_Rename)[i], "_D")
    
  }else if(i < (ALTEV_ATNEV_HONNANTOL4 + ncol(ALTEV4_ROW) * 5)){
    
    colnames(FOTEV4TABLE_COLUMN_for_Rename)[i] <- paste0(colnames(FOTEV4TABLE_COLUMN_for_Rename)[i], "_E")
    
  }else if(i < (ALTEV_ATNEV_HONNANTOL4 + ncol(ALTEV4_ROW) * 6)){
    
    colnames(FOTEV4TABLE_COLUMN_for_Rename)[i] <- paste0(colnames(FOTEV4TABLE_COLUMN_for_Rename)[i], "_F")
    
  }else if(i < (ALTEV_ATNEV_HONNANTOL4 + ncol(ALTEV4_ROW) * 7)){
    
    colnames(FOTEV4TABLE_COLUMN_for_Rename)[i] <- paste0(colnames(FOTEV4TABLE_COLUMN_for_Rename)[i], "_G")
    
  }else {
    
    colnames(FOTEV4TABLE_COLUMN_for_Rename)[i] <- paste0(colnames(FOTEV4TABLE_COLUMN_for_Rename)[i], "_H")
    
  }
  
  
}
colnames(FOTEV4TABLE_COLUMN_for_Rename)
dim(FOTEV4TABLE_COLUMN)#1 sor és 43 oszlop

for(cur in (1:(maxFOTEV4 - 1))){
  
  for(i in 1:length(colnames(FOTEV4TABLE_COLUMN))){
    
    colnames(FOTEV4TABLE_COLUMN)[i] <- paste0(colnames(FOTEV4TABLE_COLUMN_for_Rename)[i], "_", as.character(cur + 1))
    
  }
  
  FOTEV4TABLE <- cbind(FOTEV4TABLE, FOTEV4TABLE_COLUMN)
  
}
colnames(FOTEV4TABLE)

for(i in (1:ncol(FOTEV4TABLE_COLUMN))){
  
  colnames(FOTEV4TABLE)[i] <- paste0(colnames(FOTEV4TABLE)[i], "_1")
  
}
colnames(FOTEV4TABLE)
View(FOTEV4TABLE)

#FOTEV4TABLE[1:nrow(ALAP4), ] <- NA
for(cur in (1:nrow(ALAP4))){
  
  newFOTEV4 <- subset(FOTEV4, LAKAZON == ALAP4[cur, "LAKAZON"], select = c("FIBC126", "FIBC111", "FIBC104", "FIBC101", "FIBC102", "FIBC105", "FIBC106", "FIBC107", "FIBC108", "FIBC109", "FIBC110", "FIBC112", "FIBC113", "FIBC114", "FIBC115", "FIBC116", "FIBC117", "FIBC118", "FIBC119", "FIBC120", "FIBC121", "FIBC128", "MEGHI_FOTEV"))
  
  if(nrow(newFOTEV4) > 0){
    
    for(cur2 in (1:nrow(newFOTEV4))){
      
      ALTEVUUID_in_FOTEV4 <- subset(FOTEV4, LAKAZON == ALAP4[cur, "LAKAZON"], select = c("ALTEVUUID"))
      
      FOTEV4TABLE[cur, c((1 + (cur2 - 1) * ncol(FOTEV4_ROW) + (maxALTEV4 * ncol(ALTEV4_ROW)) * (cur2 - 1)):(ncol(FOTEV4_ROW) + (cur2 - 1) * ncol(FOTEV4_ROW) + (maxALTEV4 * ncol(ALTEV4_ROW)) * (cur2 - 1)))] <- newFOTEV4[cur2, ]
      
      newALTEV4 <- subset(ALTEV4, LAKAZON == ALAP4[cur, "LAKAZON"] & ALTEVUUID == FOTEV4[FOTEV4$LAKAZON == ALAP4[cur, "LAKAZON"] & FOTEV4$FIBC126 == newFOTEV4[cur2, "FIBC126"], "ALTEVUUID"] , select = c("FIBC123", "FIBC127", "FIBC124", "FIBC125"))#"ID", , "MEGHI_ALTEV"
      
      if(nrow(newALTEV4) > 0){
        
        for(cur3 in (1:nrow(newALTEV4))){
          
          FOTEV4TABLE[cur, c(((ncol(FOTEV4_ROW) + 1) + (cur2 - 1) * ncol(FOTEV4_ROW) + (maxALTEV4 * ncol(ALTEV4_ROW)) * (cur2 - 1) + ncol(ALTEV4_ROW) * (cur3 - 1)):((ncol(FOTEV4_ROW) + ncol(ALTEV4_ROW)) + (cur2 - 1) * ncol(FOTEV4_ROW) + (maxALTEV4 * ncol(ALTEV4_ROW)) * (cur2 - 1) + ncol(ALTEV4_ROW) * (cur3 - 1)))] <- newALTEV4[cur3, ]
          
        }
        
      }
      
    }
    
  }
  
}
dim(FOTEV4TABLE)#3753 sor és 2752 oszlop
#üres oszlopok törlése után 3753 sor és 2168 oszlop
#FOTEV4TABLE[nrow(FOTEV4TABLE) + 1, ] <- NA # ha utolsó háztartásnak nincs naplóadata, akkor kell hozzáadni még egy sort NEM KELLETT 3. negyedévnél!!!



library("RODBC")
channel <- odbcDriverConnect(paste("DRIVER={Oracle in OraClient18Home1};DBQ=EMERALD.KSH.HU;UID=", Sys.getenv("userid"), ";PWD=", Sys.getenv("pwd")), DBMSencoding = "ISO-8859-2")
SPORTTEV_FELNOTT4 <- sqlQuery(channel, "select LAKAZON, FI09, FIBB801, FIBB802, FIBB803, FIBB804 from FI.YS_1711_FI09FELNOTT_V24_V00 where ISZAK = '01' order by LAKAZON, to_number(FI09)", as.is = TRUE)
FELNOTT4 <- sqlQuery(channel, "select LAKAZON, FIBB801, FIBB802, FIBB803, FIBB804 from FI.YS_1711_FI09FELNOTT_V24_V00 where ISZAK = '01' and LAKAZON = null order by LAKAZON, to_number(FI09)", as.is = TRUE)
odbcClose(channel)

dim(SPORTTEV_FELNOTT4)#1571 sor és 6 oszlop
dim(FELNOTT4)#0 sor és 5 oszlop

for(cur in (1:(nrow(ALAP4)))){
  
  FELNOTT4[nrow(FELNOTT4) + 1, ] <- NA
  
}

dim(FELNOTT4)#3753 sor és 5 oszlop
FELNOTT4$LAKAZON <- ALAP4$LAKAZON

View(FELNOTT4)
View(SPORTTEV_FELNOTT4)

for(cur in (1:(nrow(FELNOTT4)))){
  
  HAZTARTAS <- subset(SPORTTEV_FELNOTT4, LAKAZON == FELNOTT4[cur, "LAKAZON"], select = c("FI09", "FIBB801", "FIBB802", "FIBB803", "FIBB804"))
  
  if(nrow(HAZTARTAS) > 0){
    
    for(cur2 in (1:nrow(HAZTARTAS))){
      
      if(is.na(HAZTARTAS[cur2, "FIBB801"]) == FALSE){
        
        if(is.na(FELNOTT4[cur, "FIBB801"]) == FALSE){
          
          FELNOTT4[cur, "FIBB801"] <- paste(FELNOTT4[cur, "FIBB801"], HAZTARTAS[cur2, "FI09"], sep = ";")
          
        }else{
          
          FELNOTT4[cur, "FIBB801"] <- HAZTARTAS[cur2, "FI09"]
          
        }
        
      }
      
      if(is.na(HAZTARTAS[cur2, "FIBB802"]) == FALSE){
        
        if(is.na(FELNOTT4[cur, "FIBB802"]) == FALSE){
          
          FELNOTT4[cur, "FIBB802"] <- paste(FELNOTT4[cur, "FIBB802"], HAZTARTAS[cur2, "FI09"], sep = ";")
          
        }else{
          
          FELNOTT4[cur, "FIBB802"] <- HAZTARTAS[cur2, "FI09"]
          
        }
        
      }
      
      if(is.na(HAZTARTAS[cur2, "FIBB803"]) == FALSE){
        
        if(is.na(FELNOTT4[cur, "FIBB803"]) == FALSE){
          
          FELNOTT4[cur, "FIBB803"] <- paste(FELNOTT4[cur, "FIBB803"], HAZTARTAS[cur2, "FI09"], sep = ";")
          
        }else{
          
          FELNOTT4[cur, "FIBB803"] <- HAZTARTAS[cur2, "FI09"]
          
        }
        
      }
      
      if(is.na(HAZTARTAS[cur2, "FIBB804"]) == FALSE){
        
        if(is.na(FELNOTT4[cur, "FIBB804"]) == FALSE){
          
          FELNOTT4[cur, "FIBB804"] <- paste(FELNOTT4[cur, "FIBB804"], HAZTARTAS[cur2, "FI09"], sep = ";")
          
        }else{
          
          FELNOTT4[cur, "FIBB804"] <- HAZTARTAS[cur2, "FI09"]
          
        }
        
      }
      
    }
    #break
    
  }
  
}

attr(FELNOTT4[["FIBB801"]], "label") <- "FELNŐTT: 1 - sportegyesületben"
attr(FELNOTT4[["FIBB802"]], "label") <- "FELNŐTT: 2 - iskolában, egyetemen"
attr(FELNOTT4[["FIBB803"]], "label") <- "FELNŐTT: 3 - más szervezetben"
attr(FELNOTT4[["FIBB804"]], "label") <- "FELNŐTT: 4 - családdal, barátokkal, ismerősökkel, egyedül"



library("RODBC")
channel <- odbcDriverConnect(paste("DRIVER={Oracle in OraClient18Home1};DBQ=EMERALD.KSH.HU;UID=", Sys.getenv("userid"), ";PWD=", Sys.getenv("pwd")), DBMSencoding = "ISO-8859-2")
SPORTTEV_GYERMEK4 <- sqlQuery(channel, "select LAKAZON, FI09, FIBB805, FIBB806, FIBB807, FIBB808 from FI.YS_1711_FI09GYERMEK_V24_V00 where ISZAK = '01' order by LAKAZON, to_number(FI09)", as.is = TRUE)
GYERMEK4 <- sqlQuery(channel, "select LAKAZON, FIBB805, FIBB806, FIBB807, FIBB808 from FI.YS_1711_FI09GYERMEK_V24_V00 where ISZAK = '01' and LAKAZON = null order by LAKAZON, to_number(FI09)", as.is = TRUE)
odbcClose(channel)

dim(SPORTTEV_GYERMEK4)#195 sor és 6 oszlop
dim(GYERMEK4)#0 sor és 5 oszlop

for(cur in (1:(nrow(ALAP4)))){
  
  GYERMEK4[nrow(GYERMEK4) + 1, ] <- NA
  
}

dim(GYERMEK4)#3753 sor és 5 oszlop
GYERMEK4$LAKAZON <- ALAP4$LAKAZON

View(GYERMEK4)
View(SPORTTEV_GYERMEK4)

for(cur in (1:(nrow(GYERMEK4)))){
  
  HAZTARTAS <- subset(SPORTTEV_GYERMEK4, LAKAZON == GYERMEK4[cur, "LAKAZON"], select = c("FI09", "FIBB805", "FIBB806", "FIBB807", "FIBB808"))
  
  if(nrow(HAZTARTAS) > 0){
    
    for(cur2 in (1:nrow(HAZTARTAS))){
      
      if(is.na(HAZTARTAS[cur2, "FIBB805"]) == FALSE){
        
        if(is.na(GYERMEK4[cur, "FIBB805"]) == FALSE){
          
          GYERMEK4[cur, "FIBB805"] <- paste(GYERMEK4[cur, "FIBB805"], HAZTARTAS[cur2, "FI09"], sep = ";")
          
        }else{
          
          GYERMEK4[cur, "FIBB805"] <- HAZTARTAS[cur2, "FI09"]
          
        }
        
      }
      
      if(is.na(HAZTARTAS[cur2, "FIBB806"]) == FALSE){
        
        if(is.na(GYERMEK4[cur, "FIBB806"]) == FALSE){
          
          GYERMEK4[cur, "FIBB806"] <- paste(GYERMEK4[cur, "FIBB806"], HAZTARTAS[cur2, "FI09"], sep = ";")
          
        }else{
          
          GYERMEK4[cur, "FIBB806"] <- HAZTARTAS[cur2, "FI09"]
          
        }
        
      }
      
      if(is.na(HAZTARTAS[cur2, "FIBB807"]) == FALSE){
        
        if(is.na(GYERMEK4[cur, "FIBB807"]) == FALSE){
          
          GYERMEK4[cur, "FIBB807"] <- paste(FELNOTT4[cur, "FIBB807"], HAZTARTAS[cur2, "FI09"], sep = ";")
          
        }else{
          
          GYERMEK4[cur, "FIBB807"] <- HAZTARTAS[cur2, "FI09"]
          
        }
        
      }
      
      if(is.na(HAZTARTAS[cur2, "FIBB808"]) == FALSE){
        
        if(is.na(GYERMEK4[cur, "FIBB808"]) == FALSE){
          
          GYERMEK4[cur, "FIBB808"] <- paste(GYERMEK4[cur, "FIBB808"], HAZTARTAS[cur2, "FI09"], sep = ";")
          
        }else{
          
          GYERMEK4[cur, "FIBB808"] <- HAZTARTAS[cur2, "FI09"]
          
        }
        
      }
      
    }
    
  }
  
}

attr(GYERMEK4[["FIBB805"]], "label") <- "GYERMEK: 1 - sportegyesületben"
attr(GYERMEK4[["FIBB806"]], "label") <- "GYERMEK: 2 - iskolában, egyetemen"
attr(GYERMEK4[["FIBB807"]], "label") <- "GYERMEK: 3 - más szervezetben"
attr(GYERMEK4[["FIBB808"]], "label") <- "GYERMEK: 4 - családdal, barátokkal, ismerősökkel, egyedül"


#Háztartástagok
library("RODBC")
channel <- odbcDriverConnect(paste("DRIVER={Oracle in OraClient18Home1};DBQ=EMERALD.KSH.HU;UID=", Sys.getenv("userid"), ";PWD=", Sys.getenv("pwd")), DBMSencoding = "ISO-8859-2")
HTTAGOK4 <- sqlQuery(channel, "select LAKAZON, FIBA101, FIBA102, FIBA103, FIBA104, FIBA105, FIBA106 from FI.YS_1711_HTTAG_V24_V00 where ISZAK = '01' order by LAKAZON, to_number(substr(HTID, 14, 15))", as.is = TRUE)
HTTAG4 <- sqlQuery(channel, "select LAKAZON, FIBA101, FIBA102, FIBA103, FIBA104, FIBA105, FIBA106 from FI.YS_1711_HTTAG_V24_V00 where ISZAK = '01' and LAKAZON = null order by LAKAZON, to_number(substr(HTID, 14, 15))", as.is = TRUE)
MAX_HTTAG4 <- sqlQuery(channel, "select max(count(LAKAZON)) maximum from FI.YS_1711_HTTAG_V24_V00 where ISZAK = '01' group by LAKAZON")
odbcClose(channel)

dim(HTTAGOK4)#2938 sor és 7 oszlop
dim(MAX_HTTAG4)#1 sor és 1 oszlop
dim(HTTAG4)#0 sor és 7 oszlop

attr(HTTAG4[["FIBA101"]], "label") <- "Háztartási: Kérjük, sorolja fel az Önnel egy háztartásban élők nevét, születési idejét és háztartásban betöltött szerepét! Akár a háztartástag teljes nevét, akár például csak a vezetékneve első betűjét és a keresztnevét is megadhatja."
attr(HTTAG4[["FIBA102"]], "label") <- "Háztartási: Kérjük, sorolja fel az Önnel egy háztartásban élők nevét, születési idejét és háztartásban betöltött szerepét! Nemük férfi vagy nő"
attr(HTTAG4[["FIBA103"]], "label") <- "Háztartási: Kérjük, sorolja fel az Önnel egy háztartásban élők nevét, születési idejét és háztartásban betöltött szerepét! évszám, ha lehetséges naptárból választva"
attr(HTTAG4[["FIBA104"]], "label") <- "Háztartási: Kérjük, sorolja fel az Önnel egy háztartásban élők nevét, születési idejét és háztartásban betöltött szerepét! hónap, ha lehetséges naptárból választva"
attr(HTTAG4[["FIBA105"]], "label") <- "Háztartási: Kérjük, sorolja fel az Önnel egy háztartásban élők nevét, születési idejét és háztartásban betöltött szerepét! nap, ha lehetséges naptárból választva"
attr(HTTAG4[["FIBA106"]], "label") <- "Háztartási: Kérjük, sorolja fel az Önnel egy háztartásban élők nevét, születési idejét és háztartásban betöltött szerepét! 1-férj; 2-feleség; 3-élettárs; 4-egyedülálló szülő GYERMEK4kel; 5-GYERMEK4; 6-felmenő rokon; 7-egyéb rokon; 8-nem rokon; 9-egyedülálló"


for(cur in (1:(MAX_HTTAG4$MAXIMUM - 1))){
  
  HTTAG4 <- cbind(HTTAG4, HTTAG4[, c("FIBA101", "FIBA102", "FIBA103", "FIBA104", "FIBA105", "FIBA106")])
  
}


for(i in 2:length(colnames(HTTAG4))){
  
  if(i < 8){
    
    colnames(HTTAG4)[i] <- paste0(colnames(HTTAG4)[i], "_0")
    
  }else if(i < 14){
    
    colnames(HTTAG4)[i] <- paste0(colnames(HTTAG4)[i], "_1")
    
  }else if(i < 20){
    
    colnames(HTTAG4)[i] <- paste0(colnames(HTTAG4)[i], "_2")
    
  }else if(i < 26){
    
    colnames(HTTAG4)[i] <- paste0(colnames(HTTAG4)[i], "_3")
    
  }else if(i < 32){
    
    colnames(HTTAG4)[i] <- paste0(colnames(HTTAG4)[i], "_4")
    
  }else if(i < 38){
    
    colnames(HTTAG4)[i] <- paste0(colnames(HTTAG4)[i], "_5")
    
  }else if(i < 44){
    
    colnames(HTTAG4)[i] <- paste0(colnames(HTTAG4)[i], "_6")
    
  }else if(i < 50){
    
    colnames(HTTAG4)[i] <- paste0(colnames(HTTAG4)[i], "_7")
    
  }else if(i < 56){
    
    colnames(HTTAG4)[i] <- paste0(colnames(HTTAG4)[i], "_8")
    
  }else if(i < 62){
    
    colnames(HTTAG4)[i] <- paste0(colnames(HTTAG4)[i], "_9")
    
  }else if(i < 68){
    
    colnames(HTTAG4)[i] <- paste0(colnames(HTTAG4)[i], "_10")
    
  }else if(i < 74){
    
    colnames(HTTAG4)[i] <- paste0(colnames(HTTAG4)[i], "_11")
    
  }else if(i < 80){
    
    colnames(HTTAG4)[i] <- paste0(colnames(HTTAG4)[i], "_12")
    
  }
  
  
}
colnames(HTTAG4)


for(cur in (1:(nrow(ALAP4)))){
  
  HTTAG4[nrow(HTTAG4) + 1, ] <- NA
  
}

dim(HTTAG4)#3753 sor és 61 oszlop
HTTAG4$LAKAZON <- ALAP4$LAKAZON

View(HTTAG4)
View(HTTAGOK4)

for(cur in (1:(nrow(HTTAG4)))){
  
  HAZTARTASTAG <- subset(HTTAGOK4, LAKAZON == HTTAG4[cur, "LAKAZON"], select = c("FIBA101", "FIBA102", "FIBA103", "FIBA104", "FIBA105", "FIBA106"))
  
  if(nrow(HAZTARTASTAG) > 0){
    
    for(cur2 in (1:nrow(HAZTARTASTAG))){
      
      HTTAG4[cur, (2 + ((cur2 - 1) * 6)):(7 + ((cur2 - 1) * 6))] <- HAZTARTASTAG[cur2, ]
      
    }
    
  }
  
}


library("RODBC")
channel <- odbcDriverConnect(paste("DRIVER={Oracle in OraClient18Home1};DBQ=EMERALD.KSH.HU;UID=", Sys.getenv("userid"), ";PWD=", Sys.getenv("pwd")), DBMSencoding = "ISO-8859-2")
TAMOGATASOK4 <- sqlQuery(channel, "select LAKAZON, FI09, FIBA401, FIBA402, FIBA403 from FI.YS_1711_TAMOGATAS_V24_V00 where ISZAK = '01' order by LAKAZON, to_number(FI09)", as.is = TRUE)
TAMOGATAS4 <- sqlQuery(channel, "select LAKAZON, FI09, FIBA401, FIBA402, FIBA403 from FI.YS_1711_TAMOGATAS_V24_V00 where ISZAK = '01' and LAKAZON = null order by LAKAZON, to_number(FI09)", as.is = TRUE)
MAX_TAMOGATAS4 <- sqlQuery(channel, "select max(count(FI09)) maximum from FI.YS_1711_TAMOGATAS_V24_V00 where ISZAK = '01' and LAKAZON != 'L01648278804' group by LAKAZON")
odbcClose(channel)

dim(TAMOGATASOK4)#83007 sor és 5 oszlop
dim(TAMOGATAS4)#0 sor és 5 oszlop
dim(MAX_TAMOGATAS4)#1 sor és 1 oszlop

attr(TAMOGATAS4[["FI09"]], "label") <- "Háztartási: Segítség, támogatás más háztartástól neve"
attr(TAMOGATAS4[["FIBA401"]], "label") <- "Háztartási: Hány alkalommal kapta az elmúlt 4 hét során?"
attr(TAMOGATAS4[["FIBA402"]], "label") <- "Háztartási: Fizetett érte a legutóbbi alkalommal?"
attr(TAMOGATAS4[["FIBA403"]], "label") <- "Háztartási: Kitől kapta ezt segítséget, támogatást, szolgáltatás a legutóbbi alkalommal?"


for(cur in (1:(MAX_TAMOGATAS4$MAXIMUM - 1))){
  
  TAMOGATAS4 <- cbind(TAMOGATAS4, TAMOGATAS4[, c("FI09", "FIBA401", "FIBA402", "FIBA403")])
  
}


for(i in 2:length(colnames(TAMOGATAS4))){
  
  if(i < 6){
    
    colnames(TAMOGATAS4)[i] <- paste0(colnames(TAMOGATAS4)[i], "_1")
    
  }else if(i < 10){
    
    colnames(TAMOGATAS4)[i] <- paste0(colnames(TAMOGATAS4)[i], "_2")
    
  }else if(i < 14){
    
    colnames(TAMOGATAS4)[i] <- paste0(colnames(TAMOGATAS4)[i], "_3")
    
  }else if(i < 18){
    
    colnames(TAMOGATAS4)[i] <- paste0(colnames(TAMOGATAS4)[i], "_4")
    
  }else if(i < 22){
    
    colnames(TAMOGATAS4)[i] <- paste0(colnames(TAMOGATAS4)[i], "_5")
    
  }else if(i < 26){
    
    colnames(TAMOGATAS4)[i] <- paste0(colnames(TAMOGATAS4)[i], "_6")
    
  }else if(i < 30){
    
    colnames(TAMOGATAS4)[i] <- paste0(colnames(TAMOGATAS4)[i], "_7")
    
  }else if(i < 34){
    
    colnames(TAMOGATAS4)[i] <- paste0(colnames(TAMOGATAS4)[i], "_8")
    
  }else if(i < 38){
    
    colnames(TAMOGATAS4)[i] <- paste0(colnames(TAMOGATAS4)[i], "_9")
    
  }
  
}
colnames(TAMOGATAS4)


for(cur in (1:(nrow(ALAP4)))){
  
  TAMOGATAS4[nrow(TAMOGATAS4) + 1, ] <- NA
  
}

dim(TAMOGATAS4)#3753 sor és 73 oszlop
TAMOGATAS4$LAKAZON <- ALAP4$LAKAZON

View(TAMOGATAS4)
View(TAMOGATASOK4)

for(cur in (1:(nrow(TAMOGATAS4)))){
  
  TAMOGATAS4FAJTA <- subset(TAMOGATASOK4, LAKAZON == TAMOGATAS4[cur, "LAKAZON"], select = c("FI09", "FIBA401", "FIBA402", "FIBA403"))
  
  if(nrow(TAMOGATAS4FAJTA) > 0){
    
    for(cur2 in (1:nrow(TAMOGATAS4FAJTA))){
      
      TAMOGATAS4[cur, (2 + ((cur2 - 1) * 4)):(5 + ((cur2 - 1) * 4))] <- TAMOGATAS4FAJTA[cur2, ]
      
    }
    
  }
  
}


attr(TAMOGATAS4[["FI09_1"]], "label") <- "Háztartási: Segítség, támogatás más háztartástól GYERMEK4 gondozása, felügyelete a kora miatt"
attr(TAMOGATAS4[["FI09_2"]], "label") <- "Háztartási: Segítség, támogatás más háztartástól GYERMEK4 gondozása, felügyelete egészségi állapota miatt"
attr(TAMOGATAS4[["FI09_3"]], "label") <- "Háztartási: Segítség, támogatás más háztartástól GYERMEK4 magáncélú oktatása miatt"
attr(TAMOGATAS4[["FI09_4"]], "label") <- "Háztartási: Segítség, támogatás más háztartástól Idős, beteg gondozása miatt"
attr(TAMOGATAS4[["FI09_5"]], "label") <- "Háztartási: Segítség, támogatás más háztartástól Építkezéshez, felújításhoz"
attr(TAMOGATAS4[["FI09_6"]], "label") <- "Háztartási: Segítség, támogatás más háztartástól Javító-szerelő munkához"
attr(TAMOGATAS4[["FI09_7"]], "label") <- "Háztartási: Segítség, támogatás más háztartástól Mezőgazdasági munkához"
attr(TAMOGATAS4[["FI09_8"]], "label") <- "Háztartási: Segítség, támogatás más háztartástól Pénzbeli segítséget"
attr(TAMOGATAS4[["FI09_9"]], "label") <- "Háztartási: Segítség, támogatás más háztartástól Egyéb segítség, támogatás, szolgáltatás (pl. bevásárlás segítése, takarítás, stb.)"


#Változáskövetés
library("RODBC")
channel <- odbcDriverConnect(paste("DRIVER={Oracle in OraClient18Home1};DBQ=EMERALD.KSH.HU;UID=", Sys.getenv("userid"), ";PWD=", Sys.getenv("pwd")), DBMSencoding = "ISO-8859-2")
VALTKOVEK4 <- sqlQuery(channel, "select LAKAZON, FIBC201, FIBC202, FIBC203, FIBC204, FIBC205, FIBC206, FIBC207, FIBC208, FIBC215, FIBC216, FIBC217, FIBC218, FIBC219, FIBC220, FIBC221, FIBC222, FIBC223, FIBC224, FIBC225, FIBC226, FIBC227, FIBC228, FIBC229, FIBC230, FIBC231, FIBC232, MEGHI MEGHI_VALTKOV from FI.FI_1711_VALTKOV_V24_V00 where ISZAK = '01' order by LAKAZON", as.is = TRUE)
VALTKOV4 <- sqlQuery(channel, "select LAKAZON, FIBC201, FIBC202, FIBC203, FIBC204, FIBC205, FIBC206, FIBC207, FIBC208, FIBC215, FIBC216, FIBC217, FIBC218, FIBC219, FIBC220, FIBC221, FIBC222, FIBC223, FIBC224, FIBC225, FIBC226, FIBC227, FIBC228, FIBC229, FIBC230, FIBC231, FIBC232, MEGHI MEGHI_VALTKOV from FI.FI_1711_VALTKOV_V24_V00 where ISZAK = '01' and LAKAZON = null order by LAKAZON", as.is = TRUE)
odbcClose(channel)

dim(VALTKOVEK4)#1464 sor és 28 oszlop
dim(VALTKOV4)#0 sor és 28 oszlop

for(cur in (1:(nrow(ALAP4)))){
  
  VALTKOV4[nrow(VALTKOV4) + 1, ] <- NA
  
}

dim(VALTKOV4)#3753 sor és 28 oszlop
VALTKOV4$LAKAZON <- ALAP4$LAKAZON

View(VALTKOV4)
View(VALTKOVEK4)

for(row in 1:nrow(VALTKOVEK4)){
  
  if(nchar(VALTKOVEK4[row, "FIBC202"]) == 1){
    
    VALTKOVEK4[row, "FIBC202"] <- paste("0", VALTKOVEK4[row, "FIBC202"], sep = "")
    
  }
  
  
  if(nchar(VALTKOVEK4[row, "FIBC203"]) == 1){
    
    VALTKOVEK4[row, "FIBC203"] <- paste("0", VALTKOVEK4[row, "FIBC203"], sep = "")
    
  }
  
}



for(cur in (1:(nrow(VALTKOV4)))){
  
  KOVETETT <- subset(VALTKOVEK4, LAKAZON == VALTKOV4[cur, "LAKAZON"], select = c("FIBC201", "FIBC202", "FIBC203", "FIBC204", "FIBC205", "FIBC206", "FIBC207", "FIBC208", "FIBC215", "FIBC216", "FIBC217", "FIBC218", "FIBC219", "FIBC220", "FIBC221", "FIBC222", "FIBC223", "FIBC224", "FIBC225", "FIBC226", "FIBC227", "FIBC228", "FIBC229", "FIBC230", "FIBC231", "FIBC232", "MEGHI_VALTKOV"))
  
  if(nrow(KOVETETT) > 0){
    
    for(cur2 in (1:nrow(KOVETETT))){
      
      VALTKOV4[cur, 2:ncol(VALTKOV4)] <- KOVETETT[cur2, ]
      
    }
    
  }
  
}


for(i in 1:length(colnames(VALTKOV4))){
  
  comment <- subset(COMMENTS, COLUMN_NAME == colnames(VALTKOV4)[i], select = c("COMMENTS"))
  
  if(nrow(comment) > 0){
    print(colnames(VALTKOV4)[i])
    attr(VALTKOV4[[colnames(VALTKOV4)[i]]], "label") <- as.character(comment)
    
  }
  
}


#Változáskövetés HTTAG
library("RODBC")
channel <- odbcDriverConnect(paste("DRIVER={Oracle in OraClient18Home1};DBQ=EMERALD.KSH.HU;UID=", Sys.getenv("userid"), ";PWD=", Sys.getenv("pwd")), DBMSencoding = "ISO-8859-2")
VALTKOVHTTAGOK4 <- sqlQuery(channel, "select LAKAZON, HTID, FIBC301, FIBC302, FIBC303, FIBC304, FIBC305, FIBC306 from FI.YS_1711_VALTKOVHTTAG_V24_V00 where ISZAK = '01' order by LAKAZON, HTID", as.is = TRUE)
VALTKOVHTTAG4 <- sqlQuery(channel, "select LAKAZON, HTID, FIBC301, FIBC302, FIBC303, FIBC304, FIBC305, FIBC306  from FI.YS_1711_VALTKOVHTTAG_V24_V00 where ISZAK = '01' and LAKAZON = null order by LAKAZON, HTID", as.is = TRUE)
MAX_VALTKOVHTTAG4 <- sqlQuery(channel, "select max(HTID) maximum from FI.YS_1711_VALTKOVHTTAG_V24_V00 where ISZAK = '01'")
odbcClose(channel)

dim(VALTKOVHTTAGOK4)#2377 sor és 8 oszlop
dim(VALTKOVHTTAG4)#0 sor és 8 oszlop


for(i in 1:length(colnames(VALTKOVHTTAG4))){
  
  comment <- subset(COMMENTS, COLUMN_NAME == colnames(VALTKOVHTTAG4)[i], select = c("COMMENTS"))
  
  if(nrow(comment) > 0){
    print(colnames(VALTKOVHTTAG4)[i])
    attr(VALTKOVHTTAG4[[colnames(VALTKOVHTTAG4)[i]]], "label") <- as.character(comment)
    
  }
  
}


for(cur in (1:(MAX_VALTKOVHTTAG4$MAXIMUM))){
  
  VALTKOVHTTAG4 <- cbind(VALTKOVHTTAG4, VALTKOVHTTAG4[, c("HTID", "FIBC301", "FIBC302", "FIBC303", "FIBC304", "FIBC305", "FIBC306")])
  
}


for(i in 2:length(colnames(VALTKOVHTTAG4))){
  
  if(i < 9){
    
    colnames(VALTKOVHTTAG4)[i] <- paste0(colnames(VALTKOVHTTAG4)[i], "_0")
    
  }else if(i < 16){
    
    colnames(VALTKOVHTTAG4)[i] <- paste0(colnames(VALTKOVHTTAG4)[i], "_1")
    
  }else if(i < 23){
    
    colnames(VALTKOVHTTAG4)[i] <- paste0(colnames(VALTKOVHTTAG4)[i], "_2")
    
  }else if(i < 30){
    
    colnames(VALTKOVHTTAG4)[i] <- paste0(colnames(VALTKOVHTTAG4)[i], "_3")
    
  }else if(i < 37){
    
    colnames(VALTKOVHTTAG4)[i] <- paste0(colnames(VALTKOVHTTAG4)[i], "_4")
    
  }else if(i < 44){
    
    colnames(VALTKOVHTTAG4)[i] <- paste0(colnames(VALTKOVHTTAG4)[i], "_5")
    
  }else if(i < 51){
    
    colnames(VALTKOVHTTAG4)[i] <- paste0(colnames(VALTKOVHTTAG4)[i], "_6")
    
  }else if(i < 58){
    
    colnames(VALTKOVHTTAG4)[i] <- paste0(colnames(VALTKOVHTTAG4)[i], "_7")
    
  }else if(i < 65){
    
    colnames(VALTKOVHTTAG4)[i] <- paste0(colnames(VALTKOVHTTAG4)[i], "_8")
    
  }else if(i < 72){
    
    colnames(VALTKOVHTTAG4)[i] <- paste0(colnames(VALTKOVHTTAG4)[i], "_9")
    
  }
  
  
}
colnames(VALTKOVHTTAG4)

for(cur in (1:(nrow(ALAP4)))){
  
  VALTKOVHTTAG4[nrow(VALTKOVHTTAG4) + 1, ] <- NA
  
}

dim(VALTKOVHTTAG4)#3753 sor és 71 oszlop
VALTKOVHTTAG4$LAKAZON <- ALAP4$LAKAZON

View(VALTKOVHTTAG4)
View(VALTKOVHTTAGOK4)


for(cur in (1:(nrow(VALTKOVHTTAG4)))){
  
  KOVETETT_HTTAG <- subset(VALTKOVHTTAGOK4, LAKAZON == VALTKOVHTTAG4[cur, "LAKAZON"], select = c("HTID", "FIBC301", "FIBC302", "FIBC303", "FIBC304", "FIBC305", "FIBC306"))
  
  if(nrow(KOVETETT_HTTAG) > 0){
    
    for(cur2 in (1:nrow(KOVETETT_HTTAG))){
      
      VALTKOVHTTAG4[cur, (2 + ((cur2 - 1) * 7)):(8 + ((cur2 - 1) * 7))] <- KOVETETT_HTTAG[cur2, ]
      
    }
    
  }
  
}



result4 <- cbind(ALAP4, FOTEV4TABLE, FELNOTT4[, 2:ncol(FELNOTT4)], GYERMEK4[, 2:ncol(GYERMEK4)], HTTAG4[, 2:ncol(HTTAG4)], TAMOGATAS4[, 2:ncol(TAMOGATAS4)], VALTKOV4[, 2:ncol(VALTKOV4)], VALTKOVHTTAG4[, 2:ncol(VALTKOVHTTAG4)])
dim(result4)#3753 sor és 2826 oszlop változáskövetéssel

View(result4)

library(openxlsx)
write.xlsx(result4, 'Regiszt_Szemelyi_GYERMEK_Haztartasi_Naplo_20250416_4negyedev.xlsx', sheetName = 'Regiszt_Szem_Gyer_Hazt_Naplo', append = FALSE, rowNames = FALSE, overwrite = TRUE)


library(haven)
write_sav(result4, "Regiszt_Szemelyi_GYERMEK_Haztartasi_Naplo_20250416_4negyedev.sav", compress = FALSE)
#IDOMERLEG_2024 <- read_sav("Regiszt_Szemelyi_GYERMEK4_Haztartasi_Naplo_20240523.sav")
#View(IDOMERLEG_2024)