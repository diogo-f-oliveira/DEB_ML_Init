function [data, auxData, metaData, txtData, weights] = mydata_Oryzomys_palustris
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Oryzomys_palustris'; 
metaData.species_en = 'Marsh rice rat'; 

metaData.ecoCode.climate = {'Cfa','Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.2); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 13];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 25;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'Wiki';   
  temp.tg = C2K(36.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 15;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(36.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '11-20 d';
data.tp = 55;  units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'Wiki';
  temp.tp = C2K(36.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '50-60 d';
data.am = 365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(36.2); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'less than 1 yr';

data.Wwb = 3.5;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
  comment.Wwb = '3-4 g';
data.Wwi = 60;     units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '40-80 g';

data.Ri  = 6*5/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(36.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-7 pups per litter; 6 litters per yr';

% uni-variate data
% time-weight
data.tWw_f = [ ... % time since birth (mnth), weight (g)
0.645	27.721
0.827	27.241
0.956	31.862
1.916	50.953
2.804	55.520
3.677	52.073
4.717	52.228
5.476	68.693
6.449	63.156
7.113	70.749
8.099	69.450
8.923	74.293
10.035	71.939
10.573	83.139
11.768	84.172
12.082	90.301
13.721	83.079
14.572	85.181];
data.tWw_f(:,1) = 30.5 * data.tWw_f(:,1);
units.tWw_f = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f  = C2K(36.3);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'ParkNowo1974';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (mnth), weight (g)
0.033	4.712
0.066	5.398
0.098	6.152
0.135	7.982
0.164	10.266
0.198	7.684
0.226	11.039
0.257	12.066
0.290	11.405
0.355	16.858
0.425	20.413
0.455	13.840
0.489	17.208
0.514	21.850
0.546	24.375
0.577	17.804
0.593	23.933
0.651	22.008
0.702	30.029
1.003	33.332
1.885	68.937
2.777	60.387
3.637	108.768
4.626	89.463
5.508	82.231
6.230	93.202
7.364	96.337
8.213	102.024
9.078	114.270
9.649	118.487
10.595	115.504
11.561	97.926
12.227	118.010
12.852	123.710
14.461	122.413];
data.tWw_m(:,1) = 30.5 * data.tWw_m(:,1);
units.tWw_m = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m  = C2K(36.3);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'ParkNowo1974';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 5 * weights.tWw_f;
weights.tWw_m = 5 * weights.tWw_m;

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
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '6SYYN'; % Cat of Life
metaData.links.id_ITIS = '180336'; % ITIS
metaData.links.id_EoL = '328431'; % Ency of Life
metaData.links.id_Wiki = 'Oryzomys_palustris'; % Wikipedia
metaData.links.id_ADW = 'Oryzomys_palustris'; % ADW
metaData.links.id_Taxo = '62355'; % Taxonomicon
metaData.links.id_WoRMS = '1451676'; % WoRMS
metaData.links.id_MSW3 = '13000814'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Oryzomys_palustris}}';
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
bibkey = 'ParkNowo1974'; type = 'Article'; bib = [ ...  
'doi = {10.1111/j.1439-0264.1974.tb00766.x}, ' ...
'author = {Park, A. W. and Nowosielski-Slepowron, B. J. A.}, ' ...
'year = {1974}, ' ...
'title  = {Biology of the Rice Rat (\emph{Oryzomys palustris natator}) in a Laboratory Environment}, ' ...
'journal = {Anatomia, Histologia, Embryologia: Journal of Veterinary Medicine Series C}, ' ...
'volume = {3(4)}, ' ...
'pages = {364–370}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

