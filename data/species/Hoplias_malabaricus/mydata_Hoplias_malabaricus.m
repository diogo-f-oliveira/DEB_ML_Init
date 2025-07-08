  function [data, auxData, metaData, txtData, weights] = mydata_Hoplias_malabaricus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Erythrinidae';
metaData.species    = 'Hoplias_malabaricus'; 
metaData.species_en = 'Wolf fish'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-W'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};                             
metaData.date_subm  = [2020 05 01];                          
metaData.email      = {'bas.kooijman@vu.nl'};                 
metaData.address    = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.curator    = {'Starrlight Augustine'};
metaData.email_cur  = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc   = [2020 05 01]; 


%% set data
% zero-variate data
data.ab = 2.17;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'fishbase';   
  temp.ab = C2K(21.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 17;    units.Lp = 'cm';   label.Lp = 'total length at puberty';  bibkey.Lp = 'fishbase';
data.Li = 65;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'Wiki';

data.Wwb = 4.2e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*.2^3';
data.Wwi = 3.8e3;  units.Wwi = 'g';    label.Wwi = 'max wet weight';    bibkey.Wwi = 'Wiki';
  
data.Ri = 3800/4900*8100/365; units.Ri = '#/d'; label.Ri = 'reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on same rate per gram, compard with Brycon moorei';

% univariate data
% t-W data
data.tW = [ ... % age (d), wet weight (g)
30.091	19.149
60.195	36.383
90.320	60.638
119.602	94.468
149.773	134.681
180.456	201.064
211.020	226.596
238.972	252.766
269.021	250.851];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(19);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'DaniFari2019';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;
weights.Ri = 5 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 7 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'preferred temperature: 20-26 C';
metaData.bibkey.F1    = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3MKDJ'; % Cat of Life
metaData.links.id_ITIS = '163055'; % ITIS
metaData.links.id_EoL = '344962'; % Ency of Life
metaData.links.id_Wiki = 'Hoplias_malabaricus'; % Wikipedia
metaData.links.id_ADW = 'Hoplias_malabaricus'; % ADW
metaData.links.id_Taxo = '43316'; % Taxonomicon
metaData.links.id_WoRMS = '874263'; % WoRMS
metaData.links.id_fishbase = 'Hoplias-malabaricus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Hoplias_malabaricus}}';  
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
bibkey = 'DaniFari2019'; type = 'Article'; bib = [ ...  
'author = {Marcos Daniel and Ren\''{o} Faria and Aderbal Cavalcante-Neto and Ivan Bezerra Allaman and Aline Dal''Olio Gomes and Renata Guimar\~{a}es Moreira and Eric M. Hallerman and Alexandre Wagner Silva Hilsdorf}, ' ...
'year  = {2019}, ' ...
'title = {The potential of \emph{Hoplias malabaricus} ({C}haraciformes: {E}rythrinidae), a {N}eotropical carnivore, for aquaculture}, ' ...  
'doi = {10.3750/AIEP/02346}, ' ...
'journal = {Aquaculture and Fisheries}, ' ...
'volume = {4}, ' ...
'pages = {89-97}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Hoplias-malabaricus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

