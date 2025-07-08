function [data, auxData, metaData, txtData, weights] = mydata_Lissodelphis_borealis
%% set metadata 
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Delphinidae';
metaData.species    = 'Lissodelphis_borealis'; 
metaData.species_en = 'Northern right whale dolphin';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.9); % K, body temperature
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                            
metaData.date_subm = [2018 07 16];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV, Netherlands'};    

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data
data.tg = 12.2*30.5;    units.tg = 'd';  label.tg = 'gestation time';              bibkey.tg = 'FerrWalk1993';    
  temp.tg = C2K(36.9);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 365; units.tx = 'd';  label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';    
  temp.tx = C2K(36.9); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'guess based on Delphinus';
data.tp = 10 * 365; units.tp = 'd'; label.tp = 'time since birth at puberty for female'; bibkey.tp = 'FerrWalk1993';
  temp.tp = C2K(36.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 9.8 * 365; units.tpm = 'd'; label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'FerrWalk1993';
  temp.tpm = C2K(36.9);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 45 * 365;  units.am = 'd';  label.am = 'life span';                   bibkey.am = 'FerrWalk1993';   
  temp.am = C2K(36.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 100;        units.Lb = 'cm'; label.Lb = 'total length at birth';                bibkey.Lb = 'FerrWalk1993';
data.Lp = 201;       units.Lp = 'cm'; label.Lp = 'total length at puberty for female';    bibkey.Lp = 'FerrWalk1993';
data.Lpm = 214.5;       units.Lpm = 'cm'; label.Lpm = 'total length at puberty for male';   bibkey.Lpm = 'FerrWalk1993';
data.Li = 219;       units.Li = 'cm'; label.Li = 'ultimate total length for female';      bibkey.Li = 'EoL';
data.Lim = 280;       units.Lim = 'cm'; label.Lim = 'ultimate total length for male';     bibkey.Lim = 'EoL';

data.Wwb = 5.2e3;     units.Wwb = 'g'; label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on (Lb/Lim)^3*Wwim';
data.Wwim = 115e3;   units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';        bibkey.Wwim = 'ADW';

data.Ri = 0.5/365;    units.Ri = '#/d';label.Ri = 'maximum reprod rate';         bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(36.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), length (cm)
0.065	102.268
0.064	100.909
0.063	97.511
0.011	115.521
0.007	106.347
0.051	108.047
0.174	98.875
0.289	106.353
0.972	172.291
0.980	151.563
0.982	147.486
1.037	158.700
1.212	164.141
1.213	162.442
1.336	151.571
1.446	171.622
1.508	163.468
1.622	174.345
1.628	160.753
1.982	164.499
2.382	196.789
2.855	198.499
2.916	194.762
2.993	152.968
3.443	209.726
3.511	187.980
3.632	182.885
3.749	185.607
3.865	190.027
4.287	174.405
4.460	183.924
4.516	190.721
4.986	199.906
5.461	197.199
5.868	215.218
5.876	196.868
5.932	203.666
5.933	201.627
6.467	198.241
6.520	212.854
6.522	208.436
6.635	221.012
6.991	220.680
7.117	202.333
7.120	195.198
7.765	210.503
7.826	204.388
7.831	194.874
8.001	212.548
8.072	185.025
8.481	196.927
8.598	201.008
8.889	212.568
8.890	209.509
8.956	193.880
9.013	198.978
9.479	216.659
9.836	212.589
9.837	209.531
9.839	206.473
9.840	203.754
10.025	186.089
10.425	220.758
10.492	203.089
10.492	201.390
10.788	202.756
10.903	210.235
10.905	205.817
10.907	200.380
11.028	193.587
11.556	205.492
11.853	204.140
12.324	210.607
12.569	191.583
12.854	218.094
12.854	216.395
12.855	214.696
12.917	207.222
12.974	212.660
13.403	179.709
13.445	220.826
13.450	207.914
13.862	213.020
13.978	219.139
13.980	215.401
14.334	217.448
14.453	216.092
14.455	212.694
14.521	196.724
14.865	221.878
14.876	196.053
14.929	211.345
15.818	208.647
15.874	215.784
15.875	213.745
15.992	218.165
16.240	190.987
16.291	211.376
16.353	203.222
16.820	219.883
16.821	217.165
16.825	207.650
17.410	224.994
17.766	222.623
17.770	213.788
17.946	216.511
18.481	211.766
18.482	210.067
18.598	215.846
19.900	217.574
19.900	216.215
19.901	213.837
19.956	224.032
20.791	211.478
21.325	208.772
21.977	205.728
23.930	209.510
24.992	217.350
26.826	220.110
26.951	205.161
27.368	199.054
27.656	219.449
27.953	216.058
30.971	220.204
33.160	223.991
41.452	218.063];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'length', 'female'};  
temp.tL_f  = C2K(36.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'FerrWalk1993';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), length (cm)
0.113	122.930
0.115	111.656
0.237	97.940
0.311	125.888
0.395	104.326
0.982	146.531
1.057	168.596
1.255	172.533
1.296	165.674
1.337	160.775
1.453	176.961
1.453	175.000
1.454	170.099
1.490	190.690
1.774	162.772
1.775	157.870
1.810	179.932
1.811	174.540
2.010	174.066
2.087	185.837
2.370	161.350
2.524	184.402
2.607	170.683
2.645	174.608
3.002	180.519
3.080	188.369
3.081	184.447
3.478	185.950
3.554	200.172
3.596	190.372
3.599	177.137
3.912	200.201
4.110	203.649
4.114	181.100
4.152	193.848
4.152	191.397
4.153	186.986
4.192	189.930
4.233	184.051
4.588	198.296
4.984	203.720
5.023	208.135
5.027	189.508
5.582	194.455
6.096	208.223
6.530	223.454
6.578	183.262
6.615	194.540
7.129	208.307
7.131	197.033
7.527	205.889
7.762	220.124
8.122	209.859
8.124	199.075
8.322	203.503
8.360	212.329
9.513	208.012
10.068	211.979
11.141	214.517
11.495	232.193
11.496	224.841
11.697	215.053
12.051	232.239
12.052	228.317
12.053	225.376
12.129	241.069
13.078	262.225
13.079	257.813
15.623	254.590
17.048	281.177
17.092	258.631
20.073	254.953
26.471	251.554
27.059	292.779];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'length', 'male'};  
temp.tL_m  = C2K(36.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'FerrWalk1993';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
 
%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
weights.psd.k = 5 * weights.psd.k_J; weights.psd.k_J = 0;
weights.psd.p_M = 5 * weights.psd.p_M;

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
D1 = 'Males are supposed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '3VF7C'; % Cat of Life
metaData.links.id_ITIS = '180454'; % ITIS
metaData.links.id_EoL = '46559314'; % Ency of Life
metaData.links.id_Wiki = 'Lissodelphis_borealis'; % Wikipedia
metaData.links.id_ADW = 'Lissodelphis_borealis'; % ADW
metaData.links.id_Taxo = '68706'; % Taxonomicon
metaData.links.id_WoRMS = '254975'; % WoRMS
metaData.links.id_MSW3 = '14300069'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lissodelphis_borealis}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'URL = {../../../bib/Kooy2010.html}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FerrWalk1993'; type = 'Article'; bib = [ ... 
'author = {R. C. Ferrero and W. A. Walker}, ' ... 
'year = {1993}, ' ...
'title = {Growth and reproduction of the northern right whale dolphin, \emph{Lissodelphis borealis}, in the offshore waters of the {N}orth {P}acific {O}cean}, ' ...
'journal = {Can. J. Zool.}, ' ...
'volume = {71}, ' ...
'pages = {2335-2344}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/328527/details}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

