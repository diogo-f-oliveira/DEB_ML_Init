function [data, auxData, metaData, txtData, weights] = mydata_Pelates_octolineatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Terapontidae';
metaData.species    = 'Pelates_octolineatus'; 
metaData.species_en = 'Western striped grunter'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0iMm', '0iFr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 20];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 20];

%% set data
% zero-variate data

data.am = 9*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 14;   units.Lp  = 'cm';  label.Lp  = 'std length at puberty';  bibkey.Lp  = 'guess';
  comment.Lp = 'based on end of 1st yr, early 2nd yr';
data.Li  = 28;   units.Li  = 'cm';  label.Li  = 'ultimate std length';    bibkey.Li  = 'fishbase';

data.Wwb = 9.2e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 560 mum: pi/6*0.056^3';
data.Wwp = 17;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.00479*Lp^3.09, see F1';
data.Wwi = 142;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00479*Li^3.09, see F1';

data.Ri  = 6e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Amniataba_caudavittata';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
0.083	1.937
0.110	2.828
0.136	1.195
0.165	4.685
0.166	5.354
0.177	2.235
0.178	3.720
0.179	4.240
0.181	7.136
0.194	6.320
0.206	4.760
0.216	1.493
0.244	2.607
0.271	3.573
0.272	4.539
0.283	1.791
0.326	4.391
0.341	6.990
0.351	2.980
0.352	3.946
0.356	8.624
0.368	6.396
0.410	9.070
0.411	9.442
0.421	5.877
0.436	8.031
0.448	6.398
0.528	6.399
0.553	4.097
0.569	7.439
0.581	5.657
0.597	8.479
0.606	3.875
0.609	7.440
0.701	5.287
0.705	9.520
0.742	6.625
0.755	5.882
0.772	10.041
0.784	8.705
0.786	11.378
0.794	4.621
0.796	7.591
0.837	8.334
0.875	5.513
0.900	4.177
0.916	6.850
0.999	9.525
1.010	6.629
1.040	10.639
1.050	7.149
1.052	8.931
1.064	7.892
1.093	10.491
1.131	8.264
1.134	11.160
1.172	8.636
1.186	9.899
1.188	11.978
1.200	10.344
1.228	12.721
1.229	13.315
1.230	14.058
1.232	16.434
1.312	16.584
1.338	14.950
1.391	15.248
1.392	15.619
1.421	18.219
1.431	14.506
1.514	17.403
1.526	16.364
1.622	18.370
1.674	17.183
1.685	13.619
1.698	14.362
1.699	14.881
1.713	15.699
1.767	16.739
1.796	18.522
1.836	19.116
1.887	15.850
1.901	17.261
1.927	16.370
1.937	12.583
1.938	13.697
1.957	19.638
1.971	20.752
1.983	18.970
2.009	17.708
2.032	14.144
2.046	14.590
2.050	18.674
2.058	12.659
2.075	17.041
2.087	15.556
2.118	20.160
2.142	17.561
2.146	21.497
2.156	17.710
2.157	19.047
2.206	14.443
2.213	21.869
2.225	20.756
2.246	13.627
2.248	15.706
2.250	18.231
2.292	21.128
2.313	14.668
2.316	17.490
2.330	18.529
2.369	17.119
2.413	21.650
2.426	20.759
2.438	19.422
2.439	20.090
2.450	17.640
2.451	18.828
2.481	22.319
2.502	15.859
2.507	21.280
2.540	14.374
2.610	17.494
2.651	18.534
2.662	15.267
2.704	17.495
2.705	19.055
2.733	20.466
2.734	21.357
2.775	22.175
2.786	19.502
2.797	16.828
2.809	15.938
2.811	18.388
2.837	16.829
2.864	17.275
2.866	20.023
2.880	20.543
2.906	19.206
2.917	16.385
2.931	17.127
2.945	17.796
2.946	18.687
2.960	20.098
2.962	22.474
2.973	19.282
2.974	20.841
2.975	21.509
3.026	19.654
3.036	15.198
3.050	16.015
3.052	18.317
3.054	20.545
3.066	19.357
3.077	16.833
3.105	17.724
3.108	21.363
3.123	23.442
3.162	21.883
3.176	22.478
3.186	18.765
3.211	16.463
3.240	19.508
3.242	21.662
3.258	23.890
3.265	17.578
3.266	18.543
3.268	20.845
3.279	17.652
3.333	18.990
3.360	18.693
3.376	21.812
3.388	20.179
3.400	18.471
3.412	16.912
3.414	19.808
3.478	16.616
3.498	23.671
3.523	21.220
3.550	22.409
3.617	21.816
3.618	23.375
3.707	18.698
3.748	19.516
3.789	19.665
3.792	23.229
3.803	21.225
3.831	22.413
3.869	20.186
3.899	24.196
3.950	20.633
3.951	22.266
3.961	18.405
4.001	18.034
4.017	20.782
4.029	19.966
4.059	23.679
4.109	18.779
4.124	21.526
4.136	19.373
4.166	23.681
4.179	22.790
4.233	23.533
4.243	20.043
4.255	18.335
4.256	18.929
4.284	20.935
4.392	21.902
4.405	21.308
4.433	22.274
4.500	23.388
4.742	24.432
4.860	21.389
4.888	23.840
4.964	18.717
4.992	20.203
5.035	23.471
5.074	21.912
5.115	22.878
5.168	22.582
5.198	25.701
5.232	19.538
5.275	21.989
5.285	19.242
5.339	19.837
5.434	21.175
5.476	22.660
5.514	20.285
5.518	24.666
5.659	18.430
5.700	19.916
5.702	22.144
5.713	18.951
5.715	21.030
5.741	20.585
5.808	20.512
5.810	22.888
5.821	19.695
5.955	20.737
6.010	22.594
6.020	18.807
6.038	23.114
6.050	22.075
6.088	20.070
6.145	23.933
6.167	18.512
6.184	21.854
6.186	24.676
6.196	20.443
6.196	21.186
6.247	17.697
6.264	22.449
6.276	20.147
6.292	24.009
6.301	18.811
6.344	22.153
6.426	24.011
6.491	22.156
6.516	20.003
6.543	19.706
6.570	20.375
6.611	21.860
6.743	20.006
6.838	21.715
6.958	21.346
6.971	20.306
6.986	22.534
7.026	21.867
7.081	23.575
7.120	22.536
7.144	19.938
7.225	20.533
7.253	21.647
7.331	19.792
7.748	21.877
8.309	21.292
10.008	23.025];
data.tL(:,1) = 365 * (data.tL(:,1) + 0); % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time', 'std length'};  
temp.tL    = C2K(27.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'VealCoul2015';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';     
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00479*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '75Z72'; % Cat of Life
metaData.links.id_ITIS = '650216'; % ITIS
metaData.links.id_EoL = '46580093'; % Ency of Life
metaData.links.id_Wiki = 'Pelates'; % Wikipedia
metaData.links.id_ADW = 'Pelates_octolineatus'; % ADW
metaData.links.id_Taxo = '183360'; % Taxonomicon
metaData.links.id_WoRMS = '274000'; % WoRMS
metaData.links.id_fishbase = 'Pelates-octolineatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pelates}}';
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
bibkey = 'VealCoul2015'; type = 'Article'; bib = [ ... 
'doi = {10.1071/MF14079}' ...
'author = {Veale, L. and P. Coulson and N. Hall and A. Hesp and I.C. Potter}, ' ... 
'year = {2015}, ' ...
'title = {Age and size compositions, habitats, growth and reproductive characteristics of a terapontid (\emph{Pelates octolineatus}) in coastal waters}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {66(6)}, ' ...
'pages = {535-548}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {https://www.fishbase.de/summary/Pelates-octolineatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

