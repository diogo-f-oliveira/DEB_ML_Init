function [data, auxData, metaData, txtData, weights] = mydata_Chaetodipterus_faber

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Ephippiformes'; 
metaData.family     = 'Ephippidae';
metaData.species    = 'Chaetodipterus_faber'; 
metaData.species_en = 'Atlantic spadefish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.4); % K, body temp
metaData.data_0     = {'ab';'aj';'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 11];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 11];

%% set data
% zero-variate data

data.ab = 6;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(25.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'SoetFern2019';   
  temp.am = C2K(25.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 14;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'SoetFern2019'; 
data.Li  = 91;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based egg diameter of 1 mm: pi/6*0.1^3'; 
data.Wwp = 33.1; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi, 0.03311*Lp^2.94, see F1, gives 77 g';
data.Wwi = 9.1e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = 'based on 0.03311*Li^2.94, see F1, gives 19 kg';

data.GSI  = 0.07;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'SoetFern2019';   
  temp.GSI = C2K(25.4);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), wet weight (g)
0.304	8.971
0.337	6.789
0.568	11.158
0.634	12.371
0.700	11.766
0.700	8.613
0.733	15.162
0.733	9.947
0.898	14.679
0.931	11.041
0.931	12.981
0.964	16.014
0.997	18.439
0.997	15.286
1.096	12.498
1.129	13.105
1.129	11.286
1.162	14.318
1.195	17.351
1.228	19.291
1.261	11.773
1.393	11.775
1.426	16.020
1.426	13.230
1.492	22.326
1.492	18.203
1.525	15.536
1.591	17.841
1.591	13.354
1.624	15.537
1.657	16.629
1.690	15.174
1.723	17.600
1.789	23.300
1.789	20.026
1.822	21.118
1.921	13.843
1.954	19.786
2.020	26.214
2.053	30.338
2.053	22.091
2.053	17.362
2.086	34.582
2.086	21.606
2.119	23.183
2.119	19.424
2.119	16.271
2.152	33.734
2.152	20.637
2.185	26.216
2.185	25.367
2.218	24.882
2.218	17.000
2.251	29.612
2.284	19.547
2.284	18.092
2.284	17.607
2.284	18.456
2.317	19.063
2.350	16.153
2.383	26.825
2.383	22.338
2.449	34.951
2.449	21.369
2.449	18.215
2.449	16.275
2.548	27.191
2.581	20.279
2.614	28.526
2.680	18.582
2.680	16.399
2.746	17.855
2.812	31.196
3.010	34.837
3.043	27.682
3.043	18.708
3.109	38.355
3.175	19.195
3.275	18.347
3.308	26.473
3.407	23.442
3.407	24.413
3.473	18.592
3.506	33.873
3.572	21.383
3.638	37.149
3.671	17.018
3.737	35.210
3.737	27.327
3.770	19.930
3.803	21.386
3.836	40.426
3.836	37.151
3.836	18.718
3.902	45.156
3.902	39.578
3.902	38.123
3.902	35.091
3.935	43.701
3.968	41.519
3.968	39.094
4.001	23.329
4.067	19.206
4.166	17.995
4.298	25.394
4.298	21.028
4.331	24.667
4.463	22.607
4.496	28.065
4.793	35.223
4.826	22.490
4.892	21.157
4.925	42.016
4.958	36.317
4.991	40.562
5.618	32.809
5.684	47.968
5.783	45.544
5.816	47.242
5.816	20.563
5.915	44.576
5.981	42.879
5.981	41.423
6.972	44.953
6.972	49.440
7.368	29.435
7.764	47.752
7.863	48.845
7.896	45.935
8.127	30.779
8.193	45.211
8.721	37.820
8.952	44.857
8.952	47.525
9.645	49.717
9.711	46.443
9.843	47.294
9.843	48.870
9.876	45.233
9.909	48.265
10.239	43.903
10.636	51.185
10.768	48.882
10.768	47.184
11.032	47.430
12.847	48.060
15.884	49.554];
data.tL_f(:,1) = 365 * (0+data.tL_f(:,1)); % convert yr to d
for i=2:size(data.tL_f,1);if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-8;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(25.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SoetFern2019';
%
data.tL_m = [ ... % time since birth (yr), wet weight (g)
0.317	3.809
0.385	7.119
0.591	17.783
0.652	10.676
0.686	11.780
0.687	13.373
0.752	12.638
0.848	7.493
0.882	10.067
0.948	8.597
0.982	11.171
1.051	15.093
1.082	12.030
1.085	16.074
1.147	10.193
1.153	20.364
1.215	13.625
1.221	22.203
1.347	13.381
1.444	11.054
1.646	16.572
1.647	18.042
1.677	13.753
1.677	13.998
1.743	13.141
1.745	15.960
1.810	15.348
1.879	18.780
1.880	20.619
1.910	17.065
1.947	22.580
2.045	21.111
2.107	15.475
2.141	16.455
2.177	20.868
2.274	17.805
2.277	21.849
2.279	24.791
2.379	26.998
2.405	16.459
2.409	22.831
2.440	19.646
2.480	29.695
2.504	16.828
2.509	24.303
2.510	25.529
2.544	26.632
2.671	19.036
2.706	21.487
2.707	23.325
2.710	27.492
2.869	19.651
2.917	41.833
3.048	39.629
3.066	18.183
3.074	30.070
3.175	32.400
3.264	17.205
3.299	21.005
3.335	25.417
3.465	21.620
3.528	17.944
3.531	21.253
3.562	19.292
3.698	24.074
3.837	34.982
3.906	40.008
3.969	34.616
3.970	37.067
3.989	16.234
4.004	38.416
4.007	42.215
4.123	19.055
4.272	44.179
4.429	32.294
4.555	23.349
4.861	36.834
5.131	45.538
5.160	39.289
5.225	37.574
5.578	21.892
5.642	19.074
5.744	23.487
5.889	43.465
5.891	46.528
5.941	22.632
5.954	41.627
6.020	42.241
6.052	40.771
6.285	43.715
6.403	22.148
6.500	19.576
6.817	48.624
7.804	44.838
7.869	42.020
8.090	27.684
8.167	43.739
8.595	42.397
9.820	47.682
9.854	49.153
9.876	32.364
10.017	46.459
10.051	48.298
10.776	46.347
12.031	46.976
14.807	51.178
15.794	47.392
17.843	51.217];
data.tL_m(:,1) = 365 * (0+data.tL_m(:,1)); % convert yr to d
for i=2:size(data.tL_m,1);if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-8;end;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(25.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SoetFern2019';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
weights.tL_f = 2 * weights.tL_f;
weights.tL_m = 2 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

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
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.03311*(TL in cm)^2.94';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'TBSN'; % Cat of Life
metaData.links.id_ITIS = '169539'; % ITIS
metaData.links.id_EoL = '46577174'; % Ency of Life
metaData.links.id_Wiki = 'Chaetodipterus_faber'; % Wikipedia
metaData.links.id_ADW = 'Chaetodipterus_faber'; % ADW
metaData.links.id_Taxo = '45384'; % Taxonomicon
metaData.links.id_WoRMS = '159703'; % WoRMS
metaData.links.id_fishbase = 'Chaetodipterus-faber'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chaetodipterus_faber}}';
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
bibkey = 'SoetFern2019'; type = 'Article'; bib = [ ...
'doi = {10.1007/s10228-018-0663-2}, ' ...
'author = {Marcelo Soeth and Luis Fernando F\''{a}varo and Henry Louis Spach and Felippe Alexandre Daros and Ana Em\''{i}lia Woltrich and Alberto Teodorico Correia}, ' ...
'year = {2019}, ' ...
'title = {Age, growth, and reproductive biology of the {A}tlantic spadefish \emph{Chaetodipterus faber} in southern {B}razil}, ' ... 
'journal = {Ichthyological Research}, ' ...
'volume = {66}, '...
'pages = {140–154}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Chaetodipterus-faber.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

