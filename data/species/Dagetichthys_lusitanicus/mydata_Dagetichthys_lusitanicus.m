function [data, auxData, metaData, txtData, weights] = mydata_Dagetichthys_lusitanicus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Soleidae';
metaData.species    = 'Dagetichthys_lusitanicus'; 
metaData.species_en = 'Portuguese sole'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.6); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 05 15];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 15];

%% set data
% zero-variate data
data.am = 8*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'CabrCata2003';  
  temp.am = C2K(26.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 27.5;   units.Lp = 'cm';    label.Lp = 'total length at puberty';              bibkey.Lp = 'guess';
  comment.Lp = 'based on Pegusa_impar: 20*40/29';
data.Li = 40;  units.Li = 'cm';   label.Li = 'ultimate total length for females';    bibkey.Li = 'fishbase';

data.Wwb = 1.8e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.7  mm: pi/6*0.07^3';
data.Wwp = 140;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00977*Lp^3.07, see F2';
data.Wwi = 810;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^3.07, see F2';

data.Ri = 3e5/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(26.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data

% time-length data
data.tL_f = [ ... % age (years), total length (cm)
1.034	15.349
1.996	22.353
2.078	26.585
3.039	31.653
3.049	27.177
3.051	29.596
3.067	33.346
3.078	30.806
3.090	28.507
4.053	37.204
4.066	36.478
4.077	33.817
4.091	34.421
4.092	35.510
4.094	38.655
5.024	37.917
5.025	38.763
5.040	41.546
5.065	40.577
5.067	43.118
5.091	39.730
6.051	43.346
6.064	42.137
7.050	45.631
8.062	48.158];
data.tL_f(:,1) = (.75 + data.tL_f(:,1)) * 365; % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(26.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CabrCata2003';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % age (years), total length (cm)
1.955	21.022
2.037	24.650
2.063	23.440
3.037	28.508
3.039	31.532
3.051	29.838
3.063	27.419
3.068	36.008
3.091	30.564
3.094	33.951
4.065	35.994
4.104	34.663];
data.tL_m(:,1) = (.75 + data.tL_m(:,1)) * 365; % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(26.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CabrCata2003';
comment.tL_m = 'Data for males';

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
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-Weight relationship: Ww in g = 0.00977*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Branchiostoma lanceolatum form an important component of the diet';
metaData.bibkey.F1 = 'CabrCata2003'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '33YCC'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '1156462'; % Ency of Life
metaData.links.id_Wiki = 'Dagetichthys_lusitanicus'; % Wikipedia
metaData.links.id_ADW = 'Dagetichthys_lusitanicus'; % ADW
metaData.links.id_Taxo = '3414913'; % Taxonomicon
metaData.links.id_WoRMS = '403345'; % WoRMS
metaData.links.id_fishbase = 'Dagetichthys-lusitanicus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dagetichthys_lusitanicus}}';
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
bibkey = 'CabrCata2003'; type = 'article'; bib = [ ...
'author = {Henrique Cabra and Ana Isabel Catarino and Joana Figueiredo and Joana Garcia and Miguel Henriques}, ' ... 
'year   = {2003}, ' ...
'title  = {Feeding ecology, age, growth and sexual cycle of the {P}ortuguese sole, \emph{Synaptura lusitanica}}, ' ...
'journal = {J. Mar. Biol. Ass. U.K.}, ' ...
'page = {613-618}, ' ...
'volume = {83}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Dagetichthys-lusitanicus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
