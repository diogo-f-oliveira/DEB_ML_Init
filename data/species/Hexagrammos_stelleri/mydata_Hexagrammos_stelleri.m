function [data, auxData, metaData, txtData, weights] = mydata_Hexagrammos_stelleri

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Hexagramminae ';
metaData.species    = 'Hexagrammos_stelleri'; 
metaData.species_en = 'Whitespotted Greenling';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 04 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 6 * 365;     units.am = 'd';    label.am = 'life span';            bibkey.am = '';   
  temp.am = C2K(4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 18.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'ShesNaza2006'; 
data.Li  = 48;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.8e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'ShesNaza2006';
  comment.Wwb = 'based on egg diameter of 1.75 mm (1.5 to 3 mm): pi/6*0.175^3';
data.Wwp = 72.5;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'ShesNaza2006';
data.Wwi = 1.6e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
 
data.Ri = 38.4e3/365;       units.Ri = '#/d';  label.Ri = 'reprod rate';       bibkey.Ri = 'fishbase';
  temp.Ri = C2K(9.39); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL_f = [ ... %  time since birth (yr), total length(cm)
1	11.419
2	15.629
3	19.113
4	23.831
5	26.879
6	31.016];
data.tL_f(:,1) = (0.5 + data.tL_f(:,1)) * 365; % convert yr to d
units.tL_f = {'d' 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(4); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ShesNaza2006';
comment.tL_f = 'Data for females';
%
data.tL_m = [... %  time since birth (yr), total length(cm)
1	10.331
2	15.702
3	19.621
4	23.395
5	26.226];
data.tL_m(:,1) = (0.5 + data.tL_m(:,1)) * 365; % convert yr to d
units.tL_m = {'d' 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(4); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ShesNaza2006';
comment.tL_m = 'Data for males';

% time-weight
data.tW_f = [ ... %  time since birth (yr), wet weight (g)
1	15.698
2	44.477
3	83.721
4	167.442
5	239.390
6	410.756];
data.tW_f(:,1) = (0.5 + data.tW_f(:,1)) * 365; % convert yr to d
units.tW_f = {'d' 'g'}; label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f = C2K(4); units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'ShesNaza2006';
comment.tW_f = 'Data for females';
%
data.tW_m = [... %  time since birth (yr), wet weight (g)
1	14.390
2	51.017
3	90.262
4	175.291
5	245.930];
data.tW_m(:,1) = (0.5 + data.tW_m(:,1)) * 365; % convert yr to d
units.tW_m = {'d' 'g'}; label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m = C2K(4); units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'ShesNaza2006';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
% F1 = '';
% metaData.bibkey.F1 = '';
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3LGGJ'; % Cat of Life
metaData.links.id_ITIS = '167113'; % ITIS
metaData.links.id_EoL = '46568828'; % Ency of Life
metaData.links.id_Wiki = 'Hexagrammos'; % Wikipedia
metaData.links.id_ADW = 'Hexagrammos_stelleri'; % ADW
metaData.links.id_Taxo = '176624'; % Taxonomicon
metaData.links.id_WoRMS = '254545'; % WoRMS
metaData.links.id_fishbase = 'Hexagrammos-stelleri'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hexagrammos}}';
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
bibkey = 'ShesNaza2006'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S0032945206080169}, ' ...
'author = {A. V. Shestakov and M. V. Nazarkin}, ' ... 
'year = {2006}, ' ...
'title = {On the Biology of the White-Spotted Greenling \emph{Hexagrammos stelleri} and the Masked Greenling \emph{H. octogrammus} ({H}exagrammidae) from {T}aui {B}ay of the {S}ea of {O}khotsk}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {46}, ' ...
'pages = {677-680}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Hexagrammos-stelleri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

