function [data, auxData, metaData, txtData, weights] = mydata_Syngnathoides_biaculeatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Syngnathidae';
metaData.species    = 'Syngnathoides_biaculeatus'; 
metaData.species_en = 'Alligator pipefish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW';'MIE'};
metaData.ecoCode.habitat = {'0iMcd', '0iMr'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.42); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp';  'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 05 14];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 14];

%% set data
% zero-variate data

data.ab = 34;      units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(28.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab  = '30 till 38 d';
data.am = 5*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'ForsLowe2006';   
  temp.am = C2K(17.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'survived 3.5 yr in lab';

data.Lb  = 2;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';      bibkey.Lb  = 'TakaConn2003';  
data.Lp  = 19;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';      bibkey.Lp  = 'fishbase';  
data.Li  = 29;  units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'TakaConn2003';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 4.3;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00037*Lp^3.18, see F1';
data.Wwi = 16.5;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00037*Li^3.18, see F1';

data.Ri  = 200*2/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'TakaConn2003';   
  temp.Ri = C2K(28.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '200 eggs per brood, assumed: 2 broods per yr';
  
% uni-variate data
% time-length
data.tL = [ ... % time since 1 Jan (d), total length (cm)
14.428	12.003
45.449	14.576
75.509	16.599
107.011	17.520
136.829	18.574
167.369	19.099];
data.tL(:,1) = (data.tL(:,1)-data.tL(1,1)); % set origin at start observation
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length', 'wild'};  
temp.tL    = C2K(28.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'TakaConn2003';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.Lb = 0 * weights.Lb;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL','tL1'}; subtitle1 = {'Data from wild, captive'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'length-weight: Ww in g = 0.00037*(TL in cm)^3.18';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Has no caudal fin';
metaData.bibkey.F2 = 'TakaConn2003'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '7B8GW'; % Cat of Life
metaData.links.id_ITIS = '166589'; % ITIS
metaData.links.id_EoL = '46567648'; % Ency of Life
metaData.links.id_Wiki = 'Syngnathoides_biaculeatus'; % Wikipedia
metaData.links.id_ADW = 'Syngnathoides_biaculeatus'; % ADW
metaData.links.id_Taxo = '188585'; % Taxonomicon
metaData.links.id_WoRMS = '218035'; % WoRMS
metaData.links.id_fishbase = 'Syngnathoides-biaculeatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Syngnathoides_biaculeatus}}';
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
bibkey = 'TakaConn2003'; type = 'Article'; bib = [ ... 
'author = {Eri Takahashi and Rod M. Connolly and S.Y. Lee}, ' ... 
'year = {2003}, ' ...
'title = {Growth and reproduction of double-ended pipefish, \emph{Syngnathoides biaculeatus}, in {M}oreton {B}ay, {Q}ueensland, {A}ustralia}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {67}, ' ...
'pages = {23–33}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Syngnathoides-biaculeatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

