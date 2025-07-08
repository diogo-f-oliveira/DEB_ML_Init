function [data, auxData, metaData, txtData, weights] = mydata_Monocentris_reedi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Trachichthyiformes'; 
metaData.family     = 'Monocentridae';
metaData.species    = 'Monocentris_reedi'; 
metaData.species_en = 'Pinecone fish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.7); % K, body temp
metaData.data_0     = { 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 01];

%% set data
% zero-variate data

data.am = 9*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'Kotl1988';   
  temp.am = C2K(19.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 8;  units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Li  = 9.9;  units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'guess based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 10.4; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.01995*Lip^3.01, see F1';
data.Wwi = 19.8;  units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight'; bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.01995*Li^3.01, see F1, gives 0.877 g';

data.GSI  = 0.02; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'guess';   
  temp.GSI = C2K(19.7); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL_fm = [  ... % time since birth (yr), total length (cm)
1 NaN 2.2
2 NaN 3.6
3 NaN 5.9
4 6.3 6.2
5 7.0 7.3
6 8.8 8.1
7 9.1 8.5
8 9.9 NaN]; 
data.tL_fm(:,1) = 365 * (0 + data.tL_fm(:,1)); % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(19.7);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Kotl1988'; treat.tL_fm = {1 {'females','males'}}; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.GSI = 3 * weights.GSI;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01995*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '44572'; % Cat of Life
metaData.links.id_ITIS = '622171'; % ITIS
metaData.links.id_EoL = '46567377'; % Ency of Life
metaData.links.id_Wiki = 'Monocentris_reedi'; % Wikipedia
metaData.links.id_ADW = 'Monocentris_reedi'; % ADW
metaData.links.id_Taxo = '180282'; % Taxonomicon
metaData.links.id_WoRMS = '277490'; % WoRMS
metaData.links.id_fishbase = 'Monocentris-reedi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Monocentris_reedi}}';
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
bibkey = 'Kotl1988'; type = 'Article'; bib = [ ... 
'author = {Kotlyar, A.N.}, ' ... 
'year = {1988}, ' ...
'title = {Material on the systematics and biology of the beryciform fishes \emph{Monocentris reedi} and \emph{Polymixia yuri} from the {N}aska submarine ridge}, ' ...
'journal = {J. Ichthyol.}, ' ...
'volume = {28(6)}, ' ...
'pages = {146-150}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Monocentris-reedi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

