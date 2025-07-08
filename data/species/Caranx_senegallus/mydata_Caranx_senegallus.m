function [data, auxData, metaData, txtData, weights] = mydata_Caranx_senegallus
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Caranx_senegallus'; 
metaData.species_en = 'Senegal jack'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 17];

%% set data
% zero-variate data
data.ab = 7.5;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(19.7); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(19.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 21; units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 100;   units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'MutiMuyo2020';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 133; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.01349*Lp^3.02, see F1';
data.Wwi = 14.8e3; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01349*Li^3.02, see F1';

data.Ri  = 4e6/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';  
  temp.Ri = C2K(19.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Caranx_melampygus';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
348.559	17.553
365+14.468	19.271
365+46.365	19.661
365+75.302	19.849
365+134.820	23.081
365+166.059	23.880
365+195.653	25.190
365+227.550	25.784
365+257.473	27.298
365+288.054	28.302
365+318.306	28.183
730+46.365	31.396
730+74.973	31.992
730+105.554	32.383
730+227.878	35.274
730+318.964	36.448
1095+14.797	38.556
1095+45.707	38.743
1095+74.315	38.625
1095+228.207	40.988
1095+287.725	41.465];
data.tL(:,1) = data.tL(:,1)+20; % set origin at birth
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'}; 
temp.tL = C2K(19.7); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ArraSyll2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01349*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '68ZXS'; % Cat of Life
metaData.links.id_ITIS = '641983'; % ITIS
metaData.links.id_EoL = '46577981'; % Ency of Life
metaData.links.id_Wiki = 'Caranx_senegallus'; % Wikipedia
metaData.links.id_ADW = 'v'; % ADW
metaData.links.id_Taxo = '165434'; % Taxonomicon
metaData.links.id_WoRMS = '273274'; % WoRMS
metaData.links.id_fishbase = 'Caranx-senegallus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Caranx_senegallus}}';  
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
bibkey = 'ArraSyll2020'; type = 'article'; bib = [ ...
'author = {S. Arra and S. Sylla and T.T. Zan-Bi and A.G. Loukou and M. Ouattara}, ' ...
'year = {2020}, ' ...
'title = {Stock assessment and population dynamics of {S}enegal Jack, \emph{Caranx senegallus} {C}uvier, 1833, from industrial fishery of {C}ote d''{i}voire ({W}est {A}frica)}, ' ... 
'journal = {Agronomie Africaine}, ' ...
'volume = {32(1)}, ' ...
'pages = {37–49}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Caranx-senegallus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
