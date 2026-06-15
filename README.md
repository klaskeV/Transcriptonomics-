# Transcriptonomics-
Reuma casus Transcriptonomics

## Inhoud
-`Bronnen`- gebruikte bronnen. 
-`Data`- gebruikte data voor de analyses. 
-`Scripts`- scripts voor verschillende analyses 
-`Resultaten`- de visualisaties van significante resultaten. 
-`README.md`- het document waarin de tekst staat gegenereerd. 
-`data_stewardship`- 

## Inleiding



## Methode
Voor het onderzoek zijn 4 samples van personen zonder RA en 4 personen met RA verkregen via synoviumbiopt. De personen met RA zijn positief getest op ACPA, personen zonder RA negatief. ACPA, meet auto-antistoffen tegen CCP (cyclische gecitrullineerde peptiden) eiwit. Met behulp van R studio worden, vanuit ruwe data, meerdere analyses uitgevoerd voor de vergelijking van personen met en zonder RA, ook wordt er bepaalt welke pathways significant zijn met behulp van de GO- en de KEGG-analyse. 

Mappen met Rsubread package in R, count matrix maken, verschillen in genexpressie bepalen met DEseq2 package in R, Volcano plot visualiseren in R, GO-analyse uitvoeren en bepalen significantste GO-termen in R en KEGG-analyse uitvoeren in R, Github pagina maken en indelen, rapporteren over resultaten en conclusie.  

## Resultaten
De [Gene Ontology (GO)- analyse](Resultaten/GO-analyseplot.png) liet zien dat de differentieel geëxpresseerde genen voornamelijk betrokken waren bij imuungerelateerde processen. De meest significante GO-termen waren onder andere immune system process, immune response, lymphocyte mediated immunity en adaptive immune respons. Deze resultaten lieten zien dat veranderingen in de expressie van genen tussen reumapatienten en gezonde controles vooral te maken hadden met activatie van het immuunsysteem. 

DE KEGG-analyse van de cytokine-cytokine receptor interactie pahtway [(hsa04060)](Resultaten/hsa04060.pathview.png) liet zien dat er meerdere chemokines waaronder CXCL1, CXCL5, CXCL6, CXCL8 en CXCL13, sterk verhoogd tot expressie kwamen. Daarnaast werden verhoogde expressieniveaus waargenomen voor verschillende cytokinen, waaronder IL6 en IL1B. 

## Conclusie

Deze moleculen spelen een belangrijke rol bij de recrutering van immuuncellen naar ontstoken gewrichten en dragen bij aan de instandhouding van ontstekingsprocessen.


## Data Stewardship

Hier leg je uit hoe je je data hebt beheerd.
