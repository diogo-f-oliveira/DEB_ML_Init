function [data, auxData, metaData, txtData, weights] = mydata_Serranus_hepatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Serranus_hepatus'; 
metaData.species_en = 'Brown comber'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 21];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 21];

%% set data
% zero-variate data
data.am = 11*365;    units.am = 'd';    label.am = 'life span'; bibkey.am = 'SoykTurk2013';
  temp.am = C2K(18.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 7.8;   units.Lp = 'cm';  label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 25;   units.Li = 'cm';  label.Li = 'ultimate total length'; bibkey.Li  = 'fishbase'; 

data.Wwb = 1.9e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess'; 
  comment.Wwb = 'based on egg diameter of 0.712 mm of Serranus scriba: pi/6*0.0712^3';   
data.Wwp = 6;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase'; 
  comment.Wwi = 'based on 0.01175*Lp^3.04, see F1';
data.Wwi = 209;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.01175*Li^3.04, see F1';

data.GSI  = 0.05; units.GSI  = '-'; label.GSI  = 'gonado somatic index'; bibkey.GSI = 'SoykTurk2013';   
  temp.GSI = C2K(17); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [... % yr class (yr), total length at f and T
    0  5.68
    1  8.35
    2  9.81
    3 10.75
    4 11.23];  
data.tL (:,1)= (data.tL (:,1) + 1) * 365; % convert yt class to time since birth in days 
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(18.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Bile2009'; 

% length-weight
data.LW = [ ...
4.182	0.740
4.214	0.851
4.623	1.354
4.780	1.076
4.843	1.411
5.031	1.523
5.283	1.580
5.314	1.691
5.503	1.859
5.660	2.082
5.692	1.971
5.818	2.250
5.849	2.752
6.069	2.697
6.069	2.641
6.132	2.140
6.164	2.307
6.195	2.920
6.258	3.199
6.384	3.422
6.415	3.366
6.447	4.035
6.541	3.478
6.572	3.367
6.635	3.702
6.730	4.259
6.730	3.813
6.761	4.649
6.792	4.761
6.855	3.925
6.918	3.535
6.981	5.263
7.013	4.984
7.013	4.093
7.044	5.597
7.138	4.428
7.170	5.820
7.170	3.815
7.201	5.152
7.233	4.985
7.327	5.097
7.358	4.596
7.390	6.267
7.390	5.264
7.421	6.156
7.453	6.769
7.484	7.159
7.484	5.432
7.547	7.382
7.547	5.543
7.642	5.377
7.673	4.875
7.704	6.435
7.704	5.878
7.799	6.937
7.799	5.767
7.862	7.940
7.862	6.102
7.893	6.715
7.987	7.216
7.987	6.938
7.987	5.656
8.050	7.885
8.050	6.269
8.176	6.716
8.208	7.384
8.239	8.666
8.270	7.886
8.365	8.778
8.365	7.106
8.365	6.549
8.396	8.221
8.428	7.385
8.459	9.948
8.459	8.277
8.491	7.274
8.491	7.720
8.585	9.280
8.616	9.558
8.616	8.667
8.679	7.609
8.711	8.389
8.742	11.119
8.742	10.450
8.742	7.219
8.774	7.888
8.805	9.782
8.805	10.172
8.805	9.281
8.868	8.779
8.868	8.334
8.931	9.615
8.962	7.944
8.994	10.785
9.025	11.621
9.057	11.900
9.057	10.173
9.057	8.390
9.088	9.393
9.088	8.947
9.119	10.563
9.151	12.179
9.151	8.279
9.214	11.343
9.214	10.953
9.214	9.004
9.245	11.678
9.245	10.954
9.245	9.784
9.277	12.792
9.277	12.346
9.340	13.182
9.340	8.280
9.434	12.403
9.434	11.957
9.434	10.174
9.434	10.676
9.434	9.227
9.465	14.186
9.465	12.737
9.465	11.344
9.497	11.122
9.528	9.840
9.560	13.072
9.560	10.230
9.560	9.562
9.591	12.570
9.591	10.453
9.623	15.133
9.623	11.735
9.654	14.242
9.654	13.629
9.654	13.239
9.686	12.794
9.686	11.289
9.717	15.691
9.717	10.788
9.748	12.125
9.748	11.067
9.780	13.518
9.811	15.468
9.811	12.794
9.843	14.466
9.874	13.909
9.906	15.023
9.906	11.959
9.906	11.513
9.969	13.630
9.969	13.185
9.969	12.628
10.000	12.405
10.031	18.032
10.063	15.581
10.063	15.302
10.063	14.076
10.063	13.686
10.094	16.249
10.094	13.575
10.094	11.681
10.126	14.634
10.126	13.130
10.157	17.085
10.157	16.862
10.157	16.695
10.189	12.740
10.220	16.361
10.220	14.300
10.252	18.812
10.252	17.253
10.252	15.136
10.252	12.127
10.314	18.088
10.314	15.470
10.314	14.412
10.346	15.414
10.346	13.966
10.377	13.242
10.377	12.852
10.409	17.142
10.409	18.033
10.409	15.972
10.409	14.913
10.409	12.796
10.440	13.632
10.440	12.462
10.472	14.524
10.503	19.649
10.503	17.699
10.503	15.359
10.535	16.752
10.535	16.585
10.566	20.652
10.597	21.766
10.597	15.750
10.597	13.688
10.629	18.090
10.629	13.354
10.660	19.148
10.660	16.808
10.692	19.427
10.692	14.692
10.692	14.023
10.723	19.873
10.723	19.093
10.723	16.196
10.755	17.366
10.786	20.709
10.786	18.592
10.786	17.923
10.786	15.305
10.849	16.419
10.849	17.032
10.849	15.249
10.849	14.358
10.881	13.912
10.912	19.205
10.912	15.918
10.943	20.152
10.943	16.364
10.943	14.971
11.006	18.704
11.006	18.425
11.006	18.091
11.006	17.534
11.006	16.141
11.038	22.102
11.038	19.261
11.038	18.203
11.069	16.977
11.101	19.874
11.101	20.097
11.132	20.821
11.195	21.880
11.195	17.646
11.226	18.203
11.226	15.696
11.258	23.496
11.289	19.708
11.289	19.039
11.289	16.644
11.321	19.206
11.352	20.711
11.352	19.875
11.352	17.201
11.352	16.755
11.384	25.112
11.384	23.552
11.384	20.989
11.384	18.705
11.415	21.379
11.415	20.210
11.447	25.725
11.447	22.549
11.447	20.154
11.447	18.928
11.447	18.650
11.478	26.672
11.478	17.926
11.509	23.107
11.509	23.385
11.509	17.313
11.541	21.213
11.572	20.433
11.635	25.837
11.635	17.258
11.667	19.988
11.667	19.486
11.698	21.826
11.761	23.665
11.792	25.281
11.824	21.270
11.855	24.501
11.855	22.718
11.887	28.846
11.950	21.493
11.981	20.824
12.170	28.402
12.170	26.675
12.453	28.960
12.484	22.219
12.516	29.851
12.516	27.679
12.547	23.946
12.579	33.417
12.579	26.119
12.862	31.914
13.208	31.971];
units.LW   = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'SoykTurk2013'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
% auxData.length = length;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'kap_R is set to 0.95/2 because of being hermaphroditic';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01175*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Hermaphroditic';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4WX32'; % Cat of Life
metaData.links.id_ITIS = '167863'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Serranus_hepatus'; % Wikipedia
metaData.links.id_ADW = 'Serranus_hepatus'; % ADW
metaData.links.id_Taxo = '187457'; % Taxonomicon
metaData.links.id_WoRMS = '127042'; % WoRMS
metaData.links.id_fishbase = 'Serranus-hepatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Serranus_hepatus}}';
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
bibkey = 'Bile2009'; type = 'Article'; bib = [ ... 
'author = {Murat Bilecenoglu}, ' ... 
'year = {2009}, ' ...
'title = {Growth and feeding habits of the brown comber, \emph{Serranus hepatus} ({L}innaeus, 1758) in {I}zmir {B}ay, {A}egean {S}ea}, ' ...
'journal = {Acta Adriat.}, ' ...
'volume = {50(1)}, ' ...
'pages = {105-110}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SoykTurk2013'; type = 'Article'; bib = [ ... 
'doi = {10.3906/zoo-1203-34}' ...
'author = {Ozan Soykan and Akin T\"{u}rker and Ilkyaz and G\"{u}lnur Metin and Hasan Tuncay Kinacigil}, ' ... 
'year = {2013}, ' ...
'title = {Growth and reproduction of brown comber (\emph{Serranus hepatus} {L}innaeus, 1758) in the central {A}egean {S}ea, Turkey}, ' ...
'journal = {Turkish Journal of Zoology}, ' ...
'volume = {37(2)}, ' ...
'pages = {105-110}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Serranus-hepatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
