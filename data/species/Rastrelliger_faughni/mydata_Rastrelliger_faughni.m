function [data, auxData, metaData, txtData, weights] = mydata_Rastrelliger_kanagurta

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Rastrelliger_faughni'; 
metaData.species_en = 'Island mackerel'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 10];

%% set data
% zero-variate data
data.ab = 4.5;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(27.3); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 4*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(27.3); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 10; units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'guess';
data.Li = 20;   units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 4.5e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of  0.95 mm: pi/6*0.095^3';
data.Wwp = 9.8; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.00891*Lp^3.04, see F1';
data.Wwi = 80; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00891*Li^3.04, see F1; max. published weight: 750 g (which is hard to believe given Li)';

data.Ri  = 12580/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';  
  temp.Ri = C2K(27.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecunsity of Decapterus_macarellus: 170455*80/1084';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
44.798	15.284
73.585	16.319
103.519	17.250
133.033	18.718
195.230	19.939
225.875	21.517
256.916	22.881
287.238	23.705
365+14.087	24.566];
data.tL(:,1) = data.tL(:,1)+110; % set origin at birth
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(27.3); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CorpSaeg1985';

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
F1 = 'length-weight: Ww in g = 0.00891*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4RLTH'; % Cat of Life
metaData.links.id_ITIS = '202055'; % ITIS
metaData.links.id_EoL = '46577300'; % Ency of Life
metaData.links.id_Wiki = 'Rastrelliger_faughni'; % Wikipedia
metaData.links.id_ADW = 'Rastrelliger_faughni'; % ADW
metaData.links.id_Taxo = '185796'; % Taxonomicon
metaData.links.id_WoRMS = '273808'; % WoRMS
metaData.links.id_fishbase = 'Rastrellig-erfaughni'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Rastrelliger_faughni}}';  
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
bibkey = 'CorpSaeg1985'; type = 'techreport'; bib = [ ... 
'author = {Corpuz, A. and J. Saeger and V. Sambilay}, ' ...
'year = {1985}, ' ...
'title = {Population parameters of commercially important fishes in {P}hilippine waters}, ' ... 
'institution = {Tech. Rep. Dep. Mar. Fish. Univ. Philipp. Visayas.}, ' ...
'volume = {6}, ' ...
'pages = {1-99},' ...
'howpublished = {\url{https://digitalarchive.worldfishcenter.org/server/api/core/bitstreams/9211bb8d-9bb9-4343-966b-649ff18d9b5b/content}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Rastrelliger-faughni.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
