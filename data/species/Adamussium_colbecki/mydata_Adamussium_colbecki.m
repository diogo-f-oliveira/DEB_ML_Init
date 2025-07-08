function [data, auxData, metaData, txtData, weights] = mydata_Adamussium_colbecki

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Pectinida'; 
metaData.family     = 'Pectinidae';
metaData.species    = 'Adamussium_colbecki'; % 
metaData.species_en = 'Antarctic scallop'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-1.5); % K, body temp
metaData.data_0     = {'ab';'tj'; 'ap'; 'am'; 'Lb';'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  % tags for different types of zero-variate data
metaData.data_1     = {'L-GSI'; 't-L';'L-Ww';'Wd-JO'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author     = {'Charlene Guillaumot'};            
metaData.date_subm  = [2019 05 20];                       
metaData.email      = {'charleneguillaumot21@gmail.com'};              
metaData.address    = {'ULB, 1050 Brussels, BELGIUM'}; 

metaData.curator    = {'Bas Kooijman'};    
metaData.date_acc   = [2019 05 20];              
metaData.email_cur  = {'bas.kooijman@vu.nl'};            

%% set data
% zero-variate data;

data.ab =177/24 ;      units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'PeckPowe2007';   
  temp.ab = C2K(0.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab  = 'experimental. Time to reach trochophore at 0.9 C and f=0.8'; 
data.tj = 90;     units.tj = 'd';    label.tj = 'age at metamorphosis since birth'; bibkey.tj = 'TyleReev2003';
  temp.tj = C2K(-1.5);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj='able to feed at PII stadium, when metamorphosis occurs';
data.ap = 6.5*365;     units.ap = 'd';    label.ap = 'age at puberty'; bibkey.ap = 'Catt1997';
  temp.ap = C2K(-1.5);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 18*365 ;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'ChiaCatt2001';   
  temp.am = C2K(-1.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am='18 years is provided by a VBL model; Berk1991 reported an observed individual of 13 years; Stoc1994 reported at Explorer Cove Invidivuals of 7cm max of 6-7 yo with really high abundances in the area';

data.Lb  = 55e-4; units.Lb  = 'cm';   label.Lb  = 'larval shell at birth (trochophore stadium)';    bibkey.Lb  = 'PeckPowe2007'; 
data.Lj  = 344e-4;   units.Lj  = 'cm';   label.Lj  = 'larval shell at metamorphosis (PII)';    bibkey.Lj  = 'BerkWall1991';
data.Lp  = 5;   units.Lp  = 'cm';   label.Lp  = 'size at puberty';  bibkey.Lp  = 'ChiaCatt2003'; 
data.Li  = 9.2;   units.Li  = 'cm';   label.Li  = 'maximum measured size';    bibkey.Li  = 'Schi2019';

data.Wwb = 8.7114e-08; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 55 mum: pi/6*0.0055^3';
data.Wwp = 9;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';           bibkey.Wwp = 'Stoc1984'; 
  comment.Wwp='rough estimate';
data.Wwi = 50;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'Stoc1984';

% uni-variate data
  
data.L_GSI_f1 = [ ... % length (mm), GSI (-)
50.991	0.947
63.948	1.382
66.975	1.133
72.066	0.438
73.031	1.228
75.948	1.132
81.999	0.752];
data.L_GSI_f1(:,1) = data.L_GSI_f1(:,1)/ 10; % convert mm to cm
units.L_GSI_f1   = {'cm', '-'};  label.L_GSI_f1 = {'length', 'GSI'};  bibkey.L_GSI_f1 = 'Catt1997';
temp.L_GSI_f1    = C2K(-1.5);  units.temp.L_GSI_f1 = 'K'; label.temp.L_GSI_f1 = 'temperature';
comment.L_GSI_f1 = 'GSI value in December. Terra Nova Bay ; temperature guessed from Schi2019'; 

data.L_GSI_f2 = [ ... % length (mm), GSI (-)
64.022	2.422
68.036	2.932
71.926	1.545
77.077	1.582
78.008	2.213
80.949	2.031];  
data.L_GSI_f2(:,1) = data.L_GSI_f2(:,1)/ 10; % convert mm to cm
units.L_GSI_f2   = {'cm', '-'};  label.L_GSI_f2 = {'length', 'GSI'};  bibkey.L_GSI_f2 = 'Catt1997';
temp.L_GSI_f2    = C2K(-1);  units.temp.L_GSI_f2 = 'K'; label.temp.L_GSI_f2 = 'temperature';
comment.L_GSI_f2 = 'GSI value in January, Terra Nova Bay ; temperature guessed from Schi2019'; 

data.tL = [ ... % time since settlent (d), length (mm)
1488.47	47.631
1560.74	49.961
1793.245	49.256
1918.805	54.768
2007.5	53.717
2247.305	53.386
3353.62	67.4
3438.665	68.45
3713.875	70.061
3825.2	70.969
3825.2	71.875
4031.425	72.911
4083.255	72.911
4112.82	73.574
4171.22	74.481
4298.605	75.186
4381.095	75.186
4480.74	76.207
4674.19	77.372
4708.5	77.372
4992.835	79.444
5246.51	80.466
5406.745	82.294
5719.55	83.301
5754.225	82.638
5837.08	83.877
6441.52	85.488]; 
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since settlement','length'};  bibkey.tL = 'ChiaCatt2003';
temp.tL    = C2K(-1.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
comment.tL = 'Terra Nova Bay, deduced from a regression model (Table 3) '; 

data.tL_f0_8 = [  ... % time since settlent (d), length (mm)
1077.845	21.454
1383.715	29.949
1473.505	30.063
1473.505	30.624
1501.245	31.647
1565.12	34.151
1652.72	32.249
1716.595	31.586
1732.655	44.077
1745.795	37.876
1825	35.69
1827.19	39.215
1827.19	41.173
1879.385	38.221
1879.385	39.892
1913.33	38.552
1914.06	39.215
1948.735	39.892
1975.38	36.021
1984.14	38.295
1984.14	39.418
2031.225	43.161
2038.16	38.612
2060.79	41.922
2083.42	45.062
2096.195	41.117
2096.195	42.6
2096.195	43.161
2114.08	40.209
2126.855	39.202
2149.485	40.209
2165.91	43.363
2191.46	38.295
2191.46	39.202
2200.585	44.026
2235.26	43.133
2235.26	44.026
2288.185	42.097
2306.07	42.429
2352.06	43.985
2352.06	45.006
2404.255	45.669
2502.805	46.231
2502.805	46.894
2508.645	49.873
2537.48	47.226
2592.23	46.305
3346.32	56.461
3427.715	56.115
3427.715	60.406
3539.77	61.314
3587.22	62.206
3691.975	60.305
3738.695	60.305
3783.59	64.25
3825.2	60.88
3842.355	61.788
3877.76	63.025
3907.325	64.582
4096.76	65.502
4096.76	66.497
4329.265	65.401
4329.265	67.417
4486.945	68.237
4486.945	69.462];  
data.tL_f0_8(:,2) = data.tL_f0_8(:,2)/ 10; % convert mm to cm
units.tL_f0_8   = {'d', 'cm'};  label.tL_f0_8 = {'time since settlement','length'};  bibkey.tL_f0_8 = 'ChiaCatt2003';
temp.tL_f0_8    = C2K(0.5);  units.temp.tL_f0_8 = 'K'; label.temp.tL_f0_8 = 'temperature';
comment.tL_f0_8 = 'Terra Nova Bay, deduced from a regression model (Table 3) '; 

data.LWw = [ ... % length (cm), wet weight (g)
2.384	0.743
3.042	1.303
3.241	1.839
3.569	1.839
3.659	2.632
3.825	3.023
4.289	4.441
4.57	4.542
4.57	5.481
4.59	6.111
4.782	4.757
4.961	6.709
5.188	6.564
5.433	8.824
5.513	5.563
5.616	11.092
5.775	9.176
5.775	9.819
5.915	9.964
6.015	11.64
6.097	14.039
6.128	12.899
6.199	16.841
6.399	18.843
6.487	19.568
6.55	15.795
6.565	18.843
6.808	16.041
6.888	18.73
6.954	21.52
6.954	22.346
6.954	22.742
6.954	23.58
7.062	23.725
7.082	20.543
7.153	22.504
7.17	25.776
7.182	24.311
7.241	26.871
7.38	25.776
7.401	23.5
7.423	31.222
7.431	21.824
7.538	26.481
7.594	24.978
7.594	25.816
7.594	29.049
7.625	26.833
7.636	32.525
7.669	31.222
7.689	30.731
7.702	24.392
7.713	29.937
7.829	29.792
7.838	33.974
7.853	25.067
7.945	31.669
7.969	37.315
7.969	38.751
7.994	33.124
8.012	24.513
8.015	33.974
8.253	40.49
8.26	22.313
8.444	41.529
8.447	37.573
8.564	39.853
8.773	41.529
8.773	42.651
8.783	38.166
8.783	38.864
8.923	41.851
8.964	47.65];  
units.LWw   = {'cm', 'g'};  label.LWw = {'length', 'wet weight'};  bibkey.LWw = 'Stoc1984';
temp.LWw    = C2K(-1);  units.temp.LWw = 'K'; label.temp.LWw = 'temperature';
comment.LWw = 'Explorer Cove';  

data.WdJO = [ % dry weight (g), O2 consumed (ulO2/g/h)
0.126	270.264
0.127	294.66
0.295	259.999
0.296	248.189
0.308	165.512
0.371	239.9
0.377	302.961
0.428	265.483
0.442	207.203
0.462	345.25
0.463	379.134
0.474	329.711
0.648	71.183
0.696	156.918
0.707	179.927
0.718	260.398
0.719	201.781
0.726	294.135
1.05	291.677
1.06	310.126
1.07	329.627
1.13	359.886
1.14	371.696
1.146	364.368
1.154	340.722
1.157	327.505
1.158	332.895
1.177	289.922
1.184	297.991
1.196	267.721
1.23	289.806
1.236	329.375
1.287	358.962
1.288	374.27
1.328	269.224
1.329	294.219
1.347	322.493
1.351	299.599
1.355	350.661
1.408	350.661
1.42	370.057
1.424	327.872
1.425	322.493
1.450	294.324
1.451	305.083
1.47	419.743
1.474	278.081
1.501	338.747
1.563	301.427
1.569	364.709
1.582	383.988
1.598	332.138
1.621	339.388
1.627	386.678
1.655	347.457
1.745	438.193
1.757	353.057
1.758	340.428
1.768	445.558
1.769	406.294
1.812	365.087
1.813	297.779
1.824	328.326
1.826	432.568
1.858	303.284
1.859	270.758
1.87	492.484
1.888	335.311
1.889	318.147
1.890	328.326
1.891	376.758
1.909	421.834
1.932	412.714
1.934	494.351
1.935	512.801
1.965	335.311
1.985	348.045
2.02	470.291
2.021	415.404
2.022	430.838
2.032	455.791
2.098	380.175
2.099	371.286
2.101	477.425
2.110	418.093
2.111	434.347
2.134	444.286
2.139	482.688
2.184	434.811
2.19	345.25
2.191	474.063
2.192	463.304
2.193	323.347
2.194	444.286
2.198	335.311
2.201	493.563
2.227	352.011
2.247	499.058
2.25	489.119
2.262	440.2
2.263	473.464
2.274	412.611
2.275	454.446
2.297	473.464
2.298	446.377
2.299	423.137
2.312	365.35
2.386	469.198
2.387	476.447
2.393	501.968
2.427	488.551
2.429	442.795
2.430	455.413
2.441	430.165
2.446	470.553
2.447	495.916
2.466	515.753
2.481	498.606
2.542	459.605
2.543	476.899
2.581	416.095
2.582	426.053
2.607	546.905
2.62	481.564
2.621	495.244
2.627	426.053
2.638	504.101
2.661	517.77
2.662	535.779
2.663	495.244
2.708	464.79
2.72	430.621
2.75	519.525
2.751	527.594
2.752	547.693
2.777	534.245
2.786	590.025
2.803	498.722
2.807	466.813
2.808	479.442
2.823	506.896
2.824	528.75
2.826	493.342
2.933	524.421
2.946	545.224
2.957	508.167
2.98	534.36
3.004	547.095
3.025	514.818
3.028	469.618
3.029	495.538
3.033	567.341
3.049	557.854
3.068	600.889
3.075	575.641
3.076	587.44
3.1	    518.327
3.107	485.273
3.112	526.396
3.123	624.35
3.230	484.37
3.231	500.844
3.274	520.901
3.284	547.988
3.285	563.306
3.286	464.074
3.351	611.091
3.412	458.463
3.413	503.747
3.414	533.695
3.471	624.991
3.472	612.362
3.48	466.663
3.481	493.463
3.482	609.778
3.493	581.305
3.683	612.583
3.684	630.591
3.685	638.66
3.783	633.985
3.784	649.304
3.785	677.703
3.794	611.091
3.807	549.973
3.808	563.422
3.809	573.361
3.833	623.005
3.851	608.286
3.858	581.987
3.872	653.979
3.875	623.005
3.893	593.797
3.902	639.48
3.905	595.657
3.916	558.137
3.917	607.168
3.985	616.922
3.986	627.681
3.997	594.354
3.998	605.113
4.008	641.235
4.009	663.089
4.018	719.425
4.085	647.77
4.086	663.089
4.087	632.462
4.105	733.662
4.159	681.318
4.175	733.662
4.179	653.832
4.225	635.708
4.231	709.486
4.232	684.008
4.247	648.453
4.248	605.817
4.249	586.768
4.31	627.902
4.311	638.66
4.312	655.135
4.313	665.894
4.32	705.525
4.321	723.87
4.322	684.008
4.403	742.929
4.419	696.784
4.42	713.594
4.43	689.544
4.431	731.004
4.434	637.914
4.448	659.054
4.454	711.735
4.465	613.959
4.472	742.929
4.512	632.304
4.513	651.804];  
units.WdJO   = {'g', 'ulO2/g/h'};  label.WdJO = {'dry body mass', 'O2 consumed per 1g indi'};  bibkey.WdJO = 'Heil2003';
temp.WdJO    = C2K(0);  units.temp.WdJO = 'K'; label.temp.WdJO = 'temperature';
comment.WdJO = 'summer experiment; Terra Nova Bay';  


%% set weights for all real data
weights = setweights(data, []);
weights.tj = 0;
weights.Li = 5 * weights.Li;
weights.tL = 10 * weights.tL;
weights.Lb = 10 * weights.Lb;
weights.WdJO (13) = 0 ;
weights.L_GSI_f1([4 7]) = .3 * weights.L_GSI_f1([4 7]);
weights.L_GSI_f2 = .5 * weights.L_GSI_f2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Based on Heil2003, a value for d_V and d_E is used that deviates from the default';
metaData.discussion = struct('D1', D1);

%% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '9X5N'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46467864'; % Ency of Life
metaData.links.id_Wiki = 'Adamussium_colbecki'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3939581'; % Taxonomicon
metaData.links.id_WoRMS = '197021'; % WoRMS
metaData.links.id_molluscabase = '197021'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Adamussium_colbecki}}'];
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
bibkey = 'PeckPowe2007'; type = 'Article'; bib = [ ... 
'author = {Peck, L. S. and Powell, D. K. and Tyler, P. A.}, ' ... 
'year = {2007}, ' ...
'title = {Very slow development in two {A}ntarctic bivalve molluscs,the infaunal clam \emph{Laternula elliptica} and the scallop \emph{Adamussium colbecki}}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {150}, ' ...
'pages = {1191-1197}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

%
bibkey = 'Catt1997'; type = 'Article'; bib = [ ... 
'author = {Cattaneo-Vietti, R.}, ' ... 
'year = {1997}, ' ...
'title = {The population structure and ecology of the {A}ntarctic scallop \emph{Adamussium colbecki} ({S}mith, 1902) at {T}erra {N}ova {B}ay ({R}oss {S}ea, {A}ntarctica)}, ' ...
'journal = {Scientia Marina}, ' ...
'volume = {61}, ' ...
'pages = {15-24}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%

bibkey = 'ChiaCatt2001'; type = 'Article'; bib = [ ... 
'author = {Mariachiara Chiantore and Riccardo Cattaneo-Vietti and Paul Arthur Berkman and Marco Nigro and Marino Vacchi and Stefano Schiaparelli and Giancarlo Albertelli}, ' ... 
'year = {2001}, ' ...
'title = {Antarctic scallop (\emph{Adamussium colbecki}) spatial population variability along the {V}ictoria {L}and {C}oast, {A}ntarctica}, ' ...
'journal = {Polar Biology}, ' ...
'volume = {24}, ' ...
'pages = {139-143}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%

bibkey = 'Schi2019'; type = 'Article'; bib = [ ... 
 'doi = {10.7717/peerj.6373}, ' ...
'author = {Schiaparelli,  S.}, ' ... 
'year = {2019}, ' ...
'title = {Oceanographic moorings as year-round laboratories for investigating growth performance and settlement dynamics in the {A}ntarctic scallop \emph{Adamussium colbecki}}, ' ...
'journal = {PeerJ}, ' ...
'volume = {7}, ' ...
'pages = {e6373}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%

bibkey = 'ChiaCatt2003'; type = 'Article'; bib = [ ... 
'author = {Chiantore, M. and Cattaneo-Vietti, R. and Heilmayer, O. }, ' ... 
'year = {2003}, ' ...
'title = {Antarctic scallop (\emph{Adamussium colbecki}) annual growth rate at {T}erra {N}ova {B}ay }, ' ...
'journal = {Polar Biology}, ' ...
'volume = {26}, ' ...
'pages = {416-419}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BerkWall1991'; type = 'Article'; bib = [ ... 
'author = {Berkman, P. A.  and Waller, T. R. and Alexander, S. P.}, ' ... 
'year = {1991}, ' ...
'title = {Unprotected larval development in the {A}ntarctic scallop \emph{Adamussium colbecki}}, ' ...
'journal = {Antarctic science}, ' ...
'volume = {2}, ' ...
'pages = {151-157}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Heil2003'; type = 'Article'; bib = [ ... 
'author = {Heilmayer, O.}, ' ... 
'year = {2003}, ' ...
'title = {Saving by freezing? {M}etabolic rates of \emph{Adamussium colbecki} in a latitudinal context}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {143}, ' ...
'pages = {477-484}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'Stoc1984'; type = 'Article'; bib = [ ... 
'author = {Stockton, W. L.}, ' ... 
'year = {1984}, ' ...
'title = {The biology and ecology of the epifaunal scallop \emph{Adamussium colbecki} on the west side of {M}c{M}urdo Sound, {A}ntarctica}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {78}, ' ...
'pages = {171-178}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'TyleReev2003'; type = 'Article'; bib = [ ... 
'author = {Tyler, P. and Reeves, S. and Peck, L. and Clarke, A. and Powell, D.}, ' ... 
'year = {2003}, ' ...
'title = {Seasonal variation in the gametogenic ecology of the {A}ntarctic scallop \emph{Adamussium colbecki}}, ' ...
'journal = {Polar Biology}, ' ...
'volume = {26}, ' ...
'pages = {727-733}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%