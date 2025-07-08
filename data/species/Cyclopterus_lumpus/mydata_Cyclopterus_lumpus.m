function [data, auxData, metaData, txtData, weights] = mydata_Cyclopterus_lumpus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cyclopteridae';
metaData.species    = 'Cyclopterus_lumpus'; 
metaData.species_en = 'Lumpfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0iMd'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'Ww-dWw_T'; 't-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 05 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 30]; 


%% set data
% zero-variate data

data.ah = 15;      units.ah = 'd';    label.ah = 'age at hatch';              bibkey.ah = 'Nytr2013';   
  temp.ah = C2K(14);  units.temp.ah = 'K'; label.temp.ah = 'temperature';
  comment.ah = '190-220 day degrees';
data.tb = 7;       units.tb = 'd';    label.tb = 'time since hatch at birth'; bibkey.tb = 'Nytr2013';   
  temp.tb = C2K(14);  units.temp.tb = 'K'; label.temp.tb = 'temperature';
data.am = 13 * 365;   units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

%data.L0  = 0.2;    units.L0  = 'cm';  label.L0  = 'egg diameter';             bibkey.L0  = 'Nytr2013';  
data.Lb  = 0.4;    units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'Nytr2013';  
data.Lp  = 35;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty for female'; bibkey.Lp  = 'Nytr2013'; 
data.Lp_m = 28;    units.Lp_m = 'cm'; label.Lp_m = 'total length at puberty for male';  bibkey.Lp_m  = 'Nytr2013'; 
  comment.Lp_m = '17-38 cm';
data.Li  = 61;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Wiki';
data.Li_m  = 40;   units.Li_m = 'cm'; label.Li_m  = 'ultimate total length';  bibkey.Li_m  = 'Wiki';

data.Wwi = 9500;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Wiki';

data.Ri = 3.5e5/ 365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(14);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% Ww-dWw data by Nytr2013
data.WdW_4 = [ ... % wet weight (g), % growth (1/d) at 4 C
35.801	1.792
37.624	1.617
55.856	1.900
58.895	1.813
77.735	1.290
80.166	1.413
101.436	1.294
107.514	1.347];
units.WdW_4 = {'g', '1/d'};  label.WdW_4 = {'wet weight', 'spec growth rate', '4 C'};  
temp.WdW_4 = C2K(4);  units.temp.WdW_4 = 'K'; label.temp.WdW_4 = 'temperature';
bibkey.WdW_4 = 'Nytr2013';
%
data.WdW_7 = [ ... % wet weight (g), % growth (1/d) at 7 C
39.448	2.217
45.525	2.361
68.619	2.419
80.166	2.510
103.260	1.692
119.669	1.659
147.017	1.663
166.464	1.506];
units.WdW_7 = {'g', '1/d'};  label.WdW_7 = {'wet weight', 'spec growth rate', '7 C'};  
temp.WdW_7 = C2K(7);  units.temp.WdW_7 = 'K'; label.temp.WdW_7 = 'temperature';
bibkey.WdW_7 = 'Nytr2013';
%
data.WdW_10 = [ ... % wet weight (g), % growth (1/d) at 10 C
47.230	3.142
48.474	3.035
91.006	2.681
95.157	2.982
133.821	1.389
145.894	1.549
187.680	1.655
202.269	1.513];
units.WdW_10 = {'g', '1/d'};  label.WdW_10 = {'wet weight', 'spec growth rate', '10 C'};  
temp.WdW_10 = C2K(10);  units.temp.WdW_10 = 'K'; label.temp.WdW_10 = 'temperature';
bibkey.WdW_10 = 'Nytr2013';
%
data.WdW_13 = [ ... % wet weight (g), % growth (1/d) at 13 C
48.014	3.554
52.267	3.589
102.413	3.071
108.436	2.946
160.157	1.625
158.214	1.214
212.846	1.500
228.036	1.625];
units.WdW_13 = {'g', '1/d'};  label.WdW_13 = {'wet weight', 'spec growth rate', '13 C'};  
temp.WdW_13 = C2K(13);  units.temp.WdW_13 = 'K'; label.temp.WdW_13 = 'temperature';
bibkey.WdW_13 = 'Nytr2013';

% t-L data
data.tL = [ ... % total length (cm), time (yr)
0.979	1.789
1.995	11.004
2.983	19.999
4.002	31.616
5.044	37.993
5.996	41.747
6.975	43.536
8.012	45.546
9.019	46.464
9.997	47.598];
data.tL(:,1) = 365 * data.tL(:,1);
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(13);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Thor1983';
comment.tL = 'temp is guessed; female data';

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

%% Group plots
set1 = {'WdW_13','WdW_10','WdW_7','WdW_4'}; subtitle1 = {'Data at 13, 10, 7, 4 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = ['This fish lives in shallow water and remains attached to the substrate for most of the time except when breeding.' ... 
      'They feed on small fish and invertebrates. ' ...
      'Eggs are laid in a "nest" that is made in relatively shallow water by the male. '...
      'The male also guards and cares for the eggs by fanning them with his fins during the month-long incubation period. ' ...
      'It is often caught for the roe, made into an inexpensive caviar.'];
metaData.bibkey.F1 = 'Wiki';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '32WFN'; % Cat of Life
metaData.links.id_ITIS = '167612'; % ITIS
metaData.links.id_EoL = '46569197'; % Ency of Life
metaData.links.id_Wiki = 'Cyclopterus_lumpus'; % Wikipedia
metaData.links.id_ADW = 'Cyclopterus_lumpus'; % ADW
metaData.links.id_Taxo = '45013'; % Taxonomicon
metaData.links.id_WoRMS = '127214'; % WoRMS
metaData.links.id_fishbase = 'Cyclopterus-lumpus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cyclopterus_lumpus}}';
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
bibkey = 'Nytr2013'; type = 'Phdthesis'; bib = [ ... 
'author = {A. Vigdisdatter Nytr{\o}}, ' ... 
'year = {2013}, ' ...
'title = {The effect of temperature and fish size on growth of juvenile lumpfish (\emph{Cyclopterus lumpus} {L}.)}, ' ...
'school = {University of Troms{\o}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Thor1983'; type = 'Phdthesis'; bib = [ ... 
'author = {Thorsteinsson, V.}, ' ... 
'year = {1983}, ' ...
'title = {Some aspects of the biology and the fisheries of the Lumpfish (\emph{Cyclopterus lumpus})}, ' ...
'school = {State University of New York at Stony Brook}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/62}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
