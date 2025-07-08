function [data, auxData, metaData, txtData, weights] = mydata_Aldrichetta_forsteri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Mugiliformes'; 
metaData.family     = 'Mugilidae';
metaData.species    = 'Aldrichetta_forsteri'; 
metaData.species_en = 'Yellow-eye mullet'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIS','MPSW'};
metaData.ecoCode.habitat = {'jiFm', '0iMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_i'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 14];

%% set data
% zero-variate data

data.am = 7*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 11;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'ChubPott1981'; 
  comment.Lp = 'based on tp at 1 yr and tL data';
data.Li  = 50;     units.Li  = 'cm';  label.Li  = 'ultimate total length for female';    bibkey.Li  = 'fishbase';

data.Wwb = 3.8e-4;   units.Wwb = 'g';   label.Wwb = 'ultimate wet weight';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.9 mm: pi/6*0.09^3';
data.Wwi = 950;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';      bibkey.Wwi = 'fishbase';
  
data.Ri  = 6.3e5/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate '; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time - length
data.tL_1977 = [ ... % yr class (d), total length (cm)
115.179	3.651
152.915	3.849
180.265	5.181
207.503	5.773
242.312	6.563
269.431	6.365
301.358	8.043
339.273	9.424
368.160	10.954
397.123	12.977
427.318	13.174
459.051	13.569
489.313	14.211
516.759	16.184
552.097	20.477
613.038	24.523
638.723	24.819
705.138	25.164
794.535	27.878
827.911	29.161];
units.tL_1977   = {'d', 'cm'};  label.tL_1977 = {'time since birth', 'total length', '1977'};  bibkey.tL_1977 = 'ChubPott1981';
temp.tL_1977    = C2K(28);  units.temp.tL_1977 = 'K'; label.temp.tL_1977 = 'temperature';
comment.tL_1977 = 'Data for cohort 1977, born in early march';
%
data.tL_1978 = [ ... % yr class (d), total length (cm)
146.156	2.885
177.854	3.917
215.405	3.912
242.686	5.536
271.321	6.174
301.502	7.107
334.754	8.484
362.050	10.208
395.458	12.621
422.887	15.232
458.958	15.375
520.460	14.824
765.745	27.817];
units.tL_1978   = {'d', 'cm'};  label.tL_1978 = {'time since birth', 'total length', '1978'};  bibkey.tL_1978 = 'ChubPott1981';
temp.tL_1978    = C2K(27);  units.temp.tL_1978 = 'K'; label.temp.tL_1978 = 'temperature';
comment.tL_1978 = 'Data for cohort 1978, born in early march';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_1977 = 2 * weights.tL_1977;
weights.tL_1978 = 2 * weights.tL_1978;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_1977','tL_1978'}; subtitle1 = {'Data for cohorts 1977, 1978'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = 'BLF8'; % Cat of Life
metaData.links.id_ITIS = '170374'; % ITIS
metaData.links.id_EoL = '46571559'; % Ency of Life
metaData.links.id_Wiki = 'Aldrichetta_forsteri'; % Wikipedia
metaData.links.id_ADW = 'Aldrichetta_forsteri'; % ADW
metaData.links.id_Taxo = '46303'; % Taxonomicon
metaData.links.id_WoRMS = '126983'; % WoRMS
metaData.links.id_fishbase = 'Aldrichetta-forsteri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aldrichetta_forsteri}}';
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
bibkey = 'ChubPott1981'; type = 'Article'; bib = [ ... 
'doi = {10.1071/MF9810605}, ' ...
'author = {Chubb, C.F. and Potter, I.C.and Grant, C.J. and Lenanton, R.C.J. and Wallace, J.}, ' ... 
'year = {1981}, ' ...
'title = {Age, stucture, growth rates and movements of sea mullet, \emph{Mugil cephalus} {L}., and Yellow-eye Mullet, \emph{Aldrichetta forsteri} ({V}alenciennes), in the {S}wan-{A}von river system, {W}estern {A}ustralia}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {32(4)}, ' ...
'pages = {605–628}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Aldrichetta-forsteri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

