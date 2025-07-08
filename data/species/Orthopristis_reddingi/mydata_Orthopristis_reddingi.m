function [data, auxData, metaData, txtData, weights] = mydata_Orthopristis_reddingi
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Haemulidae';
metaData.species    = 'Orthopristis_reddingi'; 
metaData.species_en = 'Bronze-striped grunt'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22.3); % K, body temp
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

data.am = 12*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'CruzEspi1993';   
  temp.am = C2K(22.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 15; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 29.8;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of Lutjanus stellatus: pi/6*0.085^3'; 
data.Wwp = 100;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = {'guess','CruzEspi1993'};
  comment.Wwp = 'based on LW data';
data.Wwi = 600; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on LW data; 0.01175*Li^2.98 gives 290.5 g, see F1; max. published weight: 600 g';

data.Ri  = 2.2e5/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(22.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Haemulon_album: 2.2e6*600/5926';
  
% uni-variate data
% time-length
data.tL = [ ... % time (D), total length (cm)
    1  4.28
    2  8.36
    3 11.92
    4 15.04
    5 17.77
    6 20.16
    7 22.25
    8 24.07
    9 25.67
   10 27.07
   11 28.29
   12 29.36];
data.tL(:,1) = (data.tL(:,1) + 0)*365;  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(22.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CruzEspi1993';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
12.982	74.982
13.998	80.984
14.478	100.460
14.747	112.767
14.996	96.254
15.552	101.306
15.993	110.495
16.494	153.644
16.549	110.399
16.664	114.497
16.819	143.294
16.975	193.708
17.010	130.908
17.337	143.205
17.471	147.300
17.528	139.055
17.799	182.244
17.874	152.378
18.090	239.841
18.298	195.540
18.626	226.367
19.029	240.709
19.050	277.764
19.164	253.039
19.391	199.470
19.514	349.743
19.645	287.956
19.893	262.178
20.069	323.913
20.221	298.152
20.414	336.207
20.450	293.995
20.522	203.394
20.545	278.537
20.625	335.141
20.660	263.076
20.664	343.370
20.797	329.964
20.964	216.701
21.086	353.591
21.236	279.448
21.238	324.742
21.520	224.840
21.586	386.447
21.624	369.970
21.835	374.051
22.039	244.310
22.125	422.384
22.239	406.923
22.256	352.361
22.409	361.600
22.572	522.160
22.594	232.892
22.660	391.410
22.736	373.897
22.945	344.008
23.015	223.555
23.103	421.187
23.309	335.710
23.387	361.432
23.449	434.510
23.527	467.437
23.646	190.505
23.658	404.621
23.832	443.708
24.084	484.842
24.131	299.540
24.303	293.334
24.486	476.538
24.650	313.862
24.727	328.261
24.844	356.035
25.068	602.026
25.088	272.611
25.367	465.063
25.504	522.686
25.550	302.384
25.787	422.785
26.071	371.266
26.594	463.823
27.053	452.421
28.057	582.984
28.995	553.999
29.841	602.236];
units.LW   = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'CruzEspi1993'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 15 * weights.tL;
weights.Wwi = 2 * weights.Wwi;
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
F1 = 'weight-length relationship: W in g = 0.01175*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6T93P'; % Cat of Life
metaData.links.id_ITIS = '630258'; % ITIS
metaData.links.id_EoL = '46578497'; % Ency of Life
metaData.links.id_Wiki = 'Orthopristis_reddingi'; % Wikipedia
metaData.links.id_ADW = 'Orthopristis_reddingi'; % ADW
metaData.links.id_Taxo = '182227'; % Taxonomicon
metaData.links.id_WoRMS = '275745'; % WoRMS
metaData.links.id_fishbase = 'Orthopristis-reddingi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Orthopristis_reddingi}}';
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
'howpublished = {\url{https://www.fishbase.in/summary/Orthopristis-reddingi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
