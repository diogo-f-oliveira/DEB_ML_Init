function [data, auxData, metaData, txtData, weights] = mydata_Heteromycteris_japonicus

%% set metaData 
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Soleidae';
metaData.species    = 'Heteromycteris_japonicus'; 
metaData.species_en = 'Bamboo sole'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp','jiMcb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz','jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.5); % K, body temp
metaData.data_0     = {'ab';'ap';'am';'Lp';'Li';'Wb';'Wwp';'Wwi';'GSI'}; 
metaData.data_1     = {'t-L'; 't-Ww';'L-Ww'}; 

metaData.COMPLETE = 3.5; % using criteria of LikaKear2011 

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 03 16];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 16];

%% set data
% zero-variate data

data.ab = 8.5;    units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(17.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 12 * 365;    units.am = 'd';    label.am = 'life span'; bibkey.am = 'YamaKata2013';  
  temp.am = C2K(17.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am ='temp bibkey.temp.am=Vina2007 page 21 = average yearly temperature of tagus estuary';

data.Lp  = 7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'YamaKata2013'; 
data.Li  = 15.8;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'YamaKata2013';   

data.Wwb = 1.4e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg dimater of 0.65 mm of Dicologlossa cuneata: pi/6*0.065^3'; 
data.Wwp = 3.8;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'YamaKata2013','fishbase'};
  comment.Wwp = 'based on 0.00977*Lp^3.07, see F1';
data.Wwi = 46.7;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'YamaKata2013','fishbase'};
  comment.Wwi = 'based on 0.00977*Li^3.07, see F1';
     
data.GSI  = 0.1; units.GSI  = '-'; label.GSI  = 'gonadosomatic index';   bibkey.GSI  = 'YamaKata2013';   
  temp.GSI = C2K(17.5);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm),
0.012	0.719
0.024	1.079
0.060	1.583
0.131	1.080
0.132	2.123
0.132	2.374
0.179	1.620
0.180	3.561
0.190	0.649
0.191	2.626
0.191	2.878
0.238	2.052
0.240	4.532
0.250	2.519
0.274	3.310
0.297	1.800
0.298	2.771
0.320	1.333
0.321	2.196
0.323	4.785
0.347	5.109
0.357	2.556
0.407	6.583
0.417	4.139
0.488	4.535
0.513	6.009
0.547	4.140
0.571	5.147
0.632	7.628
1.083	10.005
1.368	11.913
1.403	11.123
1.404	12.453
1.416	12.058
1.450	10.800
1.462	11.123
1.463	11.627
1.509	10.656
1.521	10.189
1.522	11.411
1.640	11.125
1.651	10.010
1.663	10.622
1.685	9.004
1.723	12.060
1.843	14.363
1.959	10.552
2.009	14.472
2.114	13.574
2.126	12.567
2.149	12.819
2.174	13.826
2.185	13.431
2.186	14.114
2.315	12.533
2.326	11.850
2.410	13.577
2.445	13.182
2.504	12.247
2.505	14.800
2.551	12.535
2.563	12.931
2.633	11.673
2.645	11.314
2.656	10.631
2.669	12.680
2.811	12.861
2.824	13.580
2.835	13.329
2.848	14.048
2.858	12.394
2.906	13.150
2.941	12.647
3.060	12.648
3.072	13.583
3.131	12.792
3.190	12.937
3.379	13.154
3.496	11.897
3.508	12.112
3.710	13.301
3.794	15.135
3.805	14.093
3.840	12.906
3.842	14.920
3.876	13.374
3.888	13.806
3.924	14.238
4.018	13.951
4.077	13.951
4.161	14.635
4.419	13.020
4.490	12.589
4.704	13.849
4.858	14.821
4.904	12.772
4.976	14.031
4.999	13.420
5.058	13.744
5.094	14.428
5.130	14.105
5.153	13.494
5.330	13.100
5.484	13.604
5.828	15.441
5.922	14.112
5.993	14.580
6.028	13.969
6.844	13.581
6.903	13.941
6.927	14.193
7.151	13.691
7.163	14.518
7.848	13.662
8.309	12.911
9.008	14.499
11.172	15.921];
data.tL_f(:,1) = (0.1 + data.tL_f(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-5; end ;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length'};  
temp.tL_f    = C2K(18.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'YamaKata2013';
%
data.tL_m = [ ...
0.812	11.081
0.905	9.464
0.928	8.566
0.988	9.213
1.073	12.306
1.097	11.983
1.344	10.295
1.461	9.721
1.603	9.614
1.652	11.197
1.746	11.521
1.805	10.551
1.830	12.133
1.840	9.976
1.877	11.666
1.923	10.984
1.946	9.222
1.959	11.739
2.006	11.308
2.100	10.410
2.114	12.316
2.148	10.842
2.160	11.273
2.161	11.921
2.432	11.959
2.444	11.312
2.502	10.737
2.515	11.420
2.669	12.069
2.680	11.098
2.905	11.316
2.929	12.323
2.987	11.101
3.000	11.928
3.025	13.654
3.035	10.814
3.106	11.677
3.153	11.750
3.154	11.929
3.155	13.979
3.213	12.038
3.296	12.758
3.402	11.896
3.462	12.867
3.756	11.288
3.792	12.223
3.899	12.583
3.911	12.260
3.970	12.908
4.407	11.689
4.915	11.837
4.986	11.874
5.991	12.315
6.038	11.668
6.145	12.316
7.008	12.575
7.079	12.576
7.127	13.331
7.434	13.011
8.002	13.771
9.018	12.809];
data.tL_m(:,1) = (0.1 + data.tL_m(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-5; end ;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length'};  
temp.tL_m    = C2K(18.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'YamaKata2013';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.tL_f = 5* weights.tL_f; 
weights.tL_m = 5* weights.tL_m; 

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00977*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6M4XC'; % Cat of Life
metaData.links.id_ITIS = '616572'; % ITIS
metaData.links.id_EoL = '46570325'; % Ency of Life
metaData.links.id_Wiki = 'Heteromycteris_japonicus'; % Wikipedia
metaData.links.id_ADW = 'Heteromycteris_japonicus'; % ADW
metaData.links.id_Taxo = '176609'; % Taxonomicon
metaData.links.id_WoRMS = '278103'; % WoRMS
metaData.links.id_fishbase = 'Heteromycteris-japonicus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Heteromycteris_japonicus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{http://www.bio.vu.nl/thb/research/bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'YamaKata2013'; type = 'Article'; bib = [ ... 
'author = {Masayuki Yamamoto and Satoshi Katayama}, ' ... 
'year   = {2013}, ' ...
'title  = {Age, Growth, and Spawning Period of Bamboo Sole \emph{Heteromycteris japonica} in the {S}eto {I}nland {S}ea, {J}apan}, ' ...
'journal= {Aquaculture Sci.}, ' ...
'volume = {61(4)}, ' ...
'number = {3-4}, '...
'pages  = {359－365}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];  
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Heteromycteris-japonicus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

