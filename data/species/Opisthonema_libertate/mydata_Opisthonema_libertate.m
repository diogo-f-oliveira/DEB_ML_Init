function [data, auxData, metaData, txtData, weights] = mydata_Opisthonema_libertate

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dorosomatidae';
metaData.species    = 'Opisthonema_libertate'; 
metaData.species_en = 'Pacific thread herring'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMpe', '0iMr'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 04 26];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 04 26]; 


%% set data
% zero-variate data;

data.am = 8*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'RuizQuin2018';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 11.5;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 30; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1 to 4 mm of Opisthonema oglinum: pi/6*0.25^3';
data.Wwi = 240.5;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00832*Li^3.02, see F1; fishbase gives 375 g as max published';

data.Ri  = 57125/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'fishbase';  
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data

% time-length data
data.tL = [ % time since birth (yr), standard length (cm)
0.021	0.682
0.052	0.971
0.052	1.029
0.052	1.260
0.082	1.261
0.097	1.723
0.113	4.092
0.127	2.012
0.142	2.244
0.143	2.475
0.152	5.537
0.158	3.804
0.166	4.728
0.167	5.133
0.174	4.382
0.182	6.346
0.212	6.404
0.235	6.694
0.249	5.365
0.250	5.712
0.264	5.365
0.280	6.174
0.281	7.388
0.288	7.099
0.288	8.023
0.302	5.828
0.311	7.735
0.319	8.948
0.325	6.348
0.333	7.157
0.341	8.486
0.341	8.602
0.341	8.717
0.348	7.100
0.356	8.024
0.394	9.642
0.395	9.758
0.417	9.412
0.463	10.395
0.493	10.395
0.554	11.898
1.240	16.819
1.246	13.180
1.246	13.757
1.246	14.046
1.248	17.339
1.254	15.260
1.254	15.491
1.255	15.780
1.255	16.126
1.255	16.357
1.269	15.029
1.269	15.144
1.277	14.913
1.284	14.451
1.284	14.625
1.744	16.712
1.752	17.520
1.757	13.650
1.758	16.192
1.759	16.654
1.765	14.285
1.765	14.516
1.765	14.805
1.765	14.979
1.765	15.152
1.765	15.210
1.765	15.325
1.765	15.614
1.766	15.961
2.239	16.026
2.263	17.817
2.263	18.048
2.263	18.742
2.269	14.755
2.269	14.929
2.269	15.218
2.269	15.622
2.270	17.586
2.278	17.413
2.285	16.778
2.285	16.893
2.285	17.240
2.759	18.403
2.765	15.052
2.766	18.345
2.767	18.807
2.773	15.919
2.773	16.207
2.773	16.554
2.773	17.247
2.774	17.594
2.774	17.883
2.781	16.843
3.194	17.427
3.233	19.334
3.254	15.753
3.254	16.099
3.254	16.446
3.254	17.197
3.262	16.908
3.263	18.699
3.270	17.775
3.270	18.006
3.270	18.179
3.759	18.534
3.759	18.649
3.759	18.822
3.759	19.054
3.759	19.111
3.759	19.227
3.759	19.516
3.759	19.747
3.765	16.974
3.765	17.320
3.766	17.667
3.766	18.014
3.766	18.245
4.255	18.541
4.255	19.177
4.255	19.697
4.261	16.924
4.262	18.252
4.262	18.426
4.262	18.830
4.262	18.946
4.263	19.928
4.263	20.621
4.269	17.559
4.269	17.906
4.269	18.079
4.759	19.993
4.759	20.571
4.766	19.647
4.773	19.011
4.773	19.242
4.774	20.802
4.780	17.914
4.780	17.914
4.780	18.145
4.781	18.376
4.781	18.549
4.781	18.838
5.233	20.347
5.240	19.943
5.247	19.539
5.248	20.463
5.254	19.019
5.254	19.308
5.262	18.672
5.758	19.835
5.765	19.200
5.766	19.431
5.766	20.067
5.766	20.240
5.766	20.587
5.766	20.587];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2)/ 0.8; % convert SL to TL, on the basis of photo
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RuizQuin2018';
comment.tL = 'Data from Bahia Magdalena';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00832*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6SR7F'; % Cat of Life
metaData.links.id_ITIS = '161750'; % ITIS
metaData.links.id_EoL = '46562456'; % Ency of Life
metaData.links.id_Wiki = 'Opisthonema_libertate'; % Wikipedia
metaData.links.id_ADW = 'Opisthonema_libertate'; % ADW
metaData.links.id_Taxo = '182008'; % Taxonomicon
metaData.links.id_WoRMS = '275504'; % WoRMS
metaData.links.id_fishbase = 'Opisthonema-libertate'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Opisthonema_libertate}}';
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
bibkey = 'RuizQuin2018'; type = 'Article'; bib = [ ... 
'author = {Marcelino Ruiz-Dom\''{i}nguez and Casimiro Quinonez-Vel\''{a}zquez}, ' ... 
'year = {2018}, ' ...
'title = {Age, growth, and mortality of \emph{Opisthonema libertate} on the coasts of northwestern {M}exico}, ' ...
'journal = {Ciencias Marinas}, ' ...
'volume = {44}, ' ...
'pages = {235-250}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Opisthonema-libertate.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
  
