function [data, auxData, metaData, txtData, weights] = mydata_Trichonotus_filamentosus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Trichonotidae';
metaData.species    = 'Trichonotus_filamentosus'; 
metaData.species_en = 'Sand diver'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'bjMp','jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(26.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 15];

%% set data
% zero-variate data
data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(26.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(26.2);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp = 7;     units.Lp = 'cm';   label.Lp = 'std length at puberty'; bibkey.Lp = 'guess';
  comment.Lp = 'at SL 10 cm convert female to male';
data.Li = 15;  units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 6.5e-5;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.5 mm: pi/6*0.05^3';
data.Wwp = 1.7;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00389*Lp^3.12, see F1';
data.Wwi = 18.1;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00389*Li^3.12, see F1';

data.GSI = 0.05; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'KuseNaka1991';
  temp.GSI = C2K(26.2); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data

% time-length
data.tL_f = [ ... % time since hatch (yr), total length (cm)
0.990	7.020
1.052	6.788
1.123	7.002
2.007	9.930
2.033	9.452
2.041	9.122
2.050	8.164
2.113	9.863];
data.tL_f(:,1) = (.2 + data.tL_f(:,1)) * 365; % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'std length', 'females'};  
temp.tL_f = C2K(26.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KuseNaka1991';
%
data.tL_m = [ ... % time since hatch (yr), total length (cm)
2.026	11.217
2.053	11.910
2.996	12.544
3.006	13.171
3.014	12.165
3.031	11.174
3.032	11.653
3.058	11.389
3.121	12.527
3.138	11.124
3.174	11.635
3.994	13.541
4.004	14.828
4.011	12.617];
data.tL_m(:,1) = (.2 + data.tL_m(:,1)) * 365; % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'std length', 'males'};  
temp.tL_m = C2K(26.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KuseNaka1991';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 5;
weights.tL_m = weights.tL_m * 5;
weights.ab = weights.ab * 0;
weights.Wwb = weights.Wwb * 3;

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
D1 = 'males are assumed not to differ from females, but convert sex at SL 10 cm';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00389*(TL in cm)^3.12'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '58GBR'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46573276'; % Ency of Life
metaData.links.id_Wiki = 'Trichonotus'; % Wikipedia
metaData.links.id_ADW = 'Trichonotus_filamentosus'; % ADW
metaData.links.id_Taxo = '189428'; % Taxonomicon
metaData.links.id_WoRMS = '279120'; % WoRMS
metaData.links.id_fishbase = 'Trichonotus-filamentosus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Trichonotus_filamentosus}}';  
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
bibkey = 'KuseNaka1991'; type = 'Article'; bib = [ ...
'author = {Kusen, J.D. and K. Nakagawa and Y. Yogo and A. Nakazono}, ' ...
'year = {1991}, ' ...
'title = {Protogynous hermaphroditism in the sand diver Trichonotus filamentosus}, ' ... 
'journal = {Nippon Suisan Gakkaishi/Bull. Jap. Soc. Sci. Fish.}, ' ...
'volume = {57(1)}, '...
'pages = {35-40}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Trichonotus_filamentosus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

