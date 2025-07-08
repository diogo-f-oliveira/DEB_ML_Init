  function [data, auxData, metaData, txtData, weights] = mydata_Piaractus_brachypomus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Serrasalmidae';
metaData.species    = 'Piaractus_brachypomus'; 
metaData.species_en = 'Pirapitinga'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};                             
metaData.date_subm  = [2020 05 01];                          
metaData.email      = {'bas.kooijman@vu.nl'};                 
metaData.address    = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.curator    = {'Starrlight Augustine'};
metaData.email_cur  = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc   = [2020 05 01]; 


%% set data
% zero-variate data
data.ab = 1.7;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Brycon_moorei';
data.am = 28*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 52;    units.Lp = 'cm';   label.Lp = 'total length at puberty';  bibkey.Lp = 'fishbase';
data.Li = 88;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 4e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*.1^3';
data.Wwi = 20e3;  units.Wwi = 'g';    label.Wwi = 'max wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01698*88^3.12, see F2; fishbase gives max 25e3 g';
  
data.Ri = 20e3/4900*8100/365; units.Ri = '#/d'; label.Ri = 'reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on same rate per gram, compard with Brycon moorei';

% univariate data
% t-L data
data.tL = [ ... % age (d), fork length (cm)
82  	2.668
128.366	8.733
182.824	12.778
241.172	15.612
322.860	15.619
396.767	19.667
447.336	24.722
497.904	29.979
552.362	33.822
641.829	35.043
735.186	36.264
816.874	41.322
867.442	45.367
937.460	49.009
1026.927	49.220
1120.284	51.249
1201.971	55.094
1248.650	58.735
1349.787	59.755
1435.364	60.571
1520.941	63.205
1598.739	66.040
1676.536	68.068
1766.003	68.480
1871.030	69.904
1948.828	72.739
2042.185	74.162
2131.652	74.776
2232.789	75.392
2306.696	78.025
2368.934	79.041];
data.tL(:,1) = data.tL(:,1)-338;
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GuerAmad2018';
comment.tL = 'Reconstructed data from Japure (Brazil) for 1998-2004';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 5 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperature (in C) is assumed to vary as T = 25 + 5 * sin(2*pi*(t+30-82)/365)';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Preferred temp: 23-28 C';
metaData.bibkey.F1    = 'fishbase';
F2 = 'Weight (g) = 0.01698*(TL in cm)^3.12 ';
metaData.bibkey.F2    = 'fishbase';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4HPKY'; % Cat of Life
metaData.links.id_ITIS = '163280'; % ITIS
metaData.links.id_EoL = '217197'; % Ency of Life
metaData.links.id_Wiki = 'Piaractus_brachypomus'; % Wikipedia
metaData.links.id_ADW = 'Piaractus_brachypomus'; % ADW
metaData.links.id_Taxo = '183814'; % Taxonomicon
metaData.links.id_WoRMS = '1022721'; % WoRMS
metaData.links.id_fishbase = 'Piaractus-brachypomus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Piaractus_brachypomus}}';  
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
bibkey = 'GuerAmad2018'; type = 'Article'; bib = [ ...  
'author = {Ana Guerreiro and Sidineia Amadio and Nidia Fabr\''{e} and Vandick Batista}, ' ...
'year  = {2018}, ' ...
'title = {ESTIMATION OF GROWTH PARAMETERS OF FIVE FISH SPECIES ({A}CTINOPTERYGII) CAUGHT IN THE {C}ENTRAL {A}MAZON}, ' ...  
'doi = {10.3750/AIEP/02346}, ' ...
'journal = {Acta Ichthyologica et Piscatoria}, ' ...
'volume = {48}, ' ...
'pages = {303-313}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Piaractus-brachypomus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

