  function [data, auxData, metaData, txtData, weights] = mydata_Epinephelus_cyanopodus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Epinephelus_cyanopodus'; 
metaData.species_en = 'Speckled blue grouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'biMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 27];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 27];

%% set data
% zero-variate data
data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(27.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 40*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(27.8);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 64;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 122;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.3e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.76 mm: pi/6*0.076^3';
data.Wwp = 3621;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01122*Lp^3.05, see F1';
data.Wwi = 25905;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01122*Li^3.05, see F1;max. published weight: 17.3 kg';

data.Ri  = 5e6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.8);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Epinephelus_fuscoguttatus: 3287515*26000/17000';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.695	23.522
0.709	33.987
0.721	42.558
0.779	24.618
0.873	32.492
0.876	35.083
0.888	43.555
0.959	34.684
0.960	35.681
1.033	28.704
1.034	29.701
1.036	31.096
1.796	41.860
1.865	31.993
1.873	37.375
1.946	30.698
1.951	33.688
1.959	39.468
2.036	35.581
2.123	38.771
2.187	25.116
2.788	40.365
2.872	41.561
2.948	36.877
2.955	41.860
2.956	42.259
2.962	46.944
2.965	48.738
3.030	36.080
3.041	43.854
3.111	34.784
3.138	54.518
3.139	55.017
3.195	35.581
3.877	49.834
4.023	35.581
4.025	37.076
4.123	48.439
4.127	50.930
5.033	47.641]; 
data.tL(:,1) = 365 * (0.9+data.tL(:,1)); % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(27.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MaplCurr2009'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
23.508	217.786
24.787	250.454
24.984	201.452
27.836	375.681
29.115	332.123
29.607	451.906
29.902	479.129
30.098	419.238
30.393	457.350
31.082	408.349
31.672	506.352
31.967	402.904
32.656	533.575
33.148	593.466
33.541	620.690
33.541	647.913
34.131	522.686
34.328	620.690
34.623	892.922
34.623	604.356
34.918	686.025
35.115	751.361
35.410	702.359
36.098	707.804
36.295	985.481
36.492	822.142
37.377	784.029
37.574	952.813
38.459	898.367
38.852	996.370
39.246	1023.594
39.344	958.258
40.230	1301.270
40.230	838.475
40.426	1067.151
41.016	1225.045
42.492	1301.270
43.082	1328.494
43.377	1475.499
43.672	1426.497
43.869	1573.503
44.164	1600.726
45.344	1671.506
46.820	1660.617
47.213	1813.067
47.311	1911.071
47.705	2090.744
47.705	1872.958
48.492	2177.858
48.689	1905.626
49.869	2493.648
51.246	2335.753
54.295	2602.541]; 
units.LW = {'cm', 'g'}; label.LW = {'total length', 'weight'};  
bibkey.LW = 'MaplCurr2009'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwp = 0 * weights.Wwp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01122*(TL in cm)^3.05'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6FTMR'; % Cat of Life
metaData.links.id_ITIS = '551052'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Epinephelus_cyanopodus'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_cyanopodus'; % ADW
metaData.links.id_Taxo = '105876'; % Taxonomicon
metaData.links.id_WoRMS = '273845'; % WoRMS
metaData.links.id_fishbase = 'Epinephelus-cyanopodus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Epinephelus_cyanopodus}}';  
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
bibkey = 'MaplCurr2009'; type = 'techreport'; bib = [ ... 
'howpublished = {https://rrrc.org.au/wp-content/uploads/2014/06/483-JCU-Mapleston-A-et-al-2009-Comparative-biology-of-GBR-serranid-species.pdf}, ' ...
'author = {Mapleston, A. and Currey, L.M.and Williams, A.J. and Pears, R. and Simpfendorfer, C.A. and Penny, A.L. and Tobin, A. and Welch, D}, ' ... 
'year = {2009}, ' ...
'title = {Comparative biology of key inter-reefal serranid species on the Great Barrier Reef.}, ' ...
'institution = {Reef and Rainforest Research Centre Limited, Cairns}, ' ...
'volume = {Project Milestone Report to the Marine and Tropical Sciences Research Facility}, ' ...
'pages = {55pp.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Epinephelus-cyanopodus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

