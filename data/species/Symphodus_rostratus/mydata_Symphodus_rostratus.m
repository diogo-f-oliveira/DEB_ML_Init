function [data, auxData, metaData, txtData, weights] = mydata_Symphodus_rostratus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Symphodus_rostratus'; 
metaData.species_en = 'Sublet '; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAbl', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 03 31];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 31];

%% set data
% zero-variate data

data.am = 4*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(18.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 5.4;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on Symphodus_melops: 8.5*17.7/28';
data.Li  = 17.7;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.9e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.82 to 1.05 mm of Labrus merula: pi/6*0.09^3';

data.GSI = 0.16;  units.GSI = '-';    label.GSI = 'gonado somatic index';   bibkey.GSI = 'guess';   
  temp.GSI = C2K(18.9);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature'; 
  comment.GSI = 'based on Symphodus_melops';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm) 
1	2.359
2	8.217
3	10.958];
data.tL(:,1) = 365 * (0 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(18.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Niva1996';

% length-weight
data.LW = [ ... % time since birth (yr), total length (cm) 
8.809	8.971
9.608	11.618
9.917	10.588
10.288	20.882
10.377	19.265
10.508	22.500
10.806	17.206
10.827	22.206
10.906	17.647
10.986	18.529
11.086	21.912
11.106	20.147
11.155	18.971
11.206	21.324
11.315	17.941
11.506	25.441
11.615	23.088
11.784	20.882
11.965	27.059
11.965	31.029
12.105	32.353
12.204	27.941
12.225	31.765
12.405	37.941
12.494	31.912
12.793	31.176
12.794	36.176
12.884	38.676
13.113	33.382
13.124	39.853
13.513	38.235
13.822	41.176
13.892	38.088
14.741	47.647];
units.LW   = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'Ceng2021';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length weight: Ww in g = 0.00912*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'It is today heavily exploited for the use in aquaculture to remove salmon louse (Lepeophtheirus salmonis)';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '53PK9'; % Cat of Life
metaData.links.id_ITIS = '614239'; % ITIS
metaData.links.id_EoL = '46571682'; % Ency of Life
metaData.links.id_Wiki = 'Symphodus_rostratus'; % Wikipedia
metaData.links.id_ADW = 'Symphodus_rostratus'; % ADW
metaData.links.id_Taxo = '169984'; % Taxonomicon
metaData.links.id_WoRMS = '273571'; % WoRMS
metaData.links.id_fishbase = 'Symphodus-rostratus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Symphodus_rostratus}}';
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
bibkey = 'Niva1996'; type = 'Article'; bib = [ ... 
'author = {Nival, S.}, ' ... 
'year = {1996}, ' ...
'title = {Contribution \`{a} 1\''{e}etude biologique de \emph{Symphodus rostratus} {B}l. ({P}isces: {L}abridae) en {R}ade de {V}illfranche-sur {M}er}, ' ...
'journal = {Vie et Milieu}, ' ...
'volume = {17(3)A}, ' ...
'pages = {1273-1515}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ceng2021'; type = 'Article'; bib = [ ... 
'author = {\"{O}zg\"{u}r  Cengiz}, ' ... 
'year = {2021}, ' ...
'title = {Length-Weight Relationships of Four \emph{Symphodus} Species ({P}erciformes: {L}abridae) off {G}\"{o}k\c{c}eada {I}sland ({N}orthern {A}egean {S}ea, {T}urkey)}, ' ...
'journal = {Acta Natura et Scientia}, ' ...
'volume = {2(2)}, ' ...
'pages = {159-165}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Symphodus-rostratus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

