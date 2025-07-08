  function [data, auxData, metaData, txtData, weights] = mydata_Alosa_aestivalis

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Alosidae';
metaData.species    = 'Alosa_aestivalis'; 
metaData.species_en = 'Blueback herring'; 

metaData.ecoCode.climate = {'Cfa','Dfa', 'Dwa', 'MC'};
metaData.ecoCode.ecozone = {'THn','MAW'};
metaData.ecoCode.habitat = {'piMpe', '0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L','L-Ww'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 06 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data
data.tp = 3.7*365;  units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'Mess1977'; 
  temp.tp = C2K(17);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 4*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 21.5;     units.Lp = 'cm';   label.Lp = 'fork length at puberty';bibkey.Lp = 'Mess1977';
data.Li = 26;     units.Li = 'cm';   label.Li = 'ultimate fork length';  bibkey.Li = 'Mess1977';
data.Lim = 23;     units.Lim = 'cm';   label.Lim = 'ultimate fork length';  bibkey.Lim = 'Mess1977';

data.Wwb = 6.9e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'WallYeag1990';
  comment.Wwb = 'based on egg diameter of 1.1 mm for Alosa_pseudoharengus: pi/6*0.11^3';
  
data.Ri = 2e5/365;units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'WallYeag1990';   
  temp.Ri = C2K(17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on same relative value, compared to Alosa_pseudoharengus: 3.6e5*(26/31)^3 per yr';

% uni-variate data
% time - length
data.tL_f = [ ... % time since birth (yr), fork length (cm) 
1.006	7.427
1.091	8.382
1.371	11.054
1.687	13.249
2.112	15.396
2.621	17.495
3.130	19.499
3.906	21.264
4.705	22.696
5.553	23.746
7.006	24.795];
data.tL_f(:,1) = 365 * data.tL_f(:,1);
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'fork length', 'female'};  bibkey.tL_f = 'Mess1977';
temp.tL_f = C2K(17);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
comment.tL_f = 'Data for females; data read from curve, not points';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm) 
0.970	7.523
1.250	9.909
1.541	12.008
1.833	14.060
2.354	16.445
2.827	17.924
3.602	19.690
4.378	20.835
5.540	22.076
6.993	22.839];
data.tL_m(:,1) = 365 * data.tL_m(:,1);
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'fork length', 'male'};  bibkey.tL_m = 'Mess1977';
temp.tL_m = C2K(17);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
comment.tL_m = 'Data for males; data read from curve, not points';

% length - weight
data.LWw_f = [ ... % fork length (cm), wet weight (g)
17.015	66.735
19.409	91.755
21.154	113.393
22.330	130.839
24.074	156.592
25.899	185.649
28.005	228.736];
units.LWw_f = {'cm', 'g'};     label.LWw_f = {'fork length', 'wet weight', 'female'};  bibkey.LWw_f = 'Mess1977';
comment.LWw_f = 'Data for females; data read from curve, not points';
%
data.LWw_m = [ ... % fork length (cm), wet weight (g)
17.016	61.797
19.370	83.519
20.789	106.759
22.411	132.496
24.479	165.701];
units.LWw_m = {'cm', 'g'}; label.LWw_m = {'fork length', 'wet weight', 'male'};  bibkey.LWw_m = 'Mess1977';
comment.LWw_m = 'Data for males; data read from curve, not points';

%% set weights for all real data
weights = setweights(data, []);
weights.tp = 0 * weights.tp;

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
set2 = {'LWw_f','LWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males ase assumed to differ froam females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = 'C5LD'; % Cat of Life
metaData.links.id_ITIS = '161703'; % ITIS
metaData.links.id_EoL = '46562371'; % Ency of Life
metaData.links.id_Wiki = 'Alosa_aestivalis'; % Wikipedia
metaData.links.id_ADW = 'Alosa_aestivalis'; % ADW
metaData.links.id_Taxo = '160453'; % Taxonomicon
metaData.links.id_WoRMS = '158667'; % WoRMS
metaData.links.id_fishbase = 'Alosa-aestivalis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Alosa_aestivalis}}';  
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{www.fishbase.org/summary/Alosa-aestivalis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WallYeag1990'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Robert Wallus and Bruce L. Yeager and Thomas P. Simon}, ' ...
'year = {1990}, ' ...
'title  = {The reproductive biology and early life history of fishes of the Ohio river}, ' ...
'publisher = {Tennessee Valley Authority}, ' ...
'volume  = {1: Acipenseridae through Esocidae}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mess1977'; type = 'Article'; bib = [ ...  
'author = {Shoukry N. Messieh}, ' ...
'year = {1977}, ' ...
'title  = {Population structure and biology of alewives (\emph{Alosa pseudoharengus}) and blueback herring (\emph{A. aestivalis}) in the {S}aint {J}ohn {R}iver, {N}ew {B}runswick}, ' ...
'journal = {Env. Biol. Fish.}, ' ...
'volume = {2}, ' ...
'pages = {195-210}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

  