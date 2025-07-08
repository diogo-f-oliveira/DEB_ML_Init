  function [data, auxData, metaData, txtData, weights] = mydata_Brycon_moorei
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Bryconidae';
metaData.species    = 'Brycon_moorei'; 
metaData.species_en = 'Dorada'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};                             
metaData.date_subm  = [2019 02 10];                          
metaData.email      = {'bas.kooijman@vu.nl'};                 
metaData.address    = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.curator    = {'Starrlight Augustine'};
metaData.email_cur  = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc   = [2019 02 10]; 


%% set data
% zero-variate data
data.ab = (15+21)/24;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'BaraLuca2005';   
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 25.5;    units.Lp = 'cm';   label.Lp = 'total length at puberty';  bibkey.Lp = {'Manc2017','fishbase'};
data.Li = 53;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Manc2017';
  comment.Wb = 'based on egg diameter of 1.25 mm: pi/6*.125^3';
data.Wwi = 4.9e3;  units.Wwi = 'g';    label.Wwi = 'max wet weight';    bibkey.Wwi = 'fishbase';

  
data.Ri = 8e5/365; units.Ri = '#/d'; label.Ri = 'reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% t-L data
data.tL = [ ... % age (d), total length (cm)
0.978	0.720
1.963	0.811
3.030	0.926
3.932	1.016
4.876	1.106
5.943	1.213
7.009	1.320
7.829	1.435
9.019	1.533
9.922	1.616
10.989	1.706
11.892	1.780
12.958	1.862
13.902	1.977
15.051	2.068
17.020	2.232
19.032	2.339
20.960	2.479
23.915	2.652
26.994	2.768
29.950	2.916
33.069	3.056
36.927	3.287];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BaraLuca2010';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 10 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Preferred temp: 22-28 C';
metaData.bibkey.F1    = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'NH7X'; % Cat of Life
metaData.links.id_ITIS = '640607'; % ITIS
metaData.links.id_EoL = '211943'; % Ency of Life
metaData.links.id_Wiki = 'Brycon'; % Wikipedia
metaData.links.id_ADW = 'Brycon_moorei'; % ADW
metaData.links.id_Taxo = '164721'; % Taxonomicon
metaData.links.id_WoRMS = '1020099'; % WoRMS
metaData.links.id_fishbase = 'Brycon-moorei'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Brycon}}';  
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
bibkey = 'BaraLuca2010'; type = 'Article'; bib = [ ...  
'doi = {10.1111/j.1095-8649.2010.02740.x}, ' ...
'author = {E. Baras and M. C. Lucas}, ' ...
'year  = {2010}, ' ...
'title = {Individual growth trajectories of sibling \emph{Brycon moorei} raised in isolation since egg stage, and their relationship with aggressive behaviour}, ' ...  
'journal = {Journal of Fish Biology}, ' ...
'volume = {77}, ' ...
'pages = {985-997}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BaraLuca2005'; type = 'Article'; bib = [ ...  
'doi = {10.1111/j.1095-8649.2005.00656}, ' ...
'author = {E. Baras and M. C. Lucas}, ' ...
'year  = {2005}, ' ...
'title = {Individual growth trajectories of sibling \emph{Brycon moorei} raised in isolation since egg stage, and their relationship with aggressive behaviour}, ' ...  
'journal = {Journal of Fish Biology}, ' ...
'volume = {66}, ' ...
'pages = {996-1024}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Manc2017'; type = 'Article'; bib = [ ...  
'doi = {10.15517/rbt.v65i3.29453}, ' ...
'author = {Mancera-Rodriguez, N\''{e}stor Javier}, ' ...
'year  = {2017}, ' ...
'title = {Reproductive biology of \emph{Brycon henni} ({T}eleostei: {B}ryconidae) and conservation strategies for the {N}are and {G}uatap\''{e} rivers, {M}agdalena {R}iver {B}asin, Colombia}, ' ...  
'journal = {Rev. biol. trop}, ' ...
'volume = {65}, ' ...
'pages = {1105-1119}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Brycon-moorei.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

