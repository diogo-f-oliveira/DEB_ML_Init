function [data, auxData, metaData, txtData, weights] = mydata_Pelmatolapia_mariae
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Pelmatolapia_mariae'; 
metaData.species_en = 'Spotted tilapia'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 19];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 19];

%% set data
% zero-variate data

data.am = 13*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 15;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 39.4;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 8.2e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.5 mm : pi/6*0.25^3';
data.Wwp = 54.5;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01660*Lp^2.99, see F1';
data.Wwi = 978.7;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01660*Li^2.99, see F1; max published weight 1.4 kg';

data.Ri  = 3300/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL = [ ... % time (d), total length (cm)
228.536	4.613
290.027	5.447
321.266	6.442
351.189	8.108
365+15.126	7.369
365+45.378	8.651
365+76.946	9.357
365+108.514	10.929
365+136.793	11.247
365+168.032	11.280
365+197.626	11.407
365+321.595	13.653
365+351.847	14.551
730+15.784	16.120
730+46.036	15.959
730+109.171	16.891
730+136.135	18.650
730+197.626	17.754
730+229.523	18.749
730+258.788	18.876
730+290.027	19.197
730+320.937	19.518
730+351.518	19.935
1095+16.770	20.352
1095+45.050	19.901
1095+77.604	21.185
1095+136.464	21.343
1095+197.955	22.273
1095+228.865	22.979
1095+290.356	22.948
1095+320.937	22.018
1095+352.176	23.397];
data.tL(:,1) = data.tL(:,1) - 50; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KingEtim2004';

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

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01660*(TL in cm)^2.99'; 
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '76CXS'; % Cat of Life
metaData.links.id_ITIS = '169811'; % ITIS
metaData.links.id_EoL = '47364138'; % Ency of Life
metaData.links.id_Wiki = 'Pelmatolapia_mariae'; % Wikipedia
metaData.links.id_ADW = 'Tilapia_mariae'; % ADW
metaData.links.id_Taxo = '91698'; % Taxonomicon
metaData.links.id_WoRMS = '1468480'; % WoRMS
metaData.links.id_fishbase = 'Pelmatolapia-mariae'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pelmatolapia_mariae}}';
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
bibkey = 'KingEtim2004'; type = 'article'; bib = [ ... 
'doi = {10.2989/16085914.2014.903375}, ' ...
'author = {R. P. King and L. Etim}, ' ...
'year  = {2004}, ' ...
'title = {Reproduction, growth, mortality and yield of \emph{Tilapia mariae} {B}oulenger 1899 ({C}ichlidae) in a {N}igerian rainforest wetland stream}, ' ... 
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {20}, ' ...
'pages = {502–510}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pelmatolapia-mariae.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

