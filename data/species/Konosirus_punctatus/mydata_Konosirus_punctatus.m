function [data, auxData, metaData, txtData, weights] = mydata_Konosirus_punctatus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dorosomatidae';
metaData.species    = 'Konosirus_punctatus'; 
metaData.species_en = 'Dotted gizzard shad '; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMpe', '0iMr'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 11];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 11];

%% set data
% zero-variate data;

data.ab = 12.5;     units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';    
  temp.ab = C2K(20.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(20.3);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 15;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 32; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 2.8e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.75 mm of Clupanodon thrissa: pi/6*0.175^3';
data.Wwp = 34.3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00912*Lp^3.04, see F2';
data.Wwi = 343;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00912*Li^3.04, see F2';

data.Ri = 5e4/365;  units.Ri = '#/d';    label.Ri = 'max reprod rate';  bibkey.Ri = 'guess';   
  temp.Ri = C2K(20.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Clupanodon thrissa';

% uni-variate data

% time-length
data.tL1 = [ % time since birth (yr), std length (cm), weight (g)
0.932	15.466
0.932	15.533
0.932	15.600
0.941	14.963
0.941	15.298
0.941	15.432
0.949	14.057
0.949	16.406
0.949	17.043
0.949	16.775
0.966	16.103
0.975	14.392
1.924	18.780
1.924	18.444
1.932	18.713
1.932	16.766
1.941	19.048
1.949	19.283
1.949	19.149
1.949	18.377
1.958	18.645
1.958	18.478
1.958	18.075
1.958	18.075
1.958	17.974
1.958	17.001
1.966	19.820
1.966	17.538
1.966	17.236
1.966	16.330
2.932	19.644
2.932	21.053
2.932	21.053
2.941	20.785
2.941	20.885
2.949	21.187
2.949	22.496
2.958	19.342
2.958	20.583
2.958	21.322
2.958	21.456
2.958	22.060
2.958	22.161
2.966	19.073
2.966	21.556
2.966	21.791
2.975	20.248
3.924	23.897
3.924	21.951
3.932	21.716
3.941	22.991
3.941	22.656
3.941	22.756
3.949	23.528
3.949	22.521
3.949	22.521
3.949	22.454
3.949	22.320
3.949	22.219
3.949	21.213
3.958	23.226
3.966	24.434
4.932	23.553
4.932	24.057
4.932	23.721
4.941	23.050
4.941	24.694
4.941	24.996
4.949	22.882
4.949	24.157
4.949	24.224
4.949	24.392
4.958	23.922
4.966	23.318];
data.tL1(:,1) = (data.tL1(:,1)+0.5)*365; % convert yr to d, set origin at birth
for i=2:size(data.tL1,1);if data.tL1(i,1)<=data.tL1(i-1,1);data.tL1(i,1)=data.tL1(i-1,1)+1e-3;end;end 
units.tL1 = {'d', 'cm'};  label.tL1 = {'time since birth', 'total length'};  
temp.tL1 = C2K(20.3);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'YuJeon2024'; 
comment.tL1 = 'Data from Anmyeondo and Yeosu (AN+YEO)';

data.tL2 = [ ... % time since birth (yr), total length (cm)
1.017	11.036
1.017	12.110
1.025	13.150
1.034	12.646
1.034	12.781
1.042	12.378
1.042	11.774
1.042	11.975
1.051	11.438
1.051	12.311
1.051	12.848
1.059	11.673
2.008	13.511
2.025	14.282
2.025	13.813
2.025	13.813
2.025	13.276
2.034	15.625
2.034	14.752
2.042	16.027
2.042	15.088
2.042	14.819
2.051	16.128
2.051	15.289
2.051	15.020
2.051	14.953
2.051	14.819
2.051	14.551
2.051	14.047
2.051	13.410
3.034	17.831
3.042	15.281
3.051	15.717
3.051	16.153
3.051	16.489
3.051	17.026
3.051	17.160
3.051	17.227
3.059	16.421
3.059	16.556
3.059	16.723
3.068	16.052
3.068	16.656
3.068	16.824
3.068	18.133
3.076	17.529
4.025	18.360
4.034	19.131
4.042	18.896
4.042	18.796
4.042	18.695
4.042	18.561
4.042	18.460
4.042	18.158
4.042	17.386
4.051	17.923
4.059	19.500
4.068	19.735
5.034	19.358
5.034	19.828
5.034	19.828
5.034	19.962
5.034	20.029
5.034	20.197
5.042	19.526
5.051	19.794
5.051	20.465
5.059	19.089
5.059	19.660
5.059	20.700
5.076	18.418
5.076	18.586
5.076	18.686];
data.tL2(:,1) = (data.tL2(:,1)+0.5)*365; % convert yr to d, set origin at birth
for i=2:size(data.tL2,1);if data.tL2(i,1)<=data.tL2(i-1,1);data.tL2(i,1)=data.tL2(i-1,1)+1e-3;end;end 
units.tL2 = {'d', 'cm'};  label.tL2 = {'time since birth', 'total length'};  
temp.tL2 = C2K(20.3);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'YuJeon2024'; 
comment.tL2 = 'Data from Jumunjin (JU)';

%% set weights for all real data
weights = setweights(data, []);
weights.tL1 = 3 * weights.tL1;
weights.tL2 = 3 * weights.tL2;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL1', 'tL2'}; subtitle1 = {'Data for AN+YEO and JU'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'I had to add 1 yr to age-estimates to arrive at a good fit for tL and tW data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: W in g = 0.00912*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'WCNG'; % Cat of Life
metaData.links.id_ITIS = '161811'; % ITIS
metaData.links.id_EoL = '46562502'; % Ency of Life
metaData.links.id_Wiki = 'Konosirus_punctatus'; % Wikipedia
metaData.links.id_ADW = 'Konosirus_punctatus'; % ADW
metaData.links.id_Taxo = '171465'; % Taxonomicon
metaData.links.id_WoRMS = '280223'; % WoRMS
metaData.links.id_fishbase = 'Konosirus-punctatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Konosirus_punctatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseud46562424odata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'YuJeon2024'; type = 'Article'; bib = [ ...
'doi = {10.7541/2023.2022.0036}, ' ...
'author = {Min-su Yu and Jae-Hoon Jeong and Hye-Kyoung Choi and Jeong-Min Seo and Chul-Woong Oh}, ' ... 
'year = {2024}, ' ...
'title = {Identification of \emph{Konosirus punctatus} ({T}emminic and {S}chlegel, 1846) stocks in {K}orean waters via otolith shape analysis and comparison of growth parameters }, ' ...
'journal = {Regional Studies in Marine Science}, ' ...
'volume = {76}, ' ...
'pages = {103581}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Konosirus-punctatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

  
