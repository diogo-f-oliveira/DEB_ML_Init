function [data, auxData, metaData, txtData, weights] = mydata_Pipistrellus_kuhlii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Vespertilionidae';
metaData.species    = 'Pipistrellus_kuhlii'; 
metaData.species_en = 'Kuhl''s pipistrelle'; 

metaData.ecoCode.climate = {'BWk','BSk','BSh','Csa','Cfb','Dfb'};
metaData.ecoCode.ecozone = {'THp','TPa'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 25];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 25]; 

%% set data
% zero-variate data

data.tg = 42;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'guess';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'based on P. pipistrellus';
data.tx = 42;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'guess';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'based on P. pipistrellus';
data.tp = 256;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'guess';   
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on P. pipistrellus';
data.am = 8*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1.35; units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';  bibkey.Wwb = 'SharVais2012';
data.Wwi = 6;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'AnAge';

data.Ri  = 1.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = {'AnAge','SharVais2012'};   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.5 pup per litter; 1 litter per yr';

% uni-variate data
% time-weight
data.tWh = [ ... % time since birth (d), weight (g)
 1	1.350
 7	1.773
11	2.196
15	2.696
19	3.389
23	3.658
28	4.004
33	3.848
41	3.886
48	4.193
58	5.040
68	5.213
78	5.250
88	5.249];
units.tWh   = {'d', 'g'};  label.tWh = {'time since birth', 'wet weight','high birth weight'};  
temp.tWh    = C2K(34.8);  units.temp.tWh = 'K'; label.temp.tWh = 'temperature';
bibkey.tWh = 'SharVais2012';
%
data.tWl = [ ... % time since birth (d), weight (g)
 1	0.829
 7	1.310
11	1.752
15	2.291
19	2.791
23	3.079
28	3.116
33	3.211
41	3.171
48	3.729
58	4.731
68	5.077
78	5.114
88	5.325];
units.tWl   = {'d', 'g'};  label.tWl = {'time since birth', 'wet weight','low birth weight'};  
temp.tWl    = C2K(34.8);  units.temp.tWl = 'K'; label.temp.tWl = 'temperature';
bibkey.tWl = 'SharVais2012';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tWh = 5 * weights.tWh;
weights.tWl = 5 * weights.tWl;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWh','tWl'}; subtitle1 = {'Data for high, low birth weight'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4J6KR'; % Cat of Life
metaData.links.id_ITIS = '632108'; % ITIS
metaData.links.id_EoL = '327706'; % Ency of Life
metaData.links.id_Wiki = 'Pipistrellus_kuhlii'; % Wikipedia
metaData.links.id_ADW = 'Pipistrellus_kuhlii'; % ADW
metaData.links.id_Taxo = '169434'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13802081'; % MSW3
metaData.links.id_AnAge = '13802081'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pipistrellus_kuhlii}}';
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
bibkey = 'SharVais2012'; type = 'Article'; bib = [ ... 
'doi = {10.1515/mammalia-2012-0054}, ' ...
'author = {Mozafar Sharifi and Somaye Vaissi}, ' ... 
'year = {2012}, ' ...
'title = {The impact of body mass at birth on postnatal growth in captive {K}uhl''s pipistrelle, \emph{Pipistrellus kuhlii} ({C}hiroptera, {V}espertilionidae)}, ' ...
'journal = {Mammalia}, ' ...
'volume = {}, ' ...
'pages = {1-6}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MacDBarr1993'; type = 'Book'; bib = [ ...  
'author = {David MacDonald and Priscilla Barrett}, ' ...
'year = {1993}, ' ...
'title  = {Mammals of Britain and Europe}, ' ...
'publisher = {HarperCollins, London}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Pipistrellus_kuhlii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

