# Transcriptonomics-
Reuma casus Transcriptonomics

## Inhoud
- `Assests`- Afbeeldingen ter ondersteuning van de resultaten en conclusie
  uit wetenschappelijke bronnen. 
- `Bronnen`- gebruikte bronnen. 
- `Data`- gebruikte data voor de analyses. 
- `Scripts`- scripts voor verschillende analyses 
- `Resultaten`- de visualisaties van significante resultaten. 
- `README.md`- het document waarin de tekst staat gegenereerd. 
- `data_stewardship`- 

## Inleiding
Reumatische arthritis (RA) is een autoimmuun ziekte waarvan het immuunsysteem, het synovium of het slijmvlies van het gewrichtskapsel in het hele lichaam aanvalt. Het veroorzaakt ontsteking van de gewrichten en kan in ernstige gevallen leiden tot blijvende gewrichtsschade en invaliditeit. Daarnaast kan RA ook andere organen aantasten. 

RA komt wereldwijd voor bij ongeveer 1 op de 200 volwassenen en treft vrouwen 2 tot 3 keer vaker dan mannen. De ziekte kan op elke leeftijd ontstaan, maar komt het vaaktst voor tussen de 50 en 59 jaar (Smith & Berman, 2022).

Door een verlies van immuuntolerantie ontstaan auto-antistoffen, zoals ACPA en reumafactor (RF), die een ontstekingsreactie op gang brengen (Mauri & Ehrenstein, 2007). Hierbij worden T-cellen, B-cellen en macrofagen geactiveerd(Tran et al., 2005), die ontstekingsstoffen (cytokinen) zoals TNF-α, IL-6 en IL-1 produceren (McInnes & Schett, 2007). Deze chronische ontsteking van het synovium (de gewrichtsbekleding) leidt uiteindelijk tot beschadiging van kraakbeen en bot, wat pijn, stijfheid en functieverlies van de gewrichten veroorzaakt (Amaya-Amaya et al., 2013). 

Het doel is om in kaart te brengen welke biologische processen een grote rol spelen in RA in vergelijking tot gezonde controles. Enkele deelvragen hierbij zijn:
Wat zijn de belangrijkste genen in de pathways?
Wat zijn de functies van genen?
Welke rol speelt het belangrijkste gen van de pathway in RA?

Het doel van dit onderzoek is om met behulp van genexpressieanalyse, GO-analyse en KEGG-pathwayanalyse inzicht te krijgen in welke biologische processen en signaalroutes een grote rol spelen bij reumatoïde artritis (RA) in vergelijking met gezonde controles.
Welke genen komen significant verschillend tot expressie tussen reumapatiënten en gezonde controles?
Welke biologische processen en immuunfuncties zijn het meest verrijkt?
Welke KEGG-pathway is betrokken bij de gevonden verschillen in genexpressie?
Welke rol spelen de meest opvallende genen binnen dit pathway bij reumatoïde artritis?

## Methode
Voor het onderzoek zijn 4 samples van personen zonder RA en 4 personen met RA verkregen via synoviumbiopt. De personen met RA zijn positief getest op ACPA, personen zonder RA negatief. ACPA, meet auto-antistoffen tegen CCP (cyclische gecitrullineerde peptiden) eiwit. Met behulp van R studio worden, vanuit ruwe data, meerdere analyses uitgevoerd voor de vergelijking van personen met en zonder RA, ook wordt er bepaalt welke pathways significant zijn met behulp van de GO- en de KEGG-analyse. 

Mappen met Rsubread package in R, count matrix maken, verschillen in genexpressie bepalen met DEseq2 package in R, Volcano plot visualiseren in R, GO-analyse uitvoeren en bepalen significantste GO-termen in R en KEGG-analyse uitvoeren in R, Github pagina maken en indelen, rapporteren over resultaten en conclusie. (dit komt in flowschema)


## Resultaten
De [vulcanoplot](Resultaten/VulcanoplotRA.png) liet zien dat er veel genen waren waarvan de expressie het meest verschillend was tussen reumapatiënten en gezonde controles (rode punten). Zowel aan de linger als rechterkant bevinden zich significante genen, wat betekent dat sommige genen verhoogd en andere verlaagd tot expressie komen bij RA-patienten.

De [Gene Ontology (GO)- analyse](Resultaten/GO-analyseplot.png) liet zien dat de differentieel geëxpresseerde genen voornamelijk betrokken waren bij imuungerelateerde processen. De meest significante GO-termen waren onder andere immune system process, immune response, lymphocyte mediated immunity en adaptive immune respons. Deze resultaten lieten zien dat veranderingen in de expressie van genen tussen reumapatienten en gezonde controles vooral te maken hadden met activatie van het immuunsysteem. 

DE KEGG-analyse van de cytokine-cytokine receptor interactie pahtway [(hsa04060)](Resultaten/hsa04060.pathview.2png.png) liet zien dat er meerdere types cytokinen zowel sterk verlaagd als verhoogd tot expressie kwmamen, met name vele type chemokines waaronder CXCL1, CXCL5, CXCL6, CXCL8 en CXCL13 waren sterk verhoogd tot expressie gekomen. Daarnaast werden verhoogde expressieniveaus waargenomen voor verschillende cytokinen, waaronder IL6, IL1A en IL1B. Bij slechte weergave is hier de [pathway](Resultaten/hsa04060.pathview.png) beter zichtbaar zonder bijschrift. De functies van de cytokines in RA staan beschreven in deze tabel. 

## Conclusie
Het doel van het onderzoek was om met behulp van genexpressieanalyse, GO-analyse en KEGG-pathwayanalyse inzicht te krijgen in welke biologische processen en signaalroutes een grote rol spelen bij reumatoïde artritis (RA) in vergelijking met gezonde controles.
De GO-analyse liet zien dat de genen waarvan de expressie het meest verschillend was tussen reumapatiënten en gezonde controles voornamelijk betrokken zijn bij immuun- en ontstekingsgerelateerde processen. Vooral de GO-termen immune system process, immune response en adaptive immune response waren sterk significant. De KEGG-analyse bevestigde deze bevindingen en liet zien dat meerdere cytokinen en chemokinen verhoogd tot expressie kwamen. Met name de chemokinen CXCL1, CXCL2, CXCL5, CXCL6, CXCL8, CXCL9 en CXCL13 waren sterk opgereguleerd.Deze moleculen spelen een belangrijke rol bij het aantrekken van immuuncellen en het in stand houden van chronische ontsteking.  [IL6](Assets/10.1177_1759720X10378372-fig1.jpg) 



## Data Stewardship

Hier leg je uit hoe je je data hebt beheerd.
