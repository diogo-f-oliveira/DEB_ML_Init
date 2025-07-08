  function [data, auxData, metaData, txtData, weights] = mydata_Coilia_dussumieri
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Coilia_dussumieri'; 
metaData.species_en = 'Goldspotted grenadier anchovy'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr','0iFl'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 06 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 16];

%% set data
% zero-variate data
data.ab = 9; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 4*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28.7);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 14.7;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'AkhtHasa2024';
data.Li = 20;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AkhtHasa2024';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 11.6;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','AkhtHasa2024'};
  comment.Wwp = 'based on 0.00355*Lp^3.01, see F1';
data.Wwi = 29.3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00355*Li^3.01, see F1';

data.Ri  = 21334/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AkhtHasa2024';  
  temp.Ri = C2K(28.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since brth (yr), total length (cm)
 91.400	 8.295
124.051  8.365
148.845	10.235
152.761	 9.464
210.114	12.368
240.856	12.309
273.304	14.501
298.277	14.505
328.847	16.247
392.135	17.352];
data.tL(:,1) = data.tL(:,1)+60; % set origin at birth
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(28.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'FernDeva1988';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;
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

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am}';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00355*(TL in cm)^3.01'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.84*TL';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'WWG3'; % Cat of Life
metaData.links.id_ITIS = '551435'; % ITIS
metaData.links.id_EoL = '46562640'; % Ency of Life
metaData.links.id_Wiki = 'Coilia_dussumieri'; % Wikipedia
metaData.links.id_ADW = 'Coilia_dussumieri'; % ADW
metaData.links.id_Taxo = '171564'; % Taxonomicon
metaData.links.id_WoRMS = '219979'; % WoRMS
metaData.links.id_fishbase = 'Coilia-dussumieri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Coilia_dussumieri}}';  
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
bibkey = 'FernDeva1988'; type = 'Article'; bib = [ ... 
'doi = {10.1051/alr/2017040}, ' ...
'author = {Fernandez, I. and M. Devaraj}, ' ...
'year = {1988}, ' ...
'title = {Stock assessment and dynamics of the \emph{Coilia dussumieri} ({E}ngraulidae) resource in the {I}ndian Exclusive Economic Zone along the northwestern coast of {I}ndia}, ' ... 
'journal = {Asian Fish. Sci.}, ' ...
'volume = {1}, '...
'pages = {1157-1164}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AkhtHasa2024'; type = 'Article'; bib = [ ... 
'author = {Mousumi Akhter and Monjurul Hasan and Abu Bakker Siddique Khan and Rahamat Ullah and Aovijite Bosu and Farhana Yasmin and Mohammed Ashraful Haque and Amirul Islam and Yahia Mahmud}, ' ...
'year = {2024}, ' ...
'title = {Reproductive biology and feeding habit of \emph{Coilia dussumieri} {V}alenciennes, 1848 ({A}ctinopteri: {E}ngraulidae): {A} review}, ' ... 
'journal = {International Journal of Science and Technology Research Archive}, ' ...
'volume = {6(01)}, '...
'pages = {51–56}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Coilia-dussumieri.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  