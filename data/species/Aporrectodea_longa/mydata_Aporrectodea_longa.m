function [data, auxData, metaData, txtData, weights] = mydata_Aporrectodea_longa

%% set metaData
metaData.phylum     = 'Annelida'; 
metaData.class      = 'Clitellata'; 
metaData.order      = 'Haplotaxida'; 
metaData.family     = 'Lumbricidae';
metaData.species    = 'Aporrectodea_longa'; 
metaData.species_en = 'Black-headed worm'; 

metaData.ecoCode.climate = {'C'};
metaData.ecoCode.ecozone = {'THp'};
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
metaData.date_mod_1 = [2016 10 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 15]; 

%% set data
% zero-variate data

data.ab_15 = 61;  units.ab_15 = 'd'; label.ab_15 = 'age at birth';         bibkey.ab_15 = 'Butt1993';   
  temp.ab_15 = C2K(15); units.temp.ab_15 = 'K'; label.temp.ab_15 = 'temperature';
data.ab_20 = 56;  units.ab_20 = 'd'; label.ab_20 = 'age at birth';         bibkey.ab_20 = 'Butt1993';   
  temp.ab_20 = C2K(20); units.temp.ab_20 = 'K'; label.temp.ab_20 = 'temperature';
data.tp = 4*30.5; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Butt1993';
  temp.tp = C2K(20);    units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 8*365;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(20);    units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 0.050; units.Ww0 = 'g';   label.Ww0 = 'egg wet weight';         bibkey.Ww0 = 'Butt1993';
data.Wwb = 0.040; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'guessed from Ww0';
data.Wwp = 3.9;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'Butt1993';
data.Wwi = 4.2;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Butt1993';
  
% uni-variate data

% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
  0.463	0.045
 31.520	0.310
 60.722	1.654
 91.778	2.368
121.444	3.038
152.500	3.168];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(20);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Butt1993';

% time - reproduction
data.tN = [ ... % time after maturation (d), cumulative offspring (#)
29.165	0.651
61.913	3.974
92.329	6.184
121.747	9.843
152.153	11.941
182.578	14.262
214.272	18.366
243.465	19.351
274.003	23.009
303.271	24.885
333.789	28.321
364.364	32.424];
units.tN   = {'d', '#'};  label.tN = {'time since birth', 'cumulative offspring'};  
temp.tN    = C2K(20);  units.temp.tN = 'K'; label.temp.tN = 'temperature';
bibkey.tN = 'Butt1993';
comment.tN = 'initial mass 3.1 g; decreasing mass during reprod to 5.3 g';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 10 * weights.psd.p_M;
weights.psd.v = 1 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Reproduction efficiency kap_R has been set to 0.95/2 because the species is simultaneous hermaphroditic';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '84WKF'; % Cat of Life
metaData.links.id_ITIS = '975613'; % ITIS
metaData.links.id_EoL = '3126993'; % Ency of Life
metaData.links.id_Wiki = 'Aporrectodea'; % Wikipedia
metaData.links.id_ADW = 'Aporrectodea_longa'; % ADW
metaData.links.id_Taxo = '3565676'; % Taxonomicon
metaData.links.id_WoRMS = '1450855'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lumbricidea}}';
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
'title = {Reproduction and growth of three deep-burrowing earthworms ({L}umbricidae) in laboratory culture in order to assess production for soil restoration}, ' ...
'journal = {Biol Fertil Soils}, ' ...
'volume = {16}, ' ...
'pages = {135--138}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
