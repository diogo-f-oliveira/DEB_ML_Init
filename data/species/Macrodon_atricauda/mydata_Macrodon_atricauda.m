function [data, auxData, metaData, txtData, weights] = mydata_Macrodon_atricauda

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Macrodon_atricauda'; 
metaData.species_en = 'King weakfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author         = {'Bas Kooijman'};    
metaData.date_subm      = [2019 01 09];              
metaData.email          = {'bas.kooijman@vu.nl'};            
metaData.address        = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.tp = 3*365; units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'CardHaim2011';   
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.tpm = 2*365; units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'CardHaim2011';   
  temp.tpm = C2K(20); units.temp.tpm = 'K'; label.temp.tpm = 'temperature'; 
data.am = 8*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'CardHaim2011';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 46;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter og 0.8 mm: pi/6*0.08^3';

data.Ri = 6e5/365;  units.Ri = '#/d';  label.Ri = 'reprod rate';  bibkey.Ri = 'guess';
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap = 0.86';
 
% uni-variate data
% time-length
data.tL_f = [ ... % yr class (yr), total length (0.1 mm)
    1 2435
    1 2179
    1 2359
    1 2459
    2 3220
    2 3043
    2 3109
    2 3246
    3 3473
    3 3518
    3 3461
    3 3645
    4 3705
    4 3700
    4 3778
    4 3951
    5 3633
    5 3757
    5 4480
    5 4016
    6 3550
    6 4065
    6 3823];
data.tL_f(:,1) = (.75 + data.tL_f(:,1)) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
data.tL_f(:,2) = data.tL_f(:,2)/100; % convert 0.1 mm to cm
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(20);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CardHaim2011';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % yr class (yr), total length (0.1 mm)
    1 2365
    1 2138
    1 2204
    1 2253
    2 2838
    2 2823
    2 2771
    2 2894
    3 3097
    3 3145
    3 3307
    3 3369
    4 3206
    4 3211
    4 3420
    4 3611
    5 3289
    5 3494
    5 3450
    6 3100
    6 3442
    7 3590];
data.tL_m(:,1) = (.75 + data.tL_m(:,1)) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
data.tL_m(:,2) = data.tL_m(:,2)/100; % convert 0.1 mm to cm
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(20);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CardHaim2011';
comment.tL_m = 'Data for males';

% length-weight
data.LW = [ ... total length (cm), weight (g)
14.813	24.660
15.981	45.536
16.160	30.685
16.609	27.739
16.610	45.573
16.969	42.622
17.507	45.627
17.687	45.637
18.316	51.620
18.317	66.482
18.586	66.498
18.765	54.619
19.573	54.667
19.752	57.650
19.844	84.407
20.111	51.726
20.202	72.539
20.472	87.417
20.651	78.510
20.830	69.604
20.922	105.278
21.371	108.277
21.549	72.619
21.640	93.431
21.999	93.452
22.090	117.237
22.716	81.605
22.717	93.495
22.718	114.302
22.900	141.064
23.437	129.206
23.616	108.410
23.618	141.107
23.704	84.636
23.887	141.123
24.154	108.442
24.336	150.067
24.514	114.408
24.515	132.243
24.786	164.955
24.788	188.735
24.872	99.568
24.876	173.878
25.144	141.198
25.145	162.004
25.147	185.784
25.503	141.219
25.861	129.351
25.950	120.439
25.953	159.080
25.955	200.694
26.400	138.300
26.402	159.107
26.580	147.228
26.942	182.918
26.942	194.808
26.944	212.642
26.945	233.449
27.298	147.270
27.389	159.165
27.481	200.784
27.574	245.376
27.752	221.607
27.928	165.142
27.928	171.087
27.933	242.425
28.019	188.927
28.109	188.932
28.289	194.888
28.290	203.805
28.652	260.302
28.736	171.135
28.740	224.638
28.829	212.754
28.831	245.451
28.832	266.258
29.098	209.798
29.186	180.079
29.192	278.169
29.546	197.935
29.641	275.223
29.728	230.642
29.906	206.873
29.911	296.046
30.356	236.624
30.359	278.238
30.451	319.857
30.626	239.613
30.627	254.475
30.631	328.785
30.808	287.182
30.810	307.989
30.894	224.767
30.902	343.663
31.165	251.534
31.167	281.258
31.262	367.464
31.345	260.462
31.348	308.021
31.704	260.483
31.709	328.849
31.798	316.965
31.891	364.529
32.062	233.753
32.063	248.615
32.064	272.394
32.071	385.346
32.425	308.085
32.426	317.002
32.431	388.340
32.792	427.003
32.963	290.282
32.964	308.117
32.966	331.896
32.968	364.593
33.150	403.245
33.410	260.585
33.507	379.487
33.691	444.890
33.692	462.725
33.862	308.170
33.962	474.630
34.042	323.043
34.131	308.186
34.134	346.827
34.226	385.474
34.318	430.066
34.400	308.202
34.499	444.938
34.501	474.662
34.672	343.887
35.034	388.495
35.041	492.529
35.126	424.169
35.217	450.926
35.303	391.483
35.390	337.985
35.390	346.902
35.489	486.611
35.763	557.965
36.026	462.864
36.030	522.312
36.119	504.483
36.201	388.564
36.381	394.519
36.383	424.244
36.479	522.338
36.572	572.875
36.742	424.265
36.748	525.327
36.752	590.720
36.835	471.829
36.846	647.201
37.019	549.122
37.115	638.300
37.201	590.747
37.373	474.833
37.383	617.509
37.469	561.038
37.559	572.933
37.736	537.275
37.821	462.970
38.003	498.650
38.017	706.719
38.091	460.014
38.099	587.828
38.100	608.634
38.105	691.862
38.193	656.198
38.276	549.197
38.460	629.463
38.810	483.836
38.904	543.289
38.911	653.269
38.912	671.103
38.913	688.938
39.261	507.642
39.265	581.952
39.268	623.566
39.540	662.223
39.719	653.317
39.896	617.658
39.898	644.410
39.901	688.996
39.977	486.878
39.992	721.698
39.993	724.670
39.997	793.036
39.998	807.898
40.073	582.000
40.343	593.906
40.623	754.432
40.703	611.762
40.798	692.022
40.883	617.717
40.893	760.393
40.985	796.067
41.255	813.917
41.518	721.789
41.521	754.485
42.153	819.916
42.238	736.694
42.962	831.853
43.065	1042.900
43.223	701.083
43.677	793.255
44.311	867.602
45.040	1048.962
45.136	1138.140
45.662	947.937];
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'CardHaim2011';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Ri = 0 * weights.Ri;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '3X4WL'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46579152'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3417182'; % Taxonomicon
metaData.links.id_WoRMS = '712737'; % WoRMS
metaData.links.id_fishbase = 'Macrodon-atricauda'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sciaenidae}}';
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
bibkey = 'CardHaim2011'; type = 'Article'; bib = [ ... 
'author = {Luis Gustavo Cardoso and Manuel Haimovici}, ' ... 
'year = {2011}, ' ...
'title = {Age and changes in growth of the king weakfish \emph{Macrodon atricauda} (G\"{u}nther, 1880) between 1977 and 2009 in southern {B}razil}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {111}, ' ...
'pages = {177-187}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Macrodon-atricauda.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

