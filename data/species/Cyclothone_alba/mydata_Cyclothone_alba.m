function [data, auxData, metaData, txtData, weights] = mydata_Cyclothone_alba
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Stomiiformes'; 
metaData.family     = 'Gonostomatidae';
metaData.species    = 'Cyclothone_alba'; 
metaData.species_en = 'Bristlemouth'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpm'};
metaData.ecoCode.embryo  = {'Mpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(8.9); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 02];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 02];

%% set data
% zero-variate data
data.am = 3*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'fishbase';  
  temp.am = C2K(8.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 2.0;   units.Lp = 'cm';   label.Lp = 'std length at puberty';  bibkey.Lp = 'fishbase';
data.Li = 5.6; units.Li = 'cm';   label.Li = 'ultimate std length';    bibkey.Li = 'fishbase';

data.Wwb = 7.8e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'MiyaNemo1986';
  comment.Wwb = 'based on egg diameter of 0.53 mm: pi/6*0.053^3';
data.Wwp = 0.02; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00275*Lp^2.83, see F1';  
data.Wwi = 0.36;  units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight'; bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00275*Li^2.83, see F1';  

% uni-variate data
% time-length
data.tL_f = [ ... % time  yr) - std length (cm)
0.087	1.176
0.134	1.195
0.301	1.264
0.373	1.280
0.425	1.357
0.444	1.277
0.472	1.348
0.633	1.451
0.708	1.544
0.739	1.557
0.836	1.760
0.888	1.739
0.954	1.884
1.000	1.884
1.075	2.026
1.121	1.999
1.299	2.157
1.420	2.248
1.457	2.300
1.469	2.242
1.643	2.357
1.702	2.533
1.740	2.530
1.820	2.589
1.895	2.550
1.966	2.578
1.994	2.566]; 
data.tL_f(:,1) = 365 * (0.6 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'std length', 'females'};  
temp.tL_f = C2K(8.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MiyaNemo1986';
%
data.tL_m = [ ... % time  yr) - std length (cm)
0.087	1.182
0.100	1.194
0.131	1.192
0.146	1.213
0.298	1.267
0.373	1.271
0.426	1.363
0.453	1.268
0.475	1.247
0.639	1.430
0.711	1.590
0.739	1.606
0.829	1.689
0.885	1.776
0.966	1.780
1.000	1.820
1.093	1.784
1.121	1.750
1.155	1.797
1.310	1.826
1.372	1.866
1.424	1.839
1.452	1.898
1.483	1.843
1.638	1.860
1.706	1.900
1.827	1.984
1.895	1.954
1.961	2.053
2.004	2.075]; 
data.tL_m(:,1) = 365 * (0.6 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'std length', 'males'};  
temp.tL_m = C2K(8.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MiyaNemo1986';

% length-fecundity
data.LN = [ ... % std length (cm), fecundity (#)
2.079	230.530
2.109	330.996
2.116	191.749
2.127	260.041
2.163	228.999
2.170	324.374
2.175	382.371
2.176	295.998
2.183	348.831
2.265	278.982
2.288	353.687
2.311	427.102
2.317	202.776
2.323	265.926
2.329	349.702
2.351	291.628
2.414	450.010
2.435	323.615
2.485	300.267
2.512	427.816
2.521	367.200
2.526	404.571
2.539	557.939
2.563	461.187
2.564	379.967
2.582	422.457
2.617	355.323
2.618	452.005
2.650	441.600
2.668	654.255
2.677	409.294
2.683	612.961
2.719	410.462
2.732	547.076
2.738	420.721
2.746	331.747
2.748	363.972
2.750	440.025
2.771	380.665
2.785	403.830
2.836	443.647
2.862	508.027];
units.LN = {'cm', '#'}; label.LN = {'std length', 'fecundity'};  
temp.LN = C2K(8.9);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'MiyaNemo1986';
    
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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00275*(TL in cm)^2.83';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'this species is possibly semelparous';
metaData.bibkey.F2 = 'MiyaNemo1986'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '32YHD'; % Cat of Life
metaData.links.id_ITIS = '162173'; % ITIS
metaData.links.id_EoL = '46563198'; % Ency of Life
metaData.links.id_Wiki = 'Cyclothone_alba'; % Wikipedia
metaData.links.id_ADW = 'Cyclothone_alba'; % ADW
metaData.links.id_Taxo = '172512'; % Taxonomicon
metaData.links.id_WoRMS = '127283'; % WoRMS
metaData.links.id_fishbase = 'Cyclothone-alba'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cyclothone_alba}}';
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
bibkey = 'MiyaNemo1986'; type = 'article'; bib = [ ...
'doi = {10.1016/0198-0149(86)90030-0}, ' ...
'author = {Miya, M. and Nemoto, T. }, ' ... 
'year   = {1986}, ' ...
'title  = {Life history and vertical distribution of the mesopelagic fish \emph{Cyclothone alba} (family {G}onostomatidae) in {S}agami {B}ay, {C}entral {J}apan}, ' ...
'journal = {Deep Sea Research Part A. Oceanographic Research Papers}, ' ...
'page = {1053–1068}, ' ...
'volume = {33(8)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Cyclothone-alba.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

