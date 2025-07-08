function [data, auxData, metaData, txtData, weights] = mydata_Anisotremus_interruptus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Haemulidae';
metaData.species    = 'Anisotremus_interruptus'; 
metaData.species_en = 'Burrito grunt'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2025 02 18]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 18];

%% set data
% zero-variate data

data.am = 17*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'CruzEspi1993';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 25; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 51;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of Lutjanus stellatus: pi/6*0.085^3'; 
data.Wwp = 461;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.02512*Li^3.05, see F1';
data.Wwi = 4056; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02512*Li^3.05, see F1; max. published weight: 3.6 kg';

data.Ri  = 2.2e6/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Haemulon_album';
  
% uni-variate data
% time-length
data.tL = [ ... % time (D), total length (cm)
    1  5.82
    2 10.99
    3 15.52
    4 19.51
    5 23.00
    6 26.08
    7 28.77
    8 31.14
    9 33.22
   10 35.05
   11 36.65
   12 38.06
   13 39.03
   14 40.38
   15 41.34
   16 42.17
   17 42.91];
data.tL(:,1) = (data.tL(:,1) + 0)*365;  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CruzEspi1993';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
15.537	154.278
15.596	236.971
16.016	256.805
16.375	162.895
16.590	234.913
17.372	202.238
17.737	191.130
18.377	334.733
18.521	179.156
19.107	302.166
19.475	322.109
20.000	341.726
20.363	309.917
20.944	370.827
21.165	515.296
21.421	442.303
21.638	545.372
21.674	348.611
22.001	503.213
22.428	605.849
22.844	573.932
23.314	562.607
24.003	664.701
24.371	684.643
25.045	621.134
25.368	723.986
25.946	753.845
26.429	897.773
26.470	763.112
26.727	710.820
26.792	865.964
27.532	957.600
27.838	853.449
28.168	1049.452
28.696	1110.470
29.068	1182.163
29.302	850.416
29.483	1139.896
29.527	1036.286
29.896	1066.579
30.332	1272.716
30.904	1230.124
31.004	1178.156
31.444	1436.044
31.573	1104.513
31.709	1476.903
31.948	1207.257
32.289	1527.463
32.333	1434.203
32.586	1330.160
32.698	1423.094
32.871	1609.073
33.124	1505.030
33.159	1297.918
33.367	1908.253
33.651	1555.698
34.034	1751.593
34.134	1699.625
34.371	1398.929
34.455	1781.777
34.483	1491.864
34.670	1853.795
35.045	1956.539
35.517	1965.914
35.884	1975.506
36.491	1736.153
36.597	2367.405
37.001	1569.467
37.274	2334.946
37.942	1567.517
39.189	2714.004
39.487	2527.051
40.605	2752.481
42.316	2562.604
43.178	2861.026
45.136	3136.474
49.285	2703.453];
units.LW   = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'CruzEspi1993'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 15 * weights.tL;
weights.Wwi = 2 * weights.Wwi;
weights.Wwb = 2 * weights.Wwb;
weights.Li = 2 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.02512*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '66SWF'; % Cat of Life
metaData.links.id_ITIS = '169083'; % ITIS
metaData.links.id_EoL = '46578503'; % Ency of Life
metaData.links.id_Wiki = 'Anisotremus_interruptus'; % Wikipedia
metaData.links.id_ADW = 'Anisotremus_interruptus'; % ADW
metaData.links.id_Taxo = '160979'; % Taxonomicon
metaData.links.id_WoRMS = '279619'; % WoRMS
metaData.links.id_fishbase = 'Anisotremus-interruptus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anisotremus_interruptus}}';
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
bibkey = 'CruzEspi1993'; type = 'techreport'; bib = [ ... 
'author = {Cruz-Romero, M. and E. Espino-Barr and A. Garc\''{i}a-Boa}, ' ... 
'year = {1993}, ' ...
'title = {Aspectos poblacionales de cinco especies de la familia {H}aemulidae ({P}isces) en la costa de {C}olima, {M}exico}, ' ...
'journal = {Ciencia Pesquera. Inst. Nal. Pesca Sria. de Pesca. Mexico}, ' ...
'volume = {9}, ' ...
'pages = {43-54}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Anisotremus-interruptus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
