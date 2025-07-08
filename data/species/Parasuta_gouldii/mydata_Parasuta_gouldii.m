  function [data, auxData, metaData, txtData, weights] = mydata_Parasuta_gouldii
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Elapidae';
metaData.species    = 'Parasuta_gouldii'; 
metaData.species_en = 'Gould''s hooded snake'; 

metaData.ecoCode.climate = {'BWh', 'BWk', 'BSh', 'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'biTf', 'biTh', 'biTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data
data.am = 10*365;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'guess';
  temp.am = C2K(28.5); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lb = 13;      units.Lb = 'cm';     label.Lb = 'SVL at birth';  bibkey.Lb = 'Shin1978';
data.Lp = 25;     units.Lp = 'cm';     label.Lp = 'SVLat puberty for females'; bibkey.Lp = 'Shin1978'; 
data.Lpm = 24;     units.Lpm = 'cm';     label.Lpm = 'SVL at puberty for males'; bibkey.Lpm = 'Shin1978'; 
data.Li = 40;     units.Li = 'cm';     label.Li = 'ultimate SVL for females';  bibkey.Li = 'Shin1978';
data.Lim = 46;     units.Lim = 'cm';     label.Lim = 'ultimate SVL for males';  bibkey.Lim = 'Shin1978';

data.Wwb = 3.5;   units.Wwb = 'g';     label.Wwb = 'weight at birth';  bibkey.Wwb = 'Shin1988';
data.Wwi = 89.6;  units.Wwi = 'g';     label.Wwi = 'ultimate weight for females';  bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-corrected value for Notechis_scutatus: 1400*(40/100)^3';
   
% univariate data
% time - length
data.tL_f = [ ... % time since Sept 1 (d), snout-vent length (cm)
181.563	13.174
219.324	13.115
227.372	9.448
228.717	17.331
229.155	11.176
254.787	14.213
256.137	22.288
256.745	23.441
256.785	25.171
257.665	13.054
257.697	14.401
258.304	15.553
258.389	19.207
261.178	14.203
263.533	15.545
365+3.338	18.648
365+13.871	21.900
365+16.816	23.626
365+21.200	12.273
365+21.843	14.965
365+30.642	18.605
365+40.084	24.936
365+45.210	20.505
365+49.384	25.114
365+49.683	12.998
365+59.715	19.713
365+64.877	16.820
365+65.055	24.512
365+65.413	14.896
365+66.061	17.780
365+70.136	18.158
365+74.180	17.190
365+74.319	23.151
365+75.369	18.342
365+81.902	24.485
365+142.234	20.736
365+166.660	21.852
365+201.583	24.681
365+257.312	22.863
365+257.335	23.824
365+257.357	24.786
730+18.666	28.239
730+19.323	31.507
730+20.525	33.236
730+27.076	40.149
730+31.518	31.296
730+44.906	32.428
730+46.693	34.349
730+51.815	29.725
730+52.436	31.455
730+57.678	32.024
730+62.964	34.515
730+64.068	32.013
730+68.639	28.737
730+68.693	31.045
730+72.724	29.500
730+75.660	30.841
730+101.136	27.147
730+136.134	33.246
730+139.008	31.895
730+164.998	25.316
730+169.690	27.232
730+180.804	30.483
730+190.031	27.584
730+203.867	22.947
730+204.564	27.946
730+210.395	28.898
730+211.048	31.974
730+226.585	25.603
730+227.497	39.833
730+227.801	27.909
730+237.619	25.394
730+237.730	30.201
730+250.399	25.374
730+253.447	31.523
730+256.271	28.057
730+259.761	28.243
730+260.945	29.203
730+260.990	31.126];
data.tL_f(:,1) = data.tL_f(:,1) - 181; % set origin at birth
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'snout-vent length', 'female'};  
temp.tL_f   = C2K(28.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Shin1978';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), snout-vent length (cm)
365+192.152	25.885
365+199.792	28.921
365+215.939	26.593
365+253.662	28.031
365+258.351	29.546
730+13.871	32.410
730+19.405	41.558
730+19.819	36.786
730+39.288	46.664
730+42.788	30.625
730+52.746	33.655
730+55.170	36.703
730+66.247	38.585
730+69.618	35.524
730+71.857	33.228
730+105.016	36.776
730+168.343	41.208
730+175.351	42.718
730+179.188	36.412
730+202.701	45.898
730+205.032	46.275
730+214.440	33.466
730+233.369	44.491
730+236.614	37.804
730+237.840	39.709
730+237.939	42.571
730+256.964	39.664
730+257.597	41.189
730+258.636	37.752
730+259.103	34.507
730+259.156	36.033
730+259.629	32.979];
data.tL_m(:,1) = data.tL_m(:,1) - 181; % set origin at birth
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'snout-vent length', 'male'};  
temp.tL_m   = C2K(28.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Shin1978';
comment.tL_m = 'Data for males';

% length - fecundity
data.LN = [ ... % SVL (cm), fecundity (#)
27.297	3.708
27.604	3.208
27.649	3.000
28.345	3.250
29.955	3.542
32.133	3.667
36.180	4.750
37.701	5.500
42.133	7.708];
units.LN  = {'cm','#'};  label.LN = {'snout-vent length','fecundity'};  
temp.LN   = C2K(28.5);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Shin1988';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.LN = 3 * weights.LN;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '897FX'; % Cat of Life
metaData.links.id_ITIS = '1057630'; % ITIS
metaData.links.id_EoL = '790504'; % Ency of Life
metaData.links.id_Wiki = 'Suta_gouldii'; % Wikipedia
metaData.links.id_ADW = 'Suta_gouldii'; % ADW
metaData.links.id_Taxo = '4613230'; % Taxonomicon
metaData.links.id_ReptileDB = 'genus=Suta&species=gouldii'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Suta_gouldii}}';
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
bibkey = 'Shin1978'; type = 'Article'; bib = [ ...  
'author = {Richard Shine}, ' ...
'year = {1978}, ' ...
'title = {Growth Rates and Sexual Maturation in Six Species of {A}ustralian {E}lapid Snakes}, ' ... 
'journal = {Herpetologica}, ' ...
'volume = {34(1)}, '...
'pages = {73-79}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'Shin1988'; type = 'Article'; bib = [ ...  
'author = {Richard Shine}, ' ...
'year = {1988}, ' ...
'title = {Food Habits and Reproductive Biology of Small {A}ustralian Snakes of the Genera \emph{Unechis} and \emph{Suta} ({E}lapidae)}, ' ... 
'journal = {Journal of Herpetology}, ' ...
'volume = {22(3)}, '...
'pages = {307-315}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 


