function [data, auxData, metaData, txtData, weights] = mydata_Dipturus_innominatus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Dipturus_innominatus'; 
metaData.species_en = 'New Zealand smooth skate'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 25];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 1.4*365; units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(8.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 24*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'FranCaoi2001';   
  temp.am = C2K(8.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 21;   units.Lb  = 'cm';  label.Lb  = 'pelvic length at birth'; bibkey.Lb  = 'FranCaoi2001';
data.Lp  = 112;   units.Lp  = 'cm';  label.Lp  = 'pelvic length at puberty for females';   bibkey.Lp  = 'FranCaoi2001';
data.Lpm = 93;    units.Lpm  = 'cm';  label.Lpm  = 'pelvic length at puberty  for males';   bibkey.Lpm  = 'FranCaoi2001';
data.Li  = 150.5; units.Li  = 'cm';  label.Li  = 'ultimate pelvic length for females';   bibkey.Li  = 'FranCaoi2001';

data.Wwp = 29.59e3; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = 'FranCaoi2001';
  comment.Wwp = 'based on 0.024378*Lp^2.969, see F1';
data.Wwpm = 17e3; units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for females';   bibkey.Wwpm = 'FranCaoi2001';
  comment.Wwpm = 'based on 0.024378*Lpm^2.969, see F1';
data.Wwi = 71.14e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'FranCaoi2001';
  comment.Wwi = 'based on 0.024378*Li^2.969, see F1';

data.Ri  = 20/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(8.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kappa';

% uni-variate data at f
data.tL_f = [ ... % time since birth (yr), pelvic length (cm)
0.858	28.022
1.847	33.676
1.848	35.167
1.849	36.360
1.850	39.342
1.951	30.395
2.874	47.083
2.875	49.171
3.829	55.124
3.898	52.439
3.938	62.578
4.821	67.935
4.854	64.058
4.996	66.442
5.884	82.535
5.911	65.238
5.912	67.326
6.864	70.893
7.013	88.187
7.891	82.511
7.924	76.844
8.000	89.965
8.877	82.797
8.882	92.638
8.921	101.286
8.951	89.655
8.955	99.198
9.872	101.274
9.873	103.660
9.906	100.081
9.975	95.607
10.857	99.772
11.881	105.425
11.883	111.389
11.886	115.863
11.915	103.039
11.947	96.776
12.872	117.342
13.888	107.191
13.889	108.085
13.892	114.049
13.894	118.523
13.895	121.803
14.885	130.439
14.954	127.754
18.932	125.023
19.885	129.485
20.910	137.524
21.928	131.548
23.900	132.717];
data.tL_f(:,1) = 365 * (0.75 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'pelvic length', 'female'};  
temp.tL_f = C2K(8.2); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'FranCaoi2001';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), pelvic length (cm)
0.083	27.435
2.093	32.779
3.973	62.279
4.926	67.337
5.986	75.376
6.053	67.324
7.007	74.171
7.116	81.327
7.117	84.011
7.968	96.227
8.040	98.910
8.068	85.491
8.951	91.146
8.953	93.532
8.954	95.917
8.955	99.198
9.015	76.831
9.018	83.988
9.027	102.775
9.977	100.080
9.979	103.957
10.044	94.115
10.045	95.904
10.961	97.683
10.968	110.506
10.998	100.664
10.999	102.454
11.000	104.243
11.001	106.629
12.018	99.161
12.019	100.652
12.020	102.442
12.021	105.424
12.051	93.197
14.066	110.767
15.085	104.791];
data.tL_m(:,1) = 365 * (0.75 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'pelvic length', 'male'};  
temp.tL_m = C2K(8.2); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'FranCaoi2001';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 50 * weights.tL_f;
weights.tL_m = 50 * weights.tL_m;
weights.Wwp = 0 * weights.Wwp;
weights.Wwpm = 0 * weights.Wwpm;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.kap = 3 * weights.psd.kap;

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
D1 = 'males are assumed to differ from females by {p_Am} anf E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.024378*(PL in cm)^2.969';
metaData.bibkey.F1 = 'FranCaoi2001'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '36R3Q'; % Cat of Life
metaData.links.id_ITIS = '564180'; % ITIS
metaData.links.id_EoL = '46560487'; % Ency of Life
metaData.links.id_Wiki = 'Dipturus_innominatus'; % Wikipedia
metaData.links.id_ADW = 'Dipturus_innominatus'; % ADW
metaData.links.id_Taxo = '173274'; % Taxonomicon
metaData.links.id_WoRMS = '271549'; % WoRMS
metaData.links.id_fishbase = 'Dipturus-innominatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dipturus_innominatus}}'; 
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
bibkey = 'FranCaoi2001'; type = 'Article'; bib = [ ... 
'doi = {10.1080/00288330.2001.9517045}, ' ...
'author = {Malcolm P. Francis and Caoimhghin \''{O} Maolag\''{a}in and Darren Stevens}, ' ...
'year = {2001}, ' ...
'title  = {Age, growth, and sexual maturity of two {N}ew {Z}ealand endemic skates, \emph{Dipturus nasutus} and \emph{D. innominatus}}, ' ...
'journal = {New Zealand Journal of Marine and Freshwater Research}, ' ...
'volume = {35(4)}, ' ...
'pages = {831-842}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Dipturus-innominatus.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

