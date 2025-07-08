  function [data, auxData, metaData, txtData, weights] = mydata_Coilia_mystus
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Coilia_mystus'; 
metaData.species_en = 'Osbeck''s grenadier anchovy'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'TPi','MPW'};
metaData.ecoCode.habitat = {'0iFr','0iFl'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 06 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 17];

%% set data
% zero-variate data
data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28.7);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 15;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
  comment.Lp = 'based on Coilia_dussumieri';
data.Li = 21;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm of Coilia_dussumieri: pi/6*0.08^3';
data.Wwp = 11.8;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.00275*Lp^3.09, see F1';
data.Wwi = 33.5;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00275*Li^3.09, see F1';

data.Ri  = 21334/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';  
  temp.Ri = C2K(28.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Coilia_dussumieri';

% uni-variate data
data.tL = [ ... % time since brth (yr), total length (cm)
0.225	6.648
0.231	4.509
0.231	5.697
0.231	5.935
0.237	4.232
0.238	7.361
0.243	2.291
0.243	4.113
0.244	5.024
0.244	5.380
0.244	6.172
0.245	6.925
0.308	7.121
0.314	3.953
0.320	3.200
0.320	3.794
0.320	4.824
0.320	5.141
0.321	5.695
0.321	5.735
0.321	6.052
0.321	6.131
0.321	6.844
0.321	7.557
0.321	7.755
0.322	8.665
0.322	9.616
0.327	5.378
0.327	6.368
0.328	7.398
0.328	7.952
0.328	8.349
0.333	4.309
0.333	4.546
0.334	6.527
0.335	9.140
0.339	4.665
0.397	5.456
0.397	6.050
0.402	3.159
0.403	4.782
0.404	6.327
0.404	6.723
0.404	7.357
0.404	7.634
0.405	9.020
0.405	9.654
0.410	5.653
0.410	5.812
0.411	7.951
0.412	10.010
0.416	5.059
0.417	7.752
0.418	9.376
0.424	8.267
0.424	8.465
0.424	8.703
0.430	7.000
0.480	4.583
0.480	5.375
0.486	3.553
0.486	4.028
0.486	5.652
0.486	5.810
0.493	5.929
0.493	6.325
0.493	6.879
0.494	7.869
0.494	7.988
0.498	3.869
0.499	4.344
0.500	8.938
0.501	10.760
0.505	4.820
0.506	6.562
0.506	7.315
0.506	7.671
0.507	8.265
0.513	7.473
0.513	8.542
0.514	9.928
0.659	7.430
0.660	8.341
0.665	6.756
0.673	10.796
0.674	12.736
0.679	8.103
0.679	8.617
0.679	8.974
0.686	9.687
0.801	11.030
0.808	11.941
0.814	10.911
0.818	6.872
0.819	8.812
0.819	9.010
0.820	11.782
0.821	12.139
0.825	7.465
0.825	7.941
0.826	9.564
0.826	9.842
0.826	10.119
0.826	10.396
0.826	10.475
0.827	13.010
0.831	6.356
0.831	6.436
0.832	8.059
0.832	8.455
0.832	8.693
0.832	9.366
0.838	6.831
0.838	7.267
0.882	7.266
0.883	8.454
0.889	6.513
0.889	6.791
0.894	4.256
0.894	5.325
0.896	10.394
0.901	5.523
0.901	5.800
0.901	6.157
0.902	7.899
0.908	7.503
0.909	9.087
0.909	9.562
0.909	9.879
0.909	10.632
0.909	11.107
0.910	11.463
0.910	12.057
0.915	8.731
0.915	8.968
0.915	9.364
0.915	9.760
0.916	10.948
0.922	11.740
0.923	12.572
0.992	9.125
1.005	10.907
1.005	11.738
1.011	10.550
1.012	11.580
1.012	11.936
1.012	12.530
1.013	14.035
1.069	10.549
1.070	14.192
1.075	10.113
1.075	10.826
1.075	11.222
1.082	10.984
1.082	11.459
1.082	12.331
1.082	13.123
1.083	13.875
1.088	9.796
1.088	11.618
1.089	13.400
1.089	13.598
1.095	12.568
1.095	12.806
1.101	11.894
1.230	14.109
1.230	14.466
1.230	15.139
1.230	15.773
1.234	9.317
1.235	10.664
1.235	10.980
1.235	11.139
1.236	13.832
1.240	9.515
1.241	9.792
1.241	10.149
1.242	12.604
1.242	13.475
1.243	14.782
1.247	8.802
1.247	9.158
1.248	11.297
1.248	11.495
1.248	12.208
1.248	13.634
1.253	8.485
1.254	11.891
1.254	12.327
1.274	13.039
1.312	12.365
1.317	9.592
1.318	11.058
1.318	12.602
1.319	14.147
1.324	11.533
1.325	13.077
1.325	13.394
1.325	13.790
1.325	14.265
1.326	15.176
1.331	13.552
1.332	14.622
1.332	14.820
1.337	10.463
1.339	15.691
1.402	15.016
1.407	10.620
1.407	10.858
1.407	10.976
1.407	11.729
1.407	12.560
1.408	13.867
1.415	14.184
1.415	15.333
1.415	15.649
1.415	16.560
1.420	12.283
1.421	13.471
1.421	14.580
1.426	11.214
1.433	11.372
1.490	10.974
1.491	13.707
1.492	16.479
1.499	17.390
1.503	11.172
1.503	12.043
1.503	12.202
1.503	12.677
1.503	13.152
1.504	13.429
1.504	14.261
1.504	14.657
1.504	15.014
1.504	15.251
1.505	16.875
1.505	17.905
1.510	12.875
1.511	15.806
1.511	17.073
1.657	13.545
1.663	14.653
1.683	15.524
1.817	14.848
1.817	15.877
1.817	16.155
1.818	17.660
1.822	12.947
1.822	12.986
1.822	13.184
1.823	13.858
1.824	16.432
1.824	18.056
1.824	18.491
1.828	12.194
1.829	14.095
1.829	14.412
1.829	14.649
1.830	16.748
1.837	16.986
1.847	11.283
1.900	16.153
1.900	16.786
1.904	11.400
1.905	13.578
1.906	14.212
1.906	14.846
1.911	10.489
1.911	12.311
1.912	13.222
1.912	13.935
1.912	15.242
1.917	11.083
1.917	11.598
1.919	15.756
1.924	12.627
1.989	15.992
1.995	14.170
1.996	17.022
2.001	13.061
2.001	14.012
2.002	14.804
2.002	15.081
2.002	15.477
2.002	16.507
2.002	16.744
2.002	17.259
2.007	13.734
2.078	15.317
2.085	15.752
2.085	16.386
2.091	14.802
2.092	16.742
2.230	12.145
2.232	17.729
2.245	17.412
2.251	16.105
2.251	16.540
2.251	17.214
2.252	18.679
2.257	15.788
2.257	15.986
2.257	16.659
2.410	16.022
2.411	18.834
2.422	13.408
2.512	16.059
2.653	18.115
2.672	16.530
2.672	17.600
2.818	14.586
2.845	18.823
2.895	16.763
2.902	17.911
2.915	17.396
2.915	19.020
2.920	14.782
2.921	17.000
2.921	18.227
2.991	17.315
2.997	16.087
2.998	18.384
2.998	18.582
2.998	19.018
3.004	17.473
3.004	17.631
3.009	15.017
3.087	18.303
3.087	18.540
3.087	18.778
3.093	17.550
3.093	17.748
3.094	19.095
3.240	17.784
3.240	18.101
3.240	18.893
3.246	16.398
3.247	19.408
3.405	16.988
3.418	17.463
3.832	15.315
3.916	18.125
3.917	19.946
4.094	17.170
4.254	18.196
4.912	19.487];
data.tL(:,1) = (data.tL(:,1)+ 0.5)*365; % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(28.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'HeLi2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;
weights.ab = weights.ab * 0;
weights.Wwi = weights.Wwi * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00275*(TL in cm)^3.09'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.84*TL';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'WWGF'; % Cat of Life
metaData.links.id_ITIS = '551439'; % ITIS
metaData.links.id_EoL = '46562647'; % Ency of Life
metaData.links.id_Wiki = 'Coilia_mystus'; % Wikipedia
metaData.links.id_ADW = 'Coilia_mystus'; % ADW
metaData.links.id_Taxo = '171568'; % Taxonomicon
metaData.links.id_WoRMS = '279082'; % WoRMS
metaData.links.id_fishbase = 'Coilia-mystus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Coilia_mystus}}';  
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
bibkey = 'HeLi2008'; type = 'Article'; bib = [ ... 
'doi = {10.1051/alr/2017040}, ' ...
'author = {Wenping He and Zhongjie Li and Jiashou Liu and Yuxuan Li and Brian R. Murphy and Songguang Xie}, ' ...
'year = {2008}, ' ...
'title = {Validation of a method of estimating age, modelling growth, and describing the age composition of \emph{Coilia mystus} from the {Y}angtze {E}stuary, {C}hina}, ' ... 
'journal = {ICES J. Mar. Sci.}, ' ...
'volume = {65}, '...
'pages = {1655-1661}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Coilia-mystus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  