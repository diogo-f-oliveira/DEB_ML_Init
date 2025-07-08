function [data, auxData, metaData, txtData, weights] = mydata_Trachinocephalus_myops
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Aulopiformes'; 
metaData.family     = 'Synodontidae';
metaData.species    = 'Trachinocephalus_myops'; 
metaData.species_en = 'Snakefish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0jMp', 'jiMc', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.3); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 05 02];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 02];

%% set data
% zero-variate data
data.am = 7*365;   units.am = 'd';    label.am = 'life span';                         bibkey.am = 'fishbase';  
  temp.am = C2K(27.3); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 18;   units.Lp = 'cm';   label.Lp = 'total length at puberty for females'; bibkey.Lp = 'YangChen2013';
data.Li = 32.6;     units.Li = 'cm';   label.Li = 'ultimate total length for females'; bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'YangChen2013';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwi = 380; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00302*Li^3.37, see F1';

data.Ri = 426200/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'YangChen2013';
  temp.Ri = C2K(27.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL = [ ... % age (years) ~ fork length (cm) 
1	16.1
2	20.7
3	24.2
4	27.0
5	29.2
6	31.4];
data.tL(:,1) = 365 * (.4 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'fork length'};  
temp.tL = C2K(27.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DuLu2011'; 

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.00302*(TL in cm)^3.37';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '53XV6'; % Cat of Life
metaData.links.id_ITIS = '162420'; % ITIS
metaData.links.id_EoL = '46563962'; % Ency of Life
metaData.links.id_Wiki = 'Trachinocephalus_myops'; % Wikipedia
metaData.links.id_ADW = 'Trachinocephalus_myops'; % ADW
metaData.links.id_Taxo = '42983'; % Taxonomicon
metaData.links.id_WoRMS = '158884'; % WoRMS
metaData.links.id_fishbase = 'Trachinocephalus-myops'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trachinocephalus_myops}}';
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
bibkey = 'DuLu2011'; type = 'article'; bib = [ ...
'doi = {10.1007/s13131-011-0163-y}, ' ...
'author = {Du, J. and Lu, Z. and Yang, S. and Chen, M.}, ' ... 
'year   = {2011}, ' ...
'title  = {Studies on ecological characteristics variation and population dynamics of four lizardfishes in the southern {T}aiwan Straits}, ' ...
'journal = {Acta Oceanologica Sinica}, ' ...
'page = {72–81}, ' ...
'volume = {30(6)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'YangChen2013'; type = 'article'; bib = [ ...
'doi = {10.1111/jai.12190}, ' ...
'author = {Yang, J.-L. and Chen, L.-H. and Hu, T.-J.}, ' ... 
'year   = {2013}, ' ...
'title  = {Maturity and spawning of painted lizardfish, \emph{Trachinocephalus myops}({B}loch and {S}chneider, 1801) in the southeastern {C}hina {S}ea}, ' ...
'journal = {Journal of Applied Ichthyology}, ' ...
'page = {1050–1055}, ' ...
'volume = {29(5)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Trachinocephalus_myops.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

