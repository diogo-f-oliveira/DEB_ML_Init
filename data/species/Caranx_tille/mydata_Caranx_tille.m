  function [data, auxData, metaData, txtData, weights] = mydata_Caranx_tille
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Caranx_tille'; 
metaData.species_en = 'Tille trevally'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 
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
data.ab = 6; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 11*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 35;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 80;     units.Li = 'cm';   label.Li = 'ultimate total length';     bibkey.Li = 'fishbase';

data.Wwb = 5.23e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 571;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01380*Lp^2.99, see F1';
data.Wwi = 6763;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01380*Li^2.99, see F1; max. published weight: 7.2 kg';

data.Ri  = 2.1e6/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';  
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Caranx_crysos: 1546000*6763/4804';
  

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm), weight (g)
2.853	30.864
2.932	33.827
2.933	36.790
2.971	32.593
3.948	33.086
4.026	43.704
4.925	44.691
4.926	46.667
5.003	39.753
5.941	49.630
5.942	42.469
7.036	51.111];
data.tL(:,1) = (0.5 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
  temp.tL = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'FryBrew2006'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.ab = weights.ab * 0;
weights.Wwi = weights.Wwi * 3;
weights.Wwp = weights.Wwp * 0;
weights.Li = weights.Li * 5;

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
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01380*(TL in cm)^2.99'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'R2TP'; % Cat of Life
metaData.links.id_ITIS = '641984'; % ITIS
metaData.links.id_EoL = '46577975'; % Ency of Life
metaData.links.id_Wiki = 'Caranx_tille'; % Wikipedia
metaData.links.id_ADW = 'Caranx_tille'; % ADW
metaData.links.id_Taxo = '106160'; % Taxonomicon
metaData.links.id_WoRMS = '218418'; % WoRMS
metaData.links.id_fishbase = 'Caranx-tille'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Caranx_tille}}';  
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
bibkey = 'FryBrew2006'; type = 'article'; bib = [ ...
'doi = {10.1016/j.fishres.2006.08.002}, ' ...
'author = {Fry, G.C. and D.T. Brewer and W.N. Venables}, ' ...
'year = {2006}, ' ...
'title = {Vulnerability of deepwater demersal fishes to commercial fishing: {E}vidence from a study around a tropical volcanic seamount in {P}apua {N}ew {G}uinea}, ' ... 
'journal = {Fish. Res.}, ' ...
'volume = {81}, '...
'pages = {126-141}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Caranx-tille.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  