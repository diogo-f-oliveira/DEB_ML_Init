function [data, auxData, metaData, txtData, weights] = mydata_Octolasion_cyaneum

%% set metaData
metaData.phylum     = 'Annelida'; 
metaData.class      = 'Clitellata'; 
metaData.order      = 'Haplotaxida'; 
metaData.family     = 'Lumbricidae';
metaData.species    = 'Octolasion_cyaneum'; 
metaData.species_en = 'Earthworm'; 

metaData.ecoCode.climate = {'C'};
metaData.ecoCode.ecozone = {'THp', 'TAz'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab_T'; 'ap'; 'am'; 'Ww0'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-Ww'; 't-N'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2013 05 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 15]; 
%% set data
% zero-variate data

data.ab_15 = 114;  units.ab_15 = 'd'; label.ab_15 = 'age at birth';         bibkey.ab_15 = 'Butt1993';   
  temp.ab_15 = C2K(15); units.temp.ab_15 = 'K'; label.temp.ab_15 = 'temperature';
data.ab_20 = 86;  units.ab_20 = 'd'; label.ab_20 = 'age at birth';         bibkey.ab_20 = 'Butt1993';   
  temp.ab_20 = C2K(20); units.temp.ab_20 = 'K'; label.temp.ab_20 = 'temperature';
data.tp = 4*30.5; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Butt1993';
  temp.tp = C2K(20);    units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 8*365;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(20);    units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 0.041; units.Ww0 = 'g';   label.Ww0 = 'egg wet weight';         bibkey.Ww0 = 'Butt1993';
data.Wwb = 0.035; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Butt1993';
data.Wwp = 2.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'Butt1993';
data.Wwi = 2.7;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Butt1993';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
  0.464	0.067
 31.520	0.175
 60.722	1.092
 91.778	1.717
121.444	2.364
152.500	2.337];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(20);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Butt1993';

% time-reproduction
data.tN = [ ... % time after maturation (d), cumulative offspring (#)
30.341	1.319
61.988	4.865
92.376	6.741
123.827	7.947
153.029	9.044
181.103	10.029
214.746	10.677
241.625	10.772
275.287	11.643
304.584	13.854
335.997	14.614
365.462	18.830];
units.tN   = {'d', '#'};  label.tN = {'time since birth', 'cumulative offspring'};  
temp.tN    = C2K(20);  units.temp.tN = 'K'; label.temp.tN = 'temperature';
bibkey.tN = 'Butt1993';
comment.tN = 'initial mass 2.6 g mean mass mother: 3.6 g during full year';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 40 * weights.psd.p_M;
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Reproduction efficiency kap_R has been set to 0.95/2 because the species is simultaneous hermaphroditic';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'obligatory parthenogenic reproduction; 20% twins';
metaData.bibkey.F1 = 'Butt1993'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = '978352'; % ITIS
metaData.links.id_EoL = '3140066'; % Ency of Life
metaData.links.id_Wiki = 'Octolasion'; % Wikipedia
metaData.links.id_ADW = 'Octolasion_cyaneum'; % ADW
metaData.links.id_Taxo = '140609'; % Taxonomicon

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lumbricidae}}';
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
bibkey = 'Butt1993'; type = 'Article'; bib = [ ... 
'author = {Butt, K. R.}, ' ... 
'year = {1993}, ' ...
'title = {Reproduction and growth of three deep-burrowing earthworms (Lumbricidae) in laboratory culture in order to assess production for soil restoration}, ' ...
'journal = {Biol Fertil Soils}, ' ...
'volume = {16}, ' ...
'pages = {135--138}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
