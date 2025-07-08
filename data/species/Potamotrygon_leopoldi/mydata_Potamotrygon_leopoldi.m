function [data, auxData, metaData, txtData, weights] = mydata_Potamotrygon_leopoldi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Potamotrygonidae';
metaData.species    = 'Potamotrygon_leopoldi'; 
metaData.species_en = 'Xingu River ray'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 26];                          
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
data.ab = 5.5*30.5;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'CharSant2018';    
  temp.ab = C2K(26.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 14*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'CharSant2018';   
  temp.am = C2K(26.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 14;   units.Lb  = 'cm';  label.Lb  = 'disc width at birth';   bibkey.Lb  = 'CharSant2018';
data.Lp = 44.5;   units.Lp  = 'cm';  label.Lp  = 'disc width at puberty'; bibkey.Lp  = 'CharSant2018';
  comment.Lp = '43-46 cm';
data.Lpm = 35.5;   units.Lpm  = 'cm';  label.Lpm  = 'disc width at puberty for males'; bibkey.Lpm  = 'CharSant2018'; 
  comment.Lp = '34-37 cm';
data.Li  = 111;  units.Li  = 'cm';  label.Li  = 'ultimate disc width';   bibkey.Li  = 'fishbase'; 

data.Wwi  = 20e3;  units.Wwi  = 'g';  label.Wwi  = 'wet weight at disc width  75 cm';   bibkey.Wwi  = 'Wiki'; 

data.Ri  = 7/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(26.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 pups per litter, 1 litter per yr';
  
% univariate data
% time - length
data.tL_f = [ ... % time since birth (yr), disc width (cm)
0.098	14.883
1.108	22.512
1.287	25.349
2.020	28.900
2.086	26.244
2.232	26.422
3.031	34.581
3.096	36.885
3.145	33.165
4.041	40.084
4.155	44.692
4.220	43.275
5.149	49.132
5.181	45.589
5.312	43.819
5.458	48.249
6.012	45.244
6.061	56.229
6.110	42.233
6.143	53.218
6.224	50.384
6.273	48.790
6.436	50.209
6.501	49.147
6.648	50.034
6.664	51.275
7.022	51.101
7.039	52.165
7.071	48.267
7.088	55.177
7.136	54.646
7.218	56.419
7.251	55.533
8.016	52.530
8.033	57.491
8.081	59.617
8.081	57.137
8.081	51.290
8.130	49.696
8.147	54.834
8.147	53.417
8.179	58.201
8.261	62.808
8.310	56.253
8.326	53.242
8.456	46.511
8.489	59.444
8.538	55.370
8.619	48.284
9.075	63.349
9.108	54.313
9.173	62.464
9.271	53.607
9.450	61.758
9.466	60.164
9.564	54.496
10.069	58.222
10.265	54.503
10.297	58.756
10.395	63.540
10.444	50.785
10.444	57.872
10.444	58.757
10.607	58.228
11.454	68.867
11.470	58.060
12.464	59.488
12.481	64.981
14.289	70.493];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f  = {'d','cm'}; label.tL_f  = {'time since birth','disc width','female'}; 
temp.tL_f = C2K(26.7); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'CharSant2018';  
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
0.065	10.453
0.212	13.290
0.244	11.696
0.407	15.064
0.684	16.661
1.255	24.994
1.303	19.680
1.466	23.048
2.037	23.940
2.086	29.964
2.151	27.839
2.265	23.765
2.281	29.258
3.063	30.152
3.177	35.645
3.226	31.748
3.487	36.889
3.487	35.117
4.057	40.793
4.106	31.227
4.155	37.428
4.171	38.845
4.285	41.327
4.301	36.012
4.448	38.494
4.464	34.951
4.530	42.216
4.709	40.800
5.067	40.095
5.100	38.679
5.165	41.691
5.198	44.526
5.230	40.452
5.279	42.578
5.279	39.212
5.344	40.453
5.442	38.151
5.507	47.541
5.507	42.403
5.589	39.215
5.637	41.519
6.159	46.308
6.257	43.829
6.273	40.995
6.387	47.374
6.452	41.528
6.485	45.249
6.566	42.947
6.648	46.668
6.664	39.936
7.071	42.066
7.136	45.079
7.251	46.143
7.299	40.120
7.299	48.447
7.462	47.740
7.495	44.729
8.391	49.168
8.505	50.586
8.652	49.525];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m  = {'d','cm'}; label.tL_m  = {'time since birth','disc width','male'}; 
temp.tL_m = C2K(26.7); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'CharSant2018';  
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;

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
D1 = 'The cost for milk secretion is added to the investment from the reproduction buffer.';
D2 = 'Males are supposed to differ from females by {p_Am} and E_Hp only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'At first, they are enclosed in an egg case while the developing embryos feed on the yolk. After the egg hatches, the pup remains in the oviduct and receives nourishment from a milky secretion';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4M4R4'; % Cat of Life
metaData.links.id_ITIS = '943764'; % ITIS
metaData.links.id_EoL = '994178'; % Ency of Life
metaData.links.id_Wiki = 'Potamotrygon_leopoldi'; % Wikipedia
metaData.links.id_ADW = 'Potamotrygon_leopoldi'; % ADW
metaData.links.id_Taxo = '184646'; % Taxonomicon
metaData.links.id_WoRMS = '1011768'; % WoRMS
metaData.links.id_fishbase = 'Potamotrygon-leopoldi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Potamotrygon_leopoldi}}';   
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
'howpublished = {\url{https://www.fishbase.se/summary/Potamotrygon-leopoldi}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CharSant2018'; type = 'article'; bib = [ ...  
'doi = {10.1111/jfb.13635}, ' ...
'author = {P. Charvet and F. M. Santana and K. L. De Lima and R. Lessa}, ' ...
'title = {Age and growth of the endemic {X}ingu {R}iver stingray \emph{Potamotrygon leopoldi} validated using fluorescent dyes}, ' ...
'year = {2018}, ' ...
'journal = {Journal of Fish Biology}, '...
'volume = {92}, ' ...
'pages = {1985-1999}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

