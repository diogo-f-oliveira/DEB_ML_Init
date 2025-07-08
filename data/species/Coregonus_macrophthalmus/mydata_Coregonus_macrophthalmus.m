  function [data, auxData, metaData, txtData, weights] = mydata_Coregonus_macrophthalmus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Coregonus_macrophthalmus'; 
metaData.species_en = 'Gangfisch'; 

metaData.ecoCode.climate = {'Dwa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl'};
metaData.ecoCode.embryo  = {'Fg', 'Fs'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 02 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 10];

%% set data
% zero-variate data
data.am = 14*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 20;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'guess'; 
data.Li = 30;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 65;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based in 0.00447*Lp^3.20, see F1';
data.Wwi = 238;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based in 0.00447*Li^3.20, see F1';
    
data.Ri = 963/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';          bibkey.Ri = 'guess';
  temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Coregonus_chadary: 12100*238/2988';
  
% univariate data

% time-weight
data.tW = [ ... % time(d), weight (g)
0	11.087 11.034
20	12.200 11.988
30	15.512 14.187
40	16.996 14.691
50	18.216 15.486
60	20.177 16.095
70	22.774 16.917];
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'weight'};  
temp.tW = C2K([14; 10]);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'BaerGeis2017'; treat.tW = {1 {'14 C','10 C'}}; 
Ww0.tW = 11.05; units.Ww0.tW = 'g'; label.Ww0.tW = 'intitial weight';
comment.tW = 'Low culture density';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.Ww0 = Ww0;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight relationship: Ww in  g = 0.00447*(TL in cm)^3.20';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'endemic to Lake Constance';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6B295'; % Cat of Life
metaData.links.id_ITIS = '623416'; % ITIS
metaData.links.id_EoL = '845285'; % Ency of Life
metaData.links.id_Wiki = 'Coregonus_macrophthalmus'; % Wikipedia
metaData.links.id_ADW = 'Coregonus_macrophthalmus'; % ADW
metaData.links.id_Taxo = '171719'; % Taxonomicon
metaData.links.id_WoRMS = '1019928'; % WoRMS
metaData.links.id_fishbase = 'Coregonus-macrophthalmus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Coregonus_macrophthalmus}}';  
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
bibkey = 'BaerGeis2017'; type = 'Article'; bib = [ ...  
'doi = {10.1127/fal/2016/0803}, ' ...
'author = {Goebel, S. and Baer, J. and Geist, J.}, ' ...
'year = {2017}, ' ...
'title = {Effects of temperature and rearing density on growth of juvenile {E}uropean whitefish (\emph{Coregonus macrophthalmus}) in aquaculture}, ' ... 
'journal = {Fundamental and Applied Limnology / Archiv f\"{u}r Hydrobiologie}, ' ...
'pages = {257-266}, ' ...
'volume = {189(3)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Coregonus-macrophthalmus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

