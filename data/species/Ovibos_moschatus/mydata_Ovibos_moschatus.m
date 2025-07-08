function [data, auxData, metaData, txtData, weights] = mydata_Ovibos_moschatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Bovidae';
metaData.species    = 'Ovibos_moschatus'; 
metaData.species_en = 'Muskox'; 

metaData.ecoCode.climate = {'ET'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTd', '0iTht'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.7); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx';  'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm   = [2016 12 29];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2017 11 20];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};  

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 04 13];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data

data.tg = 258;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(37.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 140;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'PeltBarb2003';   
  temp.tx = C2K(37.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1096;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1278;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37.7);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 24.7*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(37.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am =  'life span between 15 and 25 yr ';
  
data.Wwb = 11460;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 49000;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning female';   bibkey.Wwx = 'PeltBarb2003';
data.Wwxm = 54000;  units.Wwxm = 'g';  label.Wwxm = 'wet weight at weaning male';   bibkey.Wwxm = 'PeltBarb2003';
data.Wwi = 210e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Based on length-correct male max weight';
data.Wwim = 300e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'Wiki';
  
data.Ri  = 0.8/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = {'AnAge'};   
  temp.Ri = C2K(37.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 calf per litter, 0.8 litters per yr';

% uni-variate data
% time-weight
data.tW_f = [ % time since birth (d), weight (kg)
138.466	49.112
258.324	68.021
265.268	68.686
350.354	79.311
359.010	77.994
442.463	97.875
451.201	104.160
497.230	111.128
505.030	110.802
624.802	121.777
631.739	121.781
667.346	127.089]; 
data.tW_f(:,2) = data.tW_f(:,2) * 1e3; % convert kg to g
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'total weight', 'female'};  
temp.tW_f  = C2K(37.7);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'PeltBarb2003';
comment.tW_f = 'Data for females';
% 
data.tW_m = [ ... % time since birth (d), weight (kg)
139.387	54.071
256.669	75.293
265.357	76.951
351.361	92.205
359.150	90.887
441.760	113.081
452.219	118.045
499.180	130.964
507.005	132.952
623.305	143.594
631.968	142.938
665.844	148.576]; 
data.tW_m(:,2) = data.tW_m(:,2) * 1e3; % convert kg to g
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'total weight', 'male'};  
temp.tW_m  = C2K(37.7);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'PeltBarb2003';

data.tW = [ ... % time since birth (yr), weight (kg)
0.015	12.699
0.214	52.014
0.226	32.366
0.238	36.577
0.251	46.403
0.499	33.087
0.511	35.193
0.512	43.614
0.512	49.228
0.736	73.104
0.748	54.859
0.748	60.473
0.748	66.789
0.946	66.101
0.971	69.611
0.984	84.349
0.984	90.665
1.171	88.573
1.208	91.382
1.233	99.805
1.246	116.648
1.246	119.455
1.470	136.313
1.493	99.122
1.494	106.841
1.494	120.876
1.494	131.403
1.730	118.086
1.730	138.437
1.731	147.559
1.731	155.980
1.965	116.699
1.979	167.226
1.990	125.122
2.016	149.685
2.191	187.592
2.215	156.014
2.228	191.805
2.240	172.858
2.252	149.701
2.464	179.892
2.464	191.821
2.465	207.260
2.465	212.172
2.500	163.754
2.726	222.717
2.736	175.700
2.737	196.051
2.737	203.069
2.738	211.490
2.936	215.012
2.973	195.366
2.973	204.489
2.985	179.928
3.209	221.347
3.210	240.997
3.233	192.577
3.234	215.735
3.432	207.328
3.446	245.925
3.470	233.997
3.483	259.261
3.495	223.473
3.706	248.049
3.718	223.488
3.718	231.208
3.719	237.523
3.941	223.504
3.942	229.118
3.942	243.153
3.942	250.171
4.190	237.557
4.190	243.171
4.191	264.223
4.203	251.593
4.277	245.984
4.414	257.221
4.427	282.485
4.439	251.609
4.464	271.962
4.476	262.138
4.687	251.626
4.687	271.276
4.688	281.802
4.724	265.664
4.923	262.871
4.923	270.590
4.959	226.382
5.072	262.882
5.135	297.974
5.171	264.292
5.182	220.784
5.209	274.119
5.408	295.186
5.432	288.170
5.456	253.084
5.507	298.702
5.643	291.694
5.681	297.310
5.717	252.401
5.916	293.116
5.940	259.434
5.940	264.346
5.941	276.276
6.065	285.407
6.164	268.572
6.164	281.906
6.214	305.769
6.215	313.488
6.437	290.346
6.438	299.469
6.438	314.907
6.661	307.905
6.723	295.278
6.921	277.046
6.934	296.696
7.033	290.388
7.145	295.308
7.182	285.486
7.195	304.434
7.380	290.412
7.406	310.765
7.492	304.455
7.591	297.444
7.654	313.589
7.790	300.967
7.889	293.956
7.902	309.396
8.026	299.580
8.113	309.411
8.136	267.307
8.385	293.991
8.659	301.730
8.870	313.674
8.882	299.640
9.080	303.163
9.192	298.258
9.986	287.788
9.986	298.314];
data.tW(:,1) = data.tW(:,1) * 365; % convert yr to d
data.tW(:,2) = data.tW(:,2) * 1e3; % convert kg to g
n=size(data.tW,1); for i=2:n; if data.tW(i,1)<=data.tW(i-1,1); data.tW(i,1)=data.tW(i-1,1)+1e-3; end; end
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'total weight'};  
temp.tW  = C2K(37.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'KnotBarb2005';
subtitle.tW = 'In view of max weight, assumed to be males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1; weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
txtData.subtitle = subtitle;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Slow foetal development is assumend';
D2 = 'Males are assumend to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '4B9SQ'; % Cat of Life
metaData.links.id_ITIS = '180708'; % ITIS
metaData.links.id_EoL = '328656'; % Ency of Life
metaData.links.id_Wiki = 'Ovibos_moschatus'; % Wikipedia
metaData.links.id_ADW = 'Ovibos_moschatus'; % ADW
metaData.links.id_Taxo = '68543'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200813'; % MSW3
metaData.links.id_AnAge = 'Ovibos_moschatus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ovibos_moschatus}}';
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
bibkey = 'PeltBarb2003'; type = 'Article'; bib = [ ... 
'author = {T. C. Peltier and P. S. Barboza}, ' ... 
'year = {2003}, ' ...
'title = {Growth in an Arctic Grazer: Effects of Sex and Dietary Nitrogen on Yearling Muskoxen}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {84}, ' ...
'pages = {915--925}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Ovibos_moschatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Ovibos_moschatus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KnotBarb2005'; type = 'Article'; bib = [ ... 
'author = {K. K. Knott and P. S. Barboza and R. T. Bowyer}, ' ... 
'year = {2005}, ' ...
'title = {GROWTH IN ARCTIC UNGULATES: POSTNATAL DEVELOPMENT AND ORGAN MATURATION IN \emph{Rangifer tarandus} AND \emph{Ovibos moschatus}}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {86}, ' ...
'pages = {121-130}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

