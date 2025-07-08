function [data, auxData, metaData, txtData, weights] = mydata_Sepia_elegans
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Sepiida'; 
metaData.family     = 'Sepiidae';
metaData.species    = 'Sepia_elegans'; 
metaData.species_en = 'Elegant cuttlefish'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ni'; 'dLb'}; 
metaData.data_1     = {'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 29];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 29];

%% set data
% zero-variate data

data.tp = 365;     units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'JereSobr2015';   
  temp.tp = C2K(18);     units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 18*30.5;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'JereSobr2015';   
  temp.am = C2K(18);     units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp = 4.5;    units.Lp = 'cm';   label.Lp = 'mantle length at puberty';   bibkey.Lp = 'JereSobr2015';
data.Lpm = 3.5;    units.Lpm = 'cm';   label.Lpm = 'mantle length at puberty for  males';   bibkey.Lpm = 'JereSobr2015';
data.Li = 8.9;    units.Li = 'cm';   label.Li = 'mantle length at death';   bibkey.Li = 'JereSobr2015';
data.Lim = 7.5;    units.Lim = 'cm';   label.Lim = 'mantle length at death for male';   bibkey.Lim = 'JereSobr2015';

data.Wwb = 0.0645;    units.Wwb = 'g';   label.Wwb = 'weight at birth';   bibkey.Wwb = 'JereSobr2015';
  comment.Wwb = 'based on egg diameter of 5 mm: pi/6*0.5^3';
data.Wwi = 60;    units.Wwi = 'g';   label.Wwi = 'weight at death';   bibkey.Wwi = 'JereSobr2015';

data.Ni  = 57; units.Ni  = '#';   label.Ni  = 'cum reprod at Li ';     bibkey.Ni  = 'JereSobr2015';   
  temp.Ni = C2K(18);    units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'total fecundity in Gulf of Cadiz between 61 and 942 oocytes, but only part of them reach mature stage'; 

data.dLb = 0.3/30.5;    units.dLb = 'cm/d';   label.dLb = 'increase of mantle length at birth';   bibkey.dLb = 'JereSobr2015';
  temp.dLb = C2K(18);    units.temp.dLb = 'K'; label.temp.dLb = 'temperature';
  comment.dLb = 'data for Sicilian Channel';
data.dLbm = 0.28/30.5;    units.dLbm = 'cm/d';   label.dLbm = 'increase of mantle length at birth fro males';   bibkey.dLbm = 'JereSobr2015';
  temp.dLbm = C2K(18);    units.temp.dLbm = 'K'; label.temp.dLbm = 'temperature';
  comment.dLb = 'data for Sicilian Channel';

% uni-variate data

% length-weight
data.LWw_f = [ ... % mantle length (cm), wet weight (g)
2.383	2.812
2.636	2.860
2.924	4.194
2.936	3.551
3.097	4.738
3.212	4.291
3.316	5.083
3.420	5.676
3.523	6.220
3.604	7.061
3.695	7.951
3.811	8.248
3.834	7.208
3.834	6.861
3.926	8.593
4.018	8.593
4.018	7.949
4.110	9.978
4.122	9.037
4.122	8.889
4.145	8.889
4.191	9.284
4.214	9.928
4.306	9.234
4.340	9.927
4.375	11.164
4.398	10.867
4.398	9.531
4.433	9.530
4.502	10.668
4.513	11.906
4.513	11.708
4.514	9.332
4.593	12.004
4.605	11.608
4.617	11.014
4.641	8.984
4.730	16.261
4.731	13.786
4.732	12.053
4.732	11.805
4.790	11.211
4.812	13.686
4.812	13.488
4.812	12.894
4.813	10.666
4.824	12.052
4.836	10.121
4.904	13.289
4.916	12.448
4.916	11.854
4.927	14.279
4.938	16.507
4.996	13.784
5.018	17.447
5.030	14.922
5.088	14.823
5.111	16.011
5.111	15.120
5.169	15.565
5.216	13.040
5.249	15.564
5.284	15.762
5.317	18.534
5.318	16.306
5.331	14.029
5.388	15.563
5.388	15.464
5.422	17.593
5.422	16.008
5.502	17.840
5.560	16.849
5.607	14.918
5.698	19.422
5.698	18.284
5.789	21.204
5.801	19.768
5.893	20.906];
units.LWw_f   = {'cm', 'g'};  label.LWw_f = {'mantle length', 'wet weight', 'female'};  
bibkey.LWw_f = 'Salm2015';
comment.LWw_f = 'Data for females';
%
data.LWw_m = [ ... % mantle length (cm), wet weight (g)
1.910	1.578
2.199	1.526
2.394	3.109
2.602	2.860
2.694	3.156
2.752	3.354
2.775	3.354
2.878	3.848
3.015	7.214
3.086	4.540
3.189	5.183
3.212	4.440
3.270	5.034
3.362	5.627
3.489	5.676
3.489	4.735
3.524	5.230
3.581	6.318
3.581	5.328
3.696	6.417
3.708	6.120
3.777	6.713
3.834	6.713
3.880	6.910
3.903	8.049
3.903	6.712
3.984	8.296
3.995	7.999
4.007	7.405
4.007	7.207
4.007	6.910
4.018	8.692
4.088	7.602
4.110	9.681
4.133	8.443
4.168	8.839
4.191	8.542
4.226	8.294
4.284	8.046
4.295	8.541
4.375	9.927
4.398	9.332
4.398	9.085
4.399	8.837
4.479	10.372
4.491	8.540
4.491	8.045
4.502	9.332
4.594	10.371
4.594	9.826
4.605	11.757
4.686	10.964
4.778	10.963
4.789	12.350
4.790	9.924
4.801	11.706
4.881	13.834
4.893	11.408
4.905	12.250
5.008	12.298
5.088	14.427
5.398	18.979];
units.LWw_m   = {'cm', 'g'};  label.LWw_m = {'mantle length', 'wet weight', 'male'};  
bibkey.LWw_m = 'Salm2015';
comment.LWw_m = 'Data for males';

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
set1 = {'LWw_f','LWw_m'}; subtitle1 = {'Data for female, male'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed, based on preferred temp';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.bibkey.D2 = 'sealifebase'; 
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'semelparous: death at first spawning; no paralarval stage';
metaData.bibkey.F1 = 'JereSobr2015'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4WQHM'; % Cat of Life
metaData.links.id_ITIS = '82362'; % ITIS
metaData.links.id_EoL = '448835'; % Ency of Life
metaData.links.id_Wiki = 'Sepia_elegans'; % Wikipedia
metaData.links.id_ADW = 'Sepia_elegans'; % ADW
metaData.links.id_Taxo = '40202'; % Taxonomicon
metaData.links.id_WoRMS = '141443'; % WoRMS
metaData.links.id_molluscabase = '141443'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sepia_elegans}}';
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
bibkey = 'Salm2015'; type = 'article'; bib = [ ...
'doi = {10.4194/1303-2712-v15_2_08}, ' ...
'author = {Alp Salman}, ' ... 
'year = {2015}, ' ...
'title = {Reproductive Biology of the Elegant Cuttlefish (\emph{Sepia elegans}) in the {E}astern {M}editerranean}, ' ...
'journal = {Turkish Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {15}, ' ...
'pages = {267-274}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JereSobr2015'; type = 'incollection'; bib = [ ... 
'author = {Patrizia Jereb and Ignacio Sobrino and A. Louise Allcock and Sonia Seixas and Evgenia Lefkaditou}, ' ... 
'year = {2015}, ' ...
'title = {\emph{Sepia elegans}  {B}lainville, 1827}, ' ...
'booktitle = {Cephalopod biology and fisheries in Europe: II. Species Accounts}, ' ...
'editor = {Patrizia Jereb and A. Louise Allcock and Evgenia Lefkaditou and Uwe Piatkowski and Lee C. Hastie and Graham J. Pierce}, ' ...
'publisher = {ICES Cooperative Research Report}, ' ...
'number = {325}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Sepia-elegans.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

