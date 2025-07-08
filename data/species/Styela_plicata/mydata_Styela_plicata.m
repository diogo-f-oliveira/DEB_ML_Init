function [data, auxData, metaData, txtData, weights] = mydata_Styela_plicata

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Ascidiacea'; 
metaData.order      = 'Stolidobranchia'; 
metaData.family     = 'Styelidae';
metaData.species    = 'Styela_plicata'; 
metaData.species_en = 'Pleated sea squirt';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.5); % K
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2022 05 26];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 05 26]; 


%% set data
% zero-variate data;
data.ab = 0.6;     units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(19.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 61;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Yama1975';
  temp.tp = C2K(25); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '2 mnth in summer, 5 mnth in winter';
data.am = 183; units.am = 'd';    label.am = 'life span';               bibkey.am = 'Yama1975';   
  temp.am = C2K(19.5); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'survives 3-4 month after puberty';

data.Lp  = 4;  units.Lp  = 'cm';  label.Lp  = 'body length at puberty'; bibkey.Lp  = 'Yama1975';
data.Li  = 8;  units.Li  = 'cm';  label.Li  = 'ultimate body length'; bibkey.Li  = 'Yama1975';

data.Wwb  = 2.45e-5;   units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth'; bibkey.Wwb  = 'VillPatr2010';
  comment.Wwb = 'based on egg diameter of 0.15 mm: Wwi*(0.05/2)^3';
data.Wwi  = 60;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'DrauScar2010';

data.Ri  = 2.5e6/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri = C2K(19.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.9';

% uni-variate data at f
% time-body length
data.tL_sum = [ ... % time settlement (d), body length (cm)
6.203	1.408
19.043	2.815
29.177	3.904
42.620	4.948
58.628	5.456];
units.tL_sum = {'d', 'cm'}; label.tL_sum = {'time since settlement', 'body length'};  
tT = [ ... % time since 1 jan (mnth), temperature (C)
    0 14.2
    1 13.7
    2 13.7
    3 15.0
    4 18.5
    5 21.8
    6 23.6
    7 25.6
    8 24.1
    9 20.7
   10 18.7
   11 15.7];
tT = [tT; tT]; tT(1:12+12,1) = 1:12 + 12;
tT(:,1) = tT(:,1) * 30.5;  % convert mnth to d
tT(:,2) = C2K(tT(:,2));  % convert C to K
temp.tL_sum = tT; units.temp.tL_sum = 'K'; label.temp.tL_sum = 'temperature';
settle.tL_sum = 183; units.settle.tL_sum = 'd'; label.settle.tL_sum = 'time at settlement';
bibkey.tL_sum = 'Yama1975'; 
comment.tL_sum = 'June - Aug';
%
data.tL_win = [ ... % time settlement (d), body length (cm)
2.098	0.659
18.214	1.815
28.568	2.234
44.940	2.936
59.644	3.581
79.634	4.089
107.615	4.778
134.289	5.581];
units.tL_win = {'d', 'cm'}; label.tL_win = {'time since settlement', 'body length'};  
temp.tL_win = tT; units.temp.tL_win = 'K'; label.temp.tL_win = 'temperature';
settle.tL_win = 336; units.settle.tL_win = 'd'; label.settle.tL_win = 'time at settlement';
bibkey.tL_win = 'Yama1975'; 
comment.tL_win = 'Nov - Apr';

data.Tt2 = [ ... temperature (C), doubling time of body length at settlement (d)
13.094	21.446
16.507	15.296
23.525	8.278
24.605	6.882
25.202	7.322
26.224	6.827];
units.Tt2 = {'C', 'd'}; label.Tt2 = {'temperature', 'initial doubling time of body length'};  
bibkey.Tt2 = 'Yama1975'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_win = 3 * weights.tL_win;
weights.tL_sum = 3 * weights.tL_sum;
weights.Ri = 0 * weights.Ri;
weights.ab = 0 * weights.ab;
weights.tp = 0 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack data and txt_data for output
auxData.temp   = temp;
auxData.settle = settle;
txtData.units  = units;
txtData.label  = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_sum','tL_win'}; subtitle1 = {'Data for summer, winter populations'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'temperature ranges from 13.6 C in Jan to 25.5 C in August';     
metaData.discussion = struct('D1',D1); 

%% Facts
F1 = 'Solitary tunicate; total length tadpole 1.3 mm; after tail resorption upon settlement 0.3 mm; functional ascidian in 4 d after settlement';
metaData.bibkey.F1 = 'Yama1975';
F2 = 'Protandric hermaphroditic; external fertilisation';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '538B5'; % Cat of Life
metaData.links.id_ITIS = '159338'; % ITIS
metaData.links.id_EoL = '46585323'; % Ency of Life
metaData.links.id_Wiki = 'Styela_plicata'; % Wikipedia
metaData.links.id_ADW = 'Styela_plicata'; % ADW
metaData.links.id_Taxo = '83161'; % Taxonomicon
metaData.links.id_WoRMS = '103936'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Styela_plicata}}'; 
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
bibkey = 'Yama1975'; type = 'article'; bib = [ ...
'author = {M. Yamaguchi}, ' ...
'year = {1975}, ' ...
'title  = {Growth and Reproductive Cycles of the Marine Fouling Ascidians \emph{Ciona intestinalis}, \emph{Styela plicata}, \emph{Botrylloides violaceus}, and \emph{Leptoclinum mitsukurii} at {A}buratsubo-{M}oroiso {I}nlet ({C}entral {J}apan)}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {29}, '...
'pages = {253-259}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DrauScar2010'; type = 'article'; bib = [ ...
'doi = {10.1080/10934520903429816}, ' ...
'author = {Draughon, L. D. and Scarpa, J. and Hartmann, J. X.}, ' ...
'year = {2010}, ' ...
'title  = {Are filtration rates for the rough tunicate \emph{Styela plicata} independent of weight or size?}, ' ...
'journal = {Journal of Environmental Science and Health, Part A}, ' ...
'volume = {45(2)}, '...
'pages = {168–176}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VillPatr2010'; type = 'article'; bib = [ ...
'doi = {10.2108/zsj.17.1115}, ' ...
'author = {Villa, Luisa Anna and Patricolo, Eleonora}, ' ...
'year = {2010}, ' ...
'title  = {The Follicle Cells of \emph{Styela plicata} ({A}scidiacea, {T}unicata): {A} Sem Study}, ' ...
'journal = {Zoological Science}, ' ...
'volume = {17(8}, '...
'pages = {1115-1121}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

