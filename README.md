# Transcriptonomics-
Reuma casus Transcriptonomics

## Inhoud
-`Bronnen/`- gebruikte bronnen. 
-`Data/`- gebruikte data voor de analyses. 
-`Scripts/`- scripts voor verschillende analyses 
-`Resultaten/`- de visualisaties van significante resultaten. 
-`README.md/`- het document waarin de tekst staat gegenereerd. 
-`data_stewardship/`- 

## Inleiding



## Methode
Voor het onderzoek zijn 4 samples van personen zonder RA en 4 personen met RA verkregen via synoviumbiopt. De personen met RA zijn positief getest op ACPA, personen zonder RA negatief. ACPA, meet auto-antistoffen tegen CCP (cyclische gecitrullineerde peptiden) eiwit. Met behulp van R studio worden, vanuit ruwe data, meerdere analyses uitgevoerd voor de vergelijking van personen met en zonder RA, ook wordt er bepaalt welke pathways significant zijn met behulp van de GO- en de KEGG-analyse. 

Mappen met Rsubread package in R, count matrix maken, verschillen in genexpressie bepalen met DEseq2 package in R, Volcano plot visualiseren in R, GO-analyse uitvoeren en bepalen significantste GO-termen in R en KEGG-analyse uitvoeren in R, Github pagina maken en indelen, rapporteren over resultaten en conclusie. (dit komt in flowschema)

## Resultaten
De [Gene Ontology (GO)- analyse](Resultaten/GO-analyseplot.png) liet zien dat de differentieel geëxpresseerde genen voornamelijk betrokken waren bij imuungerelateerde processen. De meest significante GO-termen waren onder andere immune system process, immune response, lymphocyte mediated immunity en adaptive immune respons. Deze resultaten lieten zien dat veranderingen in de expressie van genen tussen reumapatienten en gezonde controles vooral te maken hadden met activatie van het immuunsysteem. 

DE KEGG-analyse van de cytokine-cytokine receptor interactie pahtway [(hsa04060)](Resultaten/hsa04060.pathview.png) liet zien dat er meerdere types cytokinen zowel sterk verlaagd als verhoogd tot expressie kwmamen, met name vele type chemokines waaronder CXCL1, CXCL5, CXCL6, CXCL8 en CXCL13 waren sterk verhoogd tot expressie gekomen. Daarnaast werden verhoogde expressieniveaus waargenomen voor verschillende cytokinen, waaronder IL6, IL1A en IL1B. 

## Conclusie

De GO-analyse liet zien dat de genen waarvan de expressie het meest verschillend was tussen reumapatiënten en gezonde controles voornamelijk betrokken zijn bij immuun- en ontstekingsgerelateerde processen. Vooral de GO-termen immune system process, immune response en adaptive immune response waren sterk significant. De KEGG-analyse bevestigde deze bevindingen en liet zien dat meerdere cytokinen en chemokinen verhoogd tot expressie kwamen. Met name de chemokinen CXCL1, CXCL2, CXCL5, CXCL6, CXCL8, CXCL9 en CXCL13 waren sterk opgereguleerd.Deze moleculen spelen een belangrijke rol bij het aantrekken van immuuncellen en het in stand houden van chronische ontsteking. Ook waren IL6, IL1A en IL1B sterk verhoogd in expressie. [IL6](Assets/10.1177_1759720X10378372-fig1.jpg) is een van de belangrijkste cytokines in RA (Srirangan & Choy, 2010), (Favalli, 2020) en bevorderd het onder andere de ontsteking van het synovium, activatie van B-cellen en T-cellen en botafbraak via osteoclasten en gewrichtsschade. IL1A en IL1B stimuleren ontsteking, bevorderen kraakbeen en botafbraak en dragen bij aan gewrichtsschade. De resultaten wijzen erop dat veranderingen in immuun- en cytokinesignalering een grote rol spelen bij het ontstaan en de instandhouding van reumatoïde artritis.

## Data Stewardship

Hier leg je uit hoe je je data hebt beheerd.
