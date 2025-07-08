function [data, auxData, metaData, txtData, weights] = mydata_Viviparus_georgianus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Neogastropoda'; 
metaData.family     = 'Viviparidae';
metaData.species    = 'Viviparus_georgianus'; 
metaData.species_en = 'Banded mystery snail'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFm'};
metaData.ecoCode.embryo  = {'Fv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'jiD'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 22];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 22];

%% set data
% zero-variate data
data.am = 2*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Brow1978';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.6; units.Lb  = 'cm';  label.Lb  = 'shell length at birth'; bibkey.Lb  = 'Brow1978';
data.Lp  = 1.8;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'Brow1978';
data.Li  = 3.5;    units.Li  = 'cm';  label.Li  = 'ultimate shell length'; bibkey.Li  = 'Wiki';

data.Wwi  = 8.7;    units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight'; bibkey.Wwi  = 'UvaeShch2017';
  comment.Wwi = 'based on size-corrected value for viviparus viviparus: 17.4*(3.5/4.4)^3';

data.Ri  = 40/365; units.Ri  = '#/d'; label.Ri = 'max reproduction rate';  bibkey.Ri  = 'Brow1978';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % age (h), shell length (cm)
3.977	0.605
24.122	0.715
44.553	0.911
64.724	1.029
85.415	1.304
127.190	1.374
198.716	1.467
254.806	1.678
308.710	1.827
388.850	2.132
459.073	2.430
511.808	2.224
580.287	2.592
644.762	2.347
697.025	2.598
763.395	2.927
836.900	3.020
899.682	2.861
961.733	3.080
1029.043	3.095
1070.922	3.196];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time birth', 'shell length', 'female'};  
temp.tL_f    = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Brow1978';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % age (d), shell length (cm)
15.794	0.589
35.965	0.707
58.349	0.895
74.511	0.997
128.312	1.114
192.548	1.396
254.495	1.584
310.927	1.299
397.806	1.848
465.506	1.981
512.722	1.901
584.378	2.033
645.805	2.063
701.376	2.117];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time birth', 'shell length', 'male'};  
temp.tL_m    = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Brow1978';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males equal to females upto b';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '7QJ6G'; % Cat of Life
metaData.links.id_ITIS = '70307'; % ITIS
metaData.links.id_EoL = '493267'; % Ency of Life
metaData.links.id_Wiki = 'Viviparus_georgianus'; % Wikipedia
metaData.links.id_ADW = 'Viviparus_georgianus'; % ADW
metaData.links.id_Taxo = '631427'; % Taxonomicon
metaData.links.id_WoRMS = '1456449'; % WoRMS
metaData.links.id_molluscabase = '1456449'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Viviparus_georgianus}}';
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
bibkey = 'Brow1978'; type = 'Article'; bib = [ ... 
'author = {Robert A. Browne}, ' ... 
'year = {1978}, ' ...
'title = {Growth, mortality, fecundity, biomass and productivity of four lake populations of the prosobranch snail, \emph{Viviparus georgianus}}, ' ...
'journal = {Ecoloy}, ' ...
'volume = {59(4)}, ' ...
'pages = {742-750}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'UvaeShch2017'; type = 'Article'; bib = [ ... 
'author = {E. I. Uvaeva and G. Kh. Shcherbina}, ' ... 
'year = {2017}, ' ...
'title = {The Role of \emph{Viviparus contectus} ({M}illet) ({M}ollusca, {V}iviparidae) in the Sedimentation of Suspension and Transformation of Organic Matter in the {T}nya {R}iver ({U}kraine)}, ' ...
'journal = {Inland Water Biology}, ' ...
'number = {4}, ' ...
'volume = {10}, ' ...
'pages = {415-418}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

