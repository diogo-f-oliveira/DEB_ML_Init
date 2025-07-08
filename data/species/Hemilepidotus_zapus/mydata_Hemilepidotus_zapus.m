function [data, auxData, metaData, txtData, weights] = mydata_Hemilepidotus_zapus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Hemilepidotus_zapus'; 
metaData.species_en = 'Longfin Irish lord'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 30];

%% set data
% zero-variate data

data.am = 9 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'TokrOrlo2003';   
  temp.am = C2K(3.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 17.5;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 26;     units.Li  = 'cm';  label.Li  = 'ultimate total length for';    bibkey.Li  = 'fishbase';

data.Wwb = 1.2e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'TokrOrlo2003';
  comment.Wwb = 'baed on egg diameter of 1.3 mm: pi/6*0.13^3';
data.Wwp  = 60;  units.Wwp  = 'g';  label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = 'fishbase';
  comment.Wwp = 'based on 0.00794*Lp^3.12, see F1';
data.Wwi  = 206.3;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on 0.00794*Li^3.12, see F1';
 
% uni-variate data
% time-length
data.tL_fm = [ ... % age (years), total length (cm) 
3 11.5 12.5
4 14.3 14.0
5 16.9 15.9
6 19.4 18.0
7 21.6 20.5
8 23.6 NaN
9 25.5 NaN];
data.tL_fm(:,1) = 365 * (0.25 + data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(3.8);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'TokrOrlo2003'; treat.tL_fm = {1 {'females','males'}};
comment.tL_fm = 'data  from eastern Northern Kurils';

% time-weight
data.tW_fm = [ ... % age (years), weight (g) 
3  55  60
4  69  65
5 104  85
6 151 113
7 202 143
8 252 NaN
9 285 NaN];
data.tW_fm(:,1) = 365 * (0.25 + data.tW_fm(:,1)); % convert yr to d
units.tW_fm = {'d', 'g'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(3.8);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'TokrOrlo2003'; treat.tW_fm = {1 {'females','males'}};
comment.tW_fm = 'data  from eastern Northern Kurils';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
17.5  7.8e3
19.5 10.9e3
21.5 14.4e3
23.5 16.3e3];
units.LN = {'cm', '#'}; label.LN = {'total length','fecundity'};  
temp.LN = C2K(3.8);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'TokrOrlo2003'; 
comment.LN = 'data  from eastern Northern Kurils';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 5;
weights.tW_fm = weights.tW_fm * 5;
weights.Li = weights.Li * 3;
weights.Wwi = weights.Wwi * 3;
weights.Wwb = weights.Wwb * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00794*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3KPLK'; % Cat of Life
metaData.links.id_ITIS = '167284'; % ITIS
metaData.links.id_EoL = '46569024'; % Ency of Life
metaData.links.id_Wiki = 'Hemilepidotus_zapus'; % Wikipedia
metaData.links.id_ADW = 'Hemilepidotus_zapus'; % ADW
metaData.links.id_Taxo = '176376'; % Taxonomicon
metaData.links.id_WoRMS = '279414'; % WoRMS
metaData.links.id_fishbase = 'Hemilepidotus-zapus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hemilepidotus_zapus}}';
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
bibkey = 'TokrOrlo2003'; type = 'Article'; bib = [ ... 
'author = {Tokranov, A.M. and A.M. Orlov and B.A. Sheiko}, ' ... 
'year = {2003}, ' ...
'title = {Brief review of the genera \emph{Hemilepidotus} and \emph{Melletes} ({C}ottidae) and some traits of the biology of a new species for {R}ussia \emph{Hemilepidotus zapus} from {P}acific waters of the northern {K}urils}, ' ...
'journal = {J. Ichthyol.}, ' ...
'volume = {43(5)}, ' ...
'pages = {333-349}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Hemilepidotus-zapus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

