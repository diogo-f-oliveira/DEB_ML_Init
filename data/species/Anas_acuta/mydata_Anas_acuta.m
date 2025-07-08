function [data, auxData, metaData, txtData, weights] = mydata_Anas_acuta
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Anseriformes'; 
metaData.family     = 'Anatidae';
metaData.species    = 'Anas_acuta'; 
metaData.species_en = 'Northern pintail'; 

metaData.ecoCode.climate = {'Cfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'biFp', 'biFm', 'biMm'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCi', 'xiHl', 'xiHr'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.2); % K
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm   = [2018 09 24];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 24];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 24];

%% set data
% zero-variate data

data.ab = 23;   units.ab = 'd';      label.ab = 'age at birth';                    bibkey.ab = 'Wiki';   
  temp.ab = C2K(34);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '22 till 24 d';
data.tx = 46;   units.tx = 'd';      label.tx = 'time since birth at fledging';   bibkey.tx = 'Wiki';   
  temp.tx = C2K(41.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 70;   units.tp = 'd';      label.tp = 'time since birth at puberty';   bibkey.tp = 'guess';   
  temp.tp = C2K(41.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on the upper boundary of a good fit with tW data';
data.tR = 365;    units.tR = 'd';  label.tR = 'time since birth at 1st brood';   bibkey.tR = 'Wiki';
  temp.tR = C2K(41.2);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 27.4 * 365;  units.am = 'd'; label.am = 'life span';                       bibkey.am = 'AnAge';   
  temp.am = C2K(41.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 25;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'BlaiGuil2001';
data.Wwi = 680; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'BlaiGuil2001';
data.Wwim = 730; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'BlaiGuil2001';

data.Ri  = 8/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';          bibkey.Ri  = 'Wiki';   
 temp.Ri = C2K(41.2);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 comment.Ri = '1 clutch per yr, 7 to 9 eggs per clutch';

% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (g)
0.156	25.543
2.140	41.231
4.292	70.672
5.895	104.052
8.031	149.214
9.976	204.203
12.102	259.191
16.184	357.377
17.556	439.887
17.945	414.335
19.712	465.398
19.860	498.801
21.160	471.269
21.498	496.810
23.660	516.425
23.702	475.158
25.848	510.494
28.022	518.318
29.437	557.597
31.419	575.250
34.476	608.606
37.917	622.305
40.636	630.121
43.861	677.229
46.253	649.679
49.682	675.169
52.627	639.750
55.556	620.051
58.269	633.762
61.524	651.394
64.591	674.925
67.324	668.985
70.583	682.687
73.710	647.265
76.609	657.042
79.518	656.995
82.597	668.735
85.317	676.551
88.236	666.677
91.107	703.967
94.026	694.093
97.307	686.179
116.194	707.486];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(41.2);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'BlaiGuil2001';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), weight (g)
0.701	25.534
2.324	39.263
3.755	62.821
6.261	102.081
8.209	153.141
9.970	210.099
11.918	261.159
13.101	349.567
17.562	433.992
19.674	502.735
19.704	473.258
22.929	520.367
26.174	547.825
27.621	555.661
29.391	602.794
31.549	626.339
34.555	710.788
35.624	732.386
38.725	722.510
40.907	722.474
43.810	728.322
46.525	740.068
50.142	759.659
53.278	714.411
55.500	675.074
55.828	710.440
58.385	698.607
61.446	728.033
64.523	741.738
67.816	722.034
70.512	753.430
73.834	704.249
77.283	710.088
79.476	698.262
82.364	719.830
85.633	723.707
88.718	729.552
91.785	753.082
94.718	729.453
97.836	701.891
116.346	736.959];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(41.2);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'BlaiGuil2001';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m = weights.tW_m * 3;
weights.tW_f = weights.tW_f * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; weights.psd.t_0 = 0;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);  

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = 'DGMX'; % Cat of Life
metaData.links.id_ITIS = '175074'; % ITIS
metaData.links.id_EoL = '45510569'; % Ency of Life
metaData.links.id_Wiki = 'Anas_acuta'; % Wikipedia
metaData.links.id_ADW = 'Anas_acuta'; % ADW
metaData.links.id_Taxo = '52128'; % Taxonomicon
metaData.links.id_WoRMS = '158939'; % WoRMS
metaData.links.id_avibase = '56CCA7179C9FA71D'; % avibase
metaData.links.id_birdlife = 'northern-pintail-anas-acuta'; % birdlife
metaData.links.id_AnAge = 'Anas_acuta'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anas_acuta}}';
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
bibkey = 'BlaiGuil2001'; type = 'Article'; bib = [ ... 
'author = {S.  Blais and M. Guillemain and D. Durant and H. Fritz and N. Guillon}, ' ... 
'year = {2001}, ' ...
'title = {Growth and plumage development of Pintail ducklings}, ' ...
'journal = {Wildfowl}, ' ...
'volume = {52}, ' ...
'pages = {69-86}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Anas_acuta}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

