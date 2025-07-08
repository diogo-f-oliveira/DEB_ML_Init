function [data, auxData, metaData, txtData, weights] = mydata_Doryteuthis_pealeii

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Myopsida'; 
metaData.family     = 'Loliginidae';
metaData.species    = 'Doryteuthis_pealeii'; 
metaData.species_en = 'Longfin inshore squid'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab_T'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ni'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 12 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 01 05];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 03 27];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 27];

%% set data
% zero-variate data

data.ab_22 = 257/24; units.ab_22 = 'd'; label.ab_22 = 'age at birth';           bibkey.ab_22 = 'McMaSumm1971';   
  temp.ab_22 = C2K(22);  units.temp.ab_22 = 'K'; label.temp.ab_22 = 'temperature';
data.ab_18 = 445/24; units.ab_18 = 'd'; label.ab_18 = 'age at birth';           bibkey.ab_18 = 'McMaSumm1971';   
  temp.ab_18 = C2K(18.5);  units.temp.ab_18 = 'K'; label.temp.ab_18 = 'temperature';
data.ab_15 = 642/24; units.ab_15 = 'd'; label.ab_15 = 'age at birth';           bibkey.ab_15 = 'McMaSumm1971';   
  temp.ab_15 = C2K(15);  units.temp.ab_15 = 'K'; label.temp.ab_15 = 'temperature';
data.am = 1.5*365;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'Summ1971';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature'; 
data.am_m = 3*365;   units.am_m = 'd';  label.am_m = 'life span for male';      bibkey.am_m = 'Summ1971';   
  temp.am_m = C2K(15); units.temp.am_m = 'K'; label.temp.am_m = 'temperature'; 

data.Lb  = 0.2; units.Lb  = 'cm'; label.Lb  = 'mantle length at birth';         bibkey.Lb  = 'Summ1971';
data.Lp  = 17;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';       bibkey.Lp  = 'Summ1971';
data.Li  = 27;  units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'Summ1971';
data.Li_m = 45; units.Li_m = 'cm';label.Li_m  = 'mantle length at death for male'; bibkey.Li_m  = 'Summ1971';

data.Ni  = 15000; units.Ni  = '#';      label.Ni  = 'cum reprod at death';      bibkey.Ni  = 'MaxwHanl2000';   
  temp.Ni = C2K(15); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'Temp is guessed'; 
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (month), mantle length (cm)
0   2 4  6  8 10 12 14 16 18 20 22 23;
0.2 4 7 10 12 14 16 18 20 21 23 25 27]';
data.tL_f(:,1) = data.tL_f(:,1) * 30.5; % convert month to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'mantle length', 'female'};  
temp.tL_f    = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Summ1971';
comment.tL_f = 'Temp is guessed; data for females'; 
%
data.tL_m = [ ... % time since birth (month), mantle length (cm)
0 2 4 6 8 10 12 14 16 18 20 22 23 35;
0.2 4 7 10 12 15 18 21 23 25 28 30 32 45]';
data.tL_m(:,1) = data.tL_m(:,1) * 30.5; % convert month to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'mantle length', 'male'};  
temp.tL_m    = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Summ1971';
comment.tL_m = 'Temp is guessed; data for males'; 

% length-weight
data.LW = [ ... % mantle length (cm), body weight (g)
0.235	3.924
5.294	8.571
10.235	34.685
15.176	86.190
20.118	157.227
25.059	253.654
30.118	375.488
35.059	518.790
40.118	685.547];
units.LW   = {'cm', 'g'};  label.LW = {'mantle length', 'wet weight'};  
bibkey.LW = 'LangJohn1978';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for female, male'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and h_a only';
D2 = 'Reproductive output is assumed to correspond to am = 1 yr, the most frequent max age';
D3 = 'mod_2: males have equal state variables as females at b';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Spawning over 4-6 months, several capsules per clutch, at least 2 clutches';
metaData.bibkey.F1 = 'MaxwHanl2000'; 
F2 = 'typically lives for 1 yr, some reach 2 yr, and occasionally 3 yr';
metaData.bibkey.F2 = 'Summ1971'; 
F3 = 'sex dimorphy, sex ratio 1:1; brood in july & nov';
metaData.bibkey.F3 = 'Summ1971'; 
F4 = 'Programmed death, not by ageing';
metaData.bibkey.F4 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '37FV6'; % Cat of Life
metaData.links.id_ITIS = '82372'; % ITIS
metaData.links.id_EoL = '448839'; % Ency of Life
metaData.links.id_Wiki = 'Doryteuthis_pealeii'; % Wikipedia
metaData.links.id_ADW = 'Loligo_pealeii'; % ADW
metaData.links.id_Taxo = '3954926'; % Taxonomicon
metaData.links.id_WoRMS = '410354'; % WoRMS
metaData.links.id_molluscabase = '410354'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Doryteuthis_pealeii}}';
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
bibkey = 'Summ1971'; type = 'Article'; bib = [ ... 
'author = {Summers, W. C.}, ' ... 
'year = {1971}, ' ...
'title = {Age and growth of Loligo pealei, a population study of the common atlantic coast squid}, ' ...
'howpublished = {\url{http://www.biolbull.org/content/141/1/189}}, ' ...
'journal = {Biol. Bull}, ' ...
'volume = {141}, ' ...
'pages = {189--201}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LangJohn1978'; type = 'techreport'; bib = [ ... 
'author = {Lange, A. M. T. and Johnson, K. L.}, ' ... 
'year = {1978}, ' ...
'title = {Dorsal mantle length - total weight relationships of squid (\emph{Loligo pealei} and \emph{Illex illecebrosus}) from the northwest {A}tlantic, off the coast of the {U}nited {S}tates}, ' ...
'howpublished = {\url{www.nefsc.noaa.gov/publications/series/whlrd/whlrd7851.pdf}}, ' ...
'institution = {Woods Hole, Lab Ref}, ' ...
'pages = {78--51}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McMaSumm1971'; type = 'Article'; bib = [ ... 
'author = {McMahon, J. J. and Summers, W. C.}, ' ... 
'year = {1971}, ' ...
'title = {Temperature effects on the developmental rate of squid (\emph{Loligo pealei}) embryos}, ' ...
'howpublished = {\url{http://www.biolbull.org/content/141/3/561}}, ' ...
'journal = {Biol. Bull.}, ' ...
'volume = {141}, ' ...
'pages = {561--567}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MaxwHanl2000'; type = 'Article'; bib = [ ... 
'author = {Maxwell, M. R. and Hanlon, R. T.}, ' ... 
'year = {2000}, ' ...
'title = {Female reproductive output in the squid \emph{Loligo pealeii}: multiple egg clutches and implications for a spawning strategy }, ' ...
'howpublished = {\url{http://www.int-res.com/articles/meps/199/m199p159.pdf}}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {199}, ' ...
'pages = {159--170}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

