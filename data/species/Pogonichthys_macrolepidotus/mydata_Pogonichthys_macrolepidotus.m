function [data, auxData, metaData, txtData, weights] = mydata_Pogonichthys_macrolepidotus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Pogonichthys_macrolepidotus'; 
metaData.species_en = 'Sacramento splittail'; 

metaData.ecoCode.climate = {'Dsa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl','0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 18];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 18]; 

%% set data
% zero-variate data

data.tp = 1.75 * 365;   units.tp = 'd';  label.tp = 'time since birth at puberty';  bibkey.tp = 'MoylBaxt2004';   
  temp.tp = C2K(16); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'fishbase';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 17/0.74;    units.Lp = 'cm'; label.Lp = 'total length at puberty';    bibkey.Lp = 'MoylBaxt2004'; 
  comment.Lp = 'based on tp and tL data';
data.Li = 44;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.2e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'MoylBaxt2004';
  comment.Wwb = 'based on egg diameter of 1.0-1.6 mm: pi/6*0.13^3';
data.Wwp = 130;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'fishbase','MoylBaxt2004'};
  comment.Wwi = 'based on 0.00891*Lp^3.06, see F1';
data.Wwi = 952;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00891*Li^3.06, see F1';

data.Ri = 266000/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate';  bibkey.Ri = 'MoylBaxt2004';   
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% univariate data
 
% time-length
data.tL = [ ... % time since mid may, standard length (cm)
-0.931	3.263
0.000	3.564
0.000	3.916
27.934	5.466
29.796	4.561
29.796	4.963
59.592	5.960
59.592	6.261
59.592	6.814
89.388	7.861
90.319	6.755
119.184	7.350
120.115	8.657
152.704	7.693
154.566	9.150
181.569	7.986
181.569	9.092
183.431	10.247
212.296	9.234
212.296	9.536
215.089	10.188
242.092	9.628
242.092	10.030
244.885	8.321
270.957	9.469
271.888	10.424
272.819	9.921
302.615	11.420
303.546	10.465
336.135	11.512
336.135	11.763
337.066	11.059
364.069	12.258
364.069	13.062
365.000	11.453
393.865	12.601
394.796	13.556
396.658	14.460
425.523	13.145
425.523	14.854
425.523	15.055
454.388	13.439
455.319	16.052
456.250	15.549
486.977	14.787
486.977	15.741
486.977	16.445
516.773	17.341
546.569	16.680
579.158	16.570
605.230	17.267
637.819	16.906];
data.tL(:,1) = 80 + data.tL(:,1); % set origin at birth
data.tL(:,2) = data.tL(:,2)/0.74; % conver SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since hatch', 'total length'};  
temp.tL = C2K(16);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MoylBaxt2004'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperature in tL data is assumed to vary as T(t)=11+9*cos(t*2*pi/365) in C';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00891*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL=0.74*TL';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '4KVBY'; % Cat of Life
metaData.links.id_ITIS = '163603'; % ITIS
metaData.links.id_EoL = '46581672'; % Ency of Life
metaData.links.id_Wiki = 'Pogonichthys_macrolepidotus'; % Wikipedia
metaData.links.id_ADW = 'Pogonichthys_macrolepidotus'; % ADW
metaData.links.id_Taxo = '184256'; % Taxonomicon
metaData.links.id_WoRMS = '282310'; % WoRMS
metaData.links.id_fishbase = 'Pogonichthys-macrolepidotus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pogonichthys_macrolepidotus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Pogonichthys-macrolepidotus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'MoylBaxt2004'; type = 'article'; bib = [ ... 
'doi = {10.15447/sfews.2004v2iss2art3}, ' ...
'author = {Peter B. Moyle and Randall D. Baxter and Ted Sommer and Ted C. Foin and and Scott A. Matern}, ' ...
'year = {2004}, ' ...
'title  = {Biology and Population Dynamics of {S}acramento Splittail (\emph{Pogonichthys macrolepidotus}) in the {S}an {F}rancisco {E}stuary: {A} Review}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'pages = {231-241}, ' ...
'volume = {2}, ' ...
'number = {2}'];
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
bibkey = 'Garc2014'; type = 'techreport'; bib = [ ... 
'author = {Adan Martinez Garcia}, ' ...
'year = {2014}, ' ...
'title  = {Invasive Species of the {P}acific {N}orthwest: Northern Pikeminnow, \emph{Ptychocheilus oregonensis}}, ' ...
'series = {FISH 423: Julian Olden}, ' ...
'institution = {U.S. Fish and Wildlife Service}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

