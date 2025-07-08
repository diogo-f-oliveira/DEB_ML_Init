function [data, auxData, metaData, txtData, weights] = mydata_Haemulon_sexfasciatum
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Haemulidae';
metaData.species    = 'Haemulon_sexfasciatum'; 
metaData.species_en = 'Greybar grunt'; 

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
  
data.Lp  = 35; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 71;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of Lutjanus stellatus: pi/6*0.085^3'; 
data.Wwp = 1156;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.02512*Lp^3.02, see F1';
data.Wwi = 9791; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02512*Li^3.02, see F1; max. published weight: 2.3 kg';

data.Ri  = 2.2e6/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Haemulon_album';
  
% uni-variate data
% time-length
data.tL = [ ... % time (D), total length (cm)
    1  5.91
    2 11.24
    3 15.91
    4 20.00
    5 23.59
    6 26.73
    7 29.49
    8 31.09
    9 34.01
   10 35.87
   11 37.49
   12 38.92
   13 40.16
   14 41.26
   15 42.22
   16 43.05
   17 43.79];
data.tL(:,1) = (data.tL(:,1) + 0.1)*365;  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CruzEspi1993';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
11.030	184.472
16.533	148.932
16.793	186.896
17.473	243.964
17.849	196.804
18.998	315.584
19.269	258.915
19.277	197.404
19.838	363.256
19.959	240.278
20.384	226.261
20.795	321.071
21.211	378.029
21.222	288.128
21.951	383.072
21.958	326.292
22.537	350.195
22.847	407.108
23.534	407.397
24.162	464.443
25.277	427.057
25.900	517.225
25.993	626.097
26.156	588.310
26.583	555.367
27.103	626.564
27.463	711.888
28.095	726.350
28.317	646.002
28.933	792.949
29.241	873.520
29.825	854.838
29.886	788.617
29.891	741.301
30.461	836.178
30.731	798.436
30.826	883.650
31.362	822.361
31.461	874.454
31.563	912.351
31.769	955.025
32.866	1059.587
33.171	1159.084
33.291	1045.570
33.630	1301.233
33.709	1088.333
34.192	1457.621
34.266	1287.305
34.658	1112.391
35.135	1098.396
35.408	1462.864
35.995	1420.524
36.310	1434.853
36.532	1349.772
36.810	1236.325
37.013	1312.120
37.039	1525.065
37.337	1681.341
37.474	1430.610
38.374	1847.393
38.646	1790.725
38.780	1558.920
38.928	1218.288
39.711	2155.526
39.757	1781.728
39.771	1672.901
39.863	2207.640
39.927	2117.762
41.187	1768.134
42.759	2738.827
43.168	2421.964
43.826	1802.367];
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
F1 = 'weight-length relationship: W in g = 0.02512*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6L8DT'; % Cat of Life
metaData.links.id_ITIS = '630238'; % ITIS
metaData.links.id_EoL = '46578485'; % Ency of Life
metaData.links.id_Wiki = 'Haemulon'; % Wikipedia
metaData.links.id_ADW = 'Haemulon_sexfasciatum'; % ADW
metaData.links.id_Taxo = '175749'; % Taxonomicon
metaData.links.id_WoRMS = '275736'; % WoRMS
metaData.links.id_fishbase = 'Haemulon-sexfasciatum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Haemulon}}';
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
'howpublished = {\url{https://www.fishbase.in/summary/Haemulon-sexfasciatum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
