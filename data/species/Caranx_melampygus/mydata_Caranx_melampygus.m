function [data, auxData, metaData, txtData, weights] = mydata_Caranx_melampygus
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Caranx_melampygus'; 
metaData.species_en = 'Bluefin trevally'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MP'};
metaData.ecoCode.habitat = {'0iMc','0iMr'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.9); % K, body temp
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
data.ab = 3.2;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(27.9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(27.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 35; units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 117;   units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 646; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.01738*Lp^2.96, see F1';
data.Wwi = 23e3; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01738*Li^2.96, see F1; max. published weight: 43.5 kg ';

data.Ri  = 4270000/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';  
  temp.Ri = C2K(27.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.261	10.643
0.277	8.558
0.278	7.022
0.322	7.900
0.334	14.373
0.380	9.984
0.586	13.166
1.126	29.185
1.218	21.066
1.337	19.530
1.628	28.088
1.644	26.003
1.688	26.771
1.878	31.928
1.951	34.013
2.230	37.743
2.251	23.809
2.448	46.740
3.952	55.298
5.869	65.831];
data.tL(:,1) = (data.tL(:,1)+0)*365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'}; 
temp.tL = C2K(27.9); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SmitParr2002';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

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
F1 = 'length-weight: Ww in g = 0.01738*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'R2RH'; % Cat of Life
metaData.links.id_ITIS = '168619'; % ITIS
metaData.links.id_EoL = '46577976'; % Ency of Life
metaData.links.id_Wiki = 'Caranx_melampygus'; % Wikipedia
metaData.links.id_ADW = 'Caranx_melampygus'; % ADW
metaData.links.id_Taxo = '106157'; % Taxonomicon
metaData.links.id_WoRMS = '218419'; % WoRMS
metaData.links.id_fishbase = 'Caranx-melampygus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Caranx_melampygus}}';  
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
bibkey = 'SmitParr2002'; type = 'article'; bib = [ ...
'doi = {10.1006/ecss.2001.0909}, '  ...
'author = {G. C. Smith and J. D. Parrish}, ' ...
'year = {2002}, ' ...
'title = {Estuaries as Nurseries for the Jacks \emph{Caranx ignobilis} and \emph{Caranx melampygus} ({C}arangidae) in {H}awaii}, ' ... 
'journal = {Estuarine, Coastal and Shelf Science}, ' ...
'volume = {55}, ' ...
'pages = {347–359}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Caranx-melampygus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
