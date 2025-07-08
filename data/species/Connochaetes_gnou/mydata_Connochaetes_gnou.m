function [data, auxData, metaData, txtData, weights] = mydata_Connochaetes_gnou

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Bovidae';
metaData.species    = 'Connochaetes_gnou'; 
metaData.species_en = 'Black wildebeest'; 

metaData.ecoCode.climate = {'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTs', '0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.0); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 259;  units.tg = 'd';    label.tg = 'gestation time for female calves';    bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.0);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 228;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.0);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2*365;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'EoL';
  temp.tp = C2K(38.0);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 3*365; units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'EoL';
  temp.tpm = C2K(38.0);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 21.8*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(38.0);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 12e3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';      bibkey.Wwb = 'DobVaha1990';
data.Wwi = 116e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'Wiki';
  comment.Wwi = '110 till 122 kg';
data.Wwim = 150e3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'Wiki';
  comment.Wwim = '140 till 157 kg';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.0); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (mnth), wet weight (kg)
0.064	13.442
0.067	14.551
0.094	13.667
0.094	12.338
0.121	15.776
0.242	16.454
0.510	21.026
0.536	19.257
0.563	24.135
1.003	24.959
1.012	23.298
1.014	26.733
1.015	22.966
1.151	26.416
2.246	46.814
2.419	46.681
3.129	50.511
4.262	75.277
6.894	79.362
7.923	100.809
8.913	76.298
9.328	88.809
10.231	81.149
11.158	102.085
11.272	117.149
11.347	85.489
12.366	95.702
12.973	96.213
17.225	103.872
17.638	114.596
18.229	96.468
20.677	122.000
21.580	114.085
22.696	119.191
23.516	132.723
23.697	107.702
23.904	112.553
28.459	119.957
30.278	119.957
35.743	127.617];
data.tW_f(:,1) = data.tW_f(:,1) * 30.5; % convert mnth to d
data.tW_f(:,2) = data.tW_f(:,2) * 1e3; % convert kg to g
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(38.0);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'DobVaha1990';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (mnth), wet weight (g)
0.069	12.420
0.069	14.968
0.069	16.667
0.078	12.314
0.078	14.331
0.100	16.454
0.356	21.656
0.403	23.992
0.419	14.331
0.439	16.667
0.722	25.478
0.744	24.735
0.744	27.813
0.994	23.779
1.000	27.707
1.075	30.042
1.200	24.416
1.519	27.813
1.775	34.289
1.989	35.244
2.000	33.652
2.003	45.648
2.089	37.686
4.049	51.294
4.059	57.422
6.802	71.744
6.817	80.936
8.961	98.572
9.776	103.941
13.513	110.867
14.326	114.959
18.268	124.186
20.082	124.712
20.379	121.906
21.208	136.211
22.213	134.944
24.225	133.429
24.343	144.154
36.060	165.449
36.423	141.707
36.426	144.005
41.684	156.817
42.482	152.228
42.815	170.870
47.728	157.892
48.215	148.449
54.268	155.141
60.101	150.852];
data.tW_m(:,1) = data.tW_m(:,1) * 30.5; % convert yr to d
data.tW_m(:,2) = data.tW_m(:,2) * 1e3; % convert kg to g
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(38.0);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'DobVaha1990';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 5 * weights.tW_f;
weights.tW_m = 5 * weights.tW_m;
weights.Wwi = 5 * weights.Wwi;
weights.Wwim = 5 * weights.Wwim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females and males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Slow foetal development is assumed';     
D3 = 'Body temperature is gussed';     
D4 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = 'XPLN'; % Cat of Life
metaData.links.id_ITIS = '898253'; % ITIS
metaData.links.id_EoL = '308530'; % Ency of Life
metaData.links.id_Wiki = 'Connochaetes_gnou'; % Wikipedia
metaData.links.id_ADW = 'Connochaetes_gnou'; % ADW
metaData.links.id_Taxo = '68363'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200509'; % MSW3
metaData.links.id_AnAge = 'Connochaetes_gnou'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Connochaetes_gnou}}';
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
bibkey = 'DobVaha1990'; type = 'Article'; bib = [ ... 
'author = {L. J. Dobroruka and J. Vahala and J. Ded}, ' ... 
'year = {1990}, ' ...
'title = {Breeding and development of white-tailed gnu \emph{Connochaetes gnou} at {Dvur Kralove Zoo})}, ' ...
'journal = {Int. Zoo Yb}, ' ...
'volume = {29}, ' ...
'pages = {197--201}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Connochaetes_gnou}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/308530/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


