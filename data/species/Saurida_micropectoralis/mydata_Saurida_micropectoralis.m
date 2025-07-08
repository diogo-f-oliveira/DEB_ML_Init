function [data, auxData, metaData, txtData, weights] = mydata_Saurida_micropectoralis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Aulopiformes'; 
metaData.family     = 'Synodontidae';
metaData.species    = 'Saurida_micropectoralis'; 
metaData.species_en = 'Shortfin lizardfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSW','MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMc', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.2); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 11 12];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 12];

%% set data
% zero-variate data
data.am = 11*365;   units.am = 'd';    label.am = 'life span';                         bibkey.am = 'guess';  
  temp.am = C2K(26.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 19;   units.Lp = 'cm';   label.Lp = 'total length at puberty for females'; bibkey.Lp = 'guess';
data.Li = 38;     units.Li = 'cm';   label.Li = 'ultimate total length for females'; bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'YangChen2013';
  comment.Wwb = 'based on egg diameter of 0.8 mm of Trachinocephalus_myops: pi/6*0.08^3';
data.Wwi = 405; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00513*Li^3.10, see F1, gives 904 g';

data.Ri = 6.7e5/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(26.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on fecundity of Trachinocephalus_myops: 426200*(38/32.6)^3';
  
% uni-variate data
% time-length
data.tL = [ ... % age (d) ~ fork length (cm) 
242.573	10.370
363.014	17.185
424.868	20.444
487.530	24.000
608.834	28.444];
data.tL(:,1) = data.tL(:,1) - 100; % set origin at birth
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'fork length'};  
temp.tL = C2K(26.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DwipHati1986'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

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
F1 = 'length-weight: weight(in g) = 0.00513*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6XPW9'; % Cat of Life
metaData.links.id_ITIS = '644816'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Saurida_micropectoralis'; % Wikipedia
metaData.links.id_ADW = 'Saurida_micropectoralis'; % ADW
metaData.links.id_Taxo = '186629'; % Taxonomicon
metaData.links.id_WoRMS = '272116'; % WoRMS
metaData.links.id_fishbase = 'Saurida-micropectoralis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Saurida_micropectoralis}}';
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
bibkey = 'DwipHati1986'; type = 'techreport'; bib = [ ...
'author = {Dwiponggo, A. and T. Hariati and S. Banon and M.L.D. Palomares and D. Pauly}, ' ... 
'year   = {1986}, ' ...
'title  = {Growth, mortality and recruitment of commercially important fishes and penaeid shrimps in Indonesian waters}, ' ...
'institution = {ICLARM}, ' ...
'page = {1-91}, ' ...
'volume = {17}'];
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
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Saurida-micropectoralis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

