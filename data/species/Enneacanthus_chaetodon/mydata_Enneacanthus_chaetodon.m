  function [data, auxData, metaData, txtData, weights] = mydata_Enneacanthus_chaetodon
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Centrarchidae';
metaData.species    = 'Enneacanthus_chaetodon'; 
metaData.species_en = 'Blackbanded sunfish'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl','0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 17]; 

%% set data
% zero-variate data
data.am = 5*365;        units.am = 'd';  label.am = 'time since birth at death'; bibkey.am = 'Schw1961';
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp = 3.1;     units.Lp = 'cm';     label.Lp = 'total length at puberty'; bibkey.Lp = 'guess';
  comment.Lp = 'based om same relative length, compared to Lepomis auritus: 7.5*10/24';
data.Li = 10;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.68e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';   
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3, Schw1961 gives 0.3 mm, but these were probably not yet ripe';
data.Wwp = 0.4;  units.Wwp = 'g'; label.Wwp = 'wet weight at piberty'; bibkey.Wwp = {'fishbase','guess'}; 
  comment.Wwp = 'based on 0.01230*Lp^3.06, see F1';
data.Wwi = 14.1;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.01230*Li^3.06, see F1';

data.Ri = 666/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'guess';   
  temp.Ri = C2K(21); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on same relative fecundity, compared to Lepomis auritus: 9206*(10/24)^3';

% uni-variate data
% time - length
data.tL = [ ... % year class (yr), std length (cm)
    1  1.04
    2  2.72
    3  4.51
    4  5.37];
data.tL(:,1) = 365 * (-0.4 + data.tL(:,1)); % convert yr to d
data.tL(:,2) = data.tL(:,2)/ 0.78; % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(21);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Schw1961';

% length - weight
data.LWw = [ ... % std length (cm), wet weight (g)
1.6430	0.1350
1.8416	0.2712
1.9028	0.1965
1.9160	0.3083
1.9651	0.2709
2.0389	0.2458
2.0763	0.2830
2.0768	0.3575
2.0898	0.4445
2.1509	0.3574
2.1638	0.4319
2.2250	0.3572
2.4239	0.5430
2.6731	0.8281
2.7345	0.7907
2.9469	1.1131
3.3843	1.8077
3.5115	2.2919
3.8401	3.2724
3.8875	3.0239
3.9261	3.2225
3.9601	2.8249
3.9715	2.7007
3.9731	2.9118
3.9738	2.9988
3.9869	3.0981
3.9881	3.2596
4.0123	3.1975
4.0224	2.8993
4.0391	3.4707
4.0471	2.8992
4.0613	3.1476
4.0851	3.0234
4.0875	3.3463
4.1114	3.2345
4.1528	3.8058
4.1755	3.5449
4.2133	3.6442
4.2365	3.4453
4.3151	4.0414
4.3874	3.8052
4.3885	3.9543
4.4386	4.0411
4.4403	4.2647
4.4415	4.4138
4.4692	4.8112
4.4714	5.0969
4.5142	4.2397
4.5374	4.0409
4.5685	4.8731
4.5726	5.4072
4.6969	5.5187
4.6982	5.6802
4.7347	5.6180
4.7481	5.7546
4.7746	5.9906
4.7917	5.0092
4.8206	5.5433
4.8228	5.8290
4.8584	5.6550
4.8629	6.2264
4.8642	6.4003
4.8737	6.0276
4.8852	5.9282
4.9848	6.0273
5.0000	6.4000
5.0011	6.5366
5.0165	6.9341
5.0491	6.3626
5.0747	6.4867
5.1030	6.9463
5.1137	6.7351
5.1443	7.5052
5.1872	6.6604
5.1910	7.1573
5.2079	6.1386
5.2298	7.3808
5.2489	6.6602];
data.LWw(:,1) = data.LWw(:,1)/0.78; % convert SL to TL
units.LWw = {'cm', 'g'}; label.LWw = {'total length','wet weight'};  
bibkey.LWw = 'Schw1961';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Wwp = 0 * weights.Wwp;
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
               
%% Discussion
D1 = 'mean temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01230*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.78 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6FC9J'; % Cat of Life
metaData.links.id_ITIS = '168108'; % ITIS
metaData.links.id_EoL = '211915'; % Ency of Life
metaData.links.id_Wiki = 'Enneacanthus_chaetodon'; % Wikipedia
metaData.links.id_ADW = 'Enneacanthus_chaetodon'; % ADW
metaData.links.id_Taxo = '173738'; % Taxonomicon
metaData.links.id_WoRMS = '1419252'; % WoRMS
metaData.links.id_fishbase = 'Enneacanthus-chaetodon'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Enneacanthus_chaetodon}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Enneacanthus-chaetodon.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Schw1961'; type = 'Article'; bib = [ ...  
'author = {Frank J. Schwartz}, ' ...
'year = {1961}, ' ...
'title  = {Food, Age, Growth, and Morphology of the Blackbanded Sunfish, \emph{Enneacanthus c. chaetodon}, in {S}mithville {P}ond, {M}aryland}, ' ...
'journal = {Chesapeake Science}, ' ...
'volume = {2(1/2)}, ' ...
'pages = {82-88}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

