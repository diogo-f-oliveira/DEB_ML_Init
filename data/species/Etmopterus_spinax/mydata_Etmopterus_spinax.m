function [data, auxData, metaData, txtData, weights] = mydata_Etmopterus_spinax

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Squaliformes'; 
metaData.family     = 'Etmopteridae';
metaData.species    = 'Etmopterus_spinax'; 
metaData.species_en = 'Velvet belly lanternshark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0iMpb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7); % K, body temperature
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 18];                          
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
data.am = 10*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'GennScac2007';   
  temp.am = C2K(7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 8;    units.Lb  = 'cm';    label.Lb  = 'total length at birth';  bibkey.Lb  = 'GennScac2007';
data.Lp = 20;   units.Lp  = 'cm';    label.Lp  = 'total length at puberty';bibkey.Lp  = 'GennScac2007';
data.Li  = 45;  units.Li  = 'cm';    label.Li  = 'ultimate total length';  bibkey.Li  = 'GennScac2007';
data.Lim  = 39.5; units.Lim  = 'cm'; label.Lim  = 'ultimate total length for males';  bibkey.Lim  = 'GennScac2007';

data.Ri  = 6/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.952	16.105
0.976	13.519
0.997	14.956
1.020	14.094
1.932	20.572
1.954	21.721
1.977	19.997
1.977	19.135
1.978	18.704
1.978	17.842
2.001	16.262
2.023	16.837
2.934	24.751
2.935	22.740
2.957	24.177
2.957	23.171
2.978	26.332
2.980	21.160
2.981	20.298
2.981	19.292
2.982	18.861
2.982	17.855
3.003	21.735
3.021	30.643
3.936	29.362
3.940	19.879
3.941	19.305
3.959	28.788
3.981	28.357
3.982	27.351
3.982	26.345
3.983	25.483
3.983	24.621
3.984	21.891
4.003	30.225
4.006	23.472
4.007	20.742
4.029	22.467
4.921	22.478
4.940	29.519
4.941	28.082
4.964	26.933
4.983	33.111
4.985	30.094
4.986	27.364
4.986	26.215
5.005	34.836
5.006	31.531
5.009	25.353
5.028	33.687
5.028	32.537
5.029	30.669
5.032	24.779
5.054	24.204
5.987	33.843
5.987	33.556
5.987	32.981
5.988	32.262
5.988	31.975
5.988	31.400
5.988	31.113
5.989	30.395
6.008	37.435
6.008	36.717
6.011	29.102
6.034	28.527
6.034	27.665
6.969	32.132
6.970	30.695
6.987	43.770
6.990	37.304
6.990	36.155
6.990	35.293
7.013	34.144
7.036	33.138
7.993	38.610
7.993	37.748
7.995	35.019
8.973	42.215
8.997	39.486
9.020	37.187];
data.tL_f(:,1) = data.tL_f(:,1)*365; % % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};     label.tL_f = {'age', 'total length', 'female'};  
temp.tL_f = C2K(7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GennScac2007';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (mm)
0.976	15.029
0.994	11.705
0.994	13.150
0.994	18.786
1.012	16.474
1.048	15.751
1.988	21.098
1.988	21.676
2.006	15.462
2.006	16.040
2.024	13.873
2.024	16.618
2.024	17.341
2.024	17.630
2.024	18.208
2.024	20.231
2.964	23.410
2.982	21.387
2.982	24.277
3.000	17.341
3.000	19.075
3.018	18.064
3.018	21.965
3.018	23.410
3.036	26.012
3.994	23.121
3.994	23.988
3.994	24.422
3.994	24.855
3.994	25.723
3.994	26.879
4.012	20.665
4.012	22.254
4.012	27.312
4.030	28.035
4.030	28.324
4.030	30.202
4.048	28.757
4.988	24.133
4.988	24.855
4.988	25.578
4.988	26.156
4.988	27.168
4.988	28.613
4.988	30.058
5.024	29.624
5.024	30.925
5.042	28.035
5.964	33.237
6.000	29.191
6.000	30.347
6.000	31.214
6.018	26.445
6.018	28.035
7.012	29.913
7.012	32.514];
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};     label.tL_m = {'age', 'total length', 'male'};  
temp.tL_m = C2K(7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GennScac2007';
comment.tL_m = 'Data for males';

% length - weight
data.LWw = [ ... % total length (cm), wet weight (g)
 9.611	4.464
10.941	4.464
11.452	8.036
12.883	8.929
13.497	13.393
14.417	5.357
14.519	14.286
14.928	14.286
15.644	18.750
15.644	14.286
16.360	16.071
16.769	22.321
17.178	20.536
18.303	25.000
18.303	21.429
18.405	21.429
18.609	25.000
19.632	25.893
19.836	25.893
19.939	23.214
20.143	35.714
20.245	30.357
20.859	32.143
21.063	41.071
21.779	40.179
22.188	48.214
22.290	33.036
22.699	51.786
23.211	49.107
23.415	41.964
24.029	52.679
24.131	49.107
24.335	50.000
24.335	55.357
24.949	56.250
25.153	66.964
25.153	67.857
25.358	51.786
25.767	59.821
25.767	54.464
25.767	51.786
26.074	64.286
26.483	70.536
27.096	68.750
27.096	76.786
27.505	64.286
27.607	91.071
27.812	85.714
27.812	76.786
27.914	68.750
28.323	66.071
28.630	90.179
28.732	98.214
28.732	80.357
29.243	85.714
29.243	84.821
29.448	93.750
29.550	101.786
29.550	81.250
29.652	90.179
29.755	99.107
30.061	101.786
30.266	120.536
30.573	100.893
30.982	108.929
30.982	105.357
31.186	104.464
31.800	114.286
32.209	110.714
32.515	120.536
32.515	126.786
32.618	135.714
32.618	108.036
32.924	115.179
32.924	108.036
33.129	119.643
33.231	124.107
33.538	133.929
33.640	148.214
33.845	129.464
33.947	153.571
34.049	139.286
34.867	143.750
35.072	128.571
35.174	133.929
35.481	137.500
36.299	179.464
36.503	153.571
36.708	225.893
37.117	175.893
37.628	193.750
37.628	184.821
37.628	165.179
38.037	189.286
38.855	188.393
39.468	193.750
42.025	213.393
43.661	280.357];
units.LWw = {'cm', 'g'};     label.LWw = {'total length', 'wet weight'};  
bibkey.LWw = 'GennScac2007';
comment.LWw = 'sexes combined';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'aplacental viviparous';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'bathydemersal; depth range 200 - 2490 m'; 
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'length-weight: Ww in g  = 0.00347 * (TL in cm)^3.06';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '6GSVD'; % Cat of Life
metaData.links.id_ITIS = '160670'; % ITIS
metaData.links.id_EoL = '46560244'; % Ency of Life
metaData.links.id_Wiki = 'Etmopterus_spinax'; % Wikipedia
metaData.links.id_ADW = 'Etmopterus_spinax'; % ADW
metaData.links.id_Taxo = '41827'; % Taxonomicon
metaData.links.id_WoRMS = '105913'; % WoRMS
metaData.links.id_fishbase = 'Etmopterus-spinax'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Etmopterus_spinax}}';  
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
bibkey = 'GennScac2007'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00227-007-0769-y}, ' ...
'author = {Enrico Gennari and Umberto Scacco}, ' ...
'year = {2007}, ' ...
'title  = {First age and growth estimates in the deep water shark, \emph{Etmopterus spinax} ({L}innaeus, 1758), by deep coned vertebral analysis}, ' ...
'journal = {Mar Biol}, ' ...
'volume = {152}, ' ...
'pages = {1207-1214}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etmopterus-spinax.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

