function [data, auxData, metaData, txtData, weights] = mydata_Physeter_macrocephalus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Physeteridae';
metaData.species    = 'Physeter_macrocephalus'; 
metaData.species_en = 'Sperm whale'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC', 'ME'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L', 't-Le'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2017 01 08];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2023 08 13];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 08 13];  

%% set data
% zero-variate data

data.tg = 502;     units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg =  'AnAge';   
  temp.tg = C2K(36);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Body temp from Orca';
data.tx = 560;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2922;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 3650;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(36);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 77*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(36);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 400;     units.Lb = 'cm';   label.Lb = 'total length at birth';        bibkey.Lb = 'ADW';
data.Li = 1100;    units.Li = 'cm';   label.Li = 'ultimate length of female';     bibkey.Li = 'ADW';
data.Lim = 2050;    units.Lim = 'cm';   label.Lim = 'ultimate length of male';    bibkey.Lim = 'ADW';

data.Wwb = 1e6;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Wiki';
data.Wwi = 14e6; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight females';   bibkey.Wwi = 'Wiki';
data.Wwim = 57e6; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'Wiki';
  
data.Ri  = .2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';       bibkey.Ri  = {'AnAge'};   
  temp.Ri = C2K(36);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 calf each 2.5 yr';
  
% uni-variate data
% time-length
data.tL = [ % time since birth (yr), length (cm)
0.597	418.204
0.597	433.788
1.393	579.272
6.900	722.334
16.853	1078.547
18.047	1024.046
20.900	1021.555
20.967	1104.674
21.100	1203.380
21.166	1055.331
21.962	1047.568
21.962	1122.893
22.957	1117.735
23.953	1024.265
24.152	1112.584
24.815	1125.596
25.081	1034.697
25.213	1055.481
25.744	1011.345
25.744	1115.241
26.872	1130.867
26.938	1006.194
26.938	1032.168
27.801	1055.577
28.000	915.325
28.000	1099.740
28.000	1112.727
28.000	1128.312
28.000	1138.701
28.000	1149.091
28.863	1081.590
28.929	1042.632
28.995	1058.219
28.995	1117.959
29.858	1089.420
29.858	1032.277
30.986	1032.319
30.986	1068.682
31.981	1029.758
31.981	1086.901
31.981	1154.433
32.910	1125.896
33.839	1081.775
34.436	1094.784
35.033	1084.417
35.033	1112.988
35.033	988.313
35.763	1053.275
35.829	1164.966
35.896	1081.851
35.896	1100.033
35.962	1131.205
36.957	1167.605
37.820	1063.741
37.953	1087.123
38.351	1071.553
38.948	1123.523
39.014	1087.162
39.943	1126.157
40.076	1014.474
41.005	1108.015
41.005	1066.457
41.735	985.964
42.000	1027.532
42.000	1053.506
43.128	1043.159
43.128	1115.886
43.924	1009.422
44.853	1061.405
44.986	897.773
44.986	1105.565
44.986	1126.345
46.047	1090.020
47.839	1136.840
48.900	1061.555
49.896	1090.163
51.886	1129.198
52.019	1079.852
52.948	1077.289
56.995	1025.491
57.858	1113.835
60.910	1145.117
63.896	1051.722];
data.tL(:,1) = 365 * data.tL(:,1);
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL  = C2K(36);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'EvanHind2004';
comment.tL = 'Data is for female';

% time - length for foetus 
data.tLe = [ ... % time since mar 1 (d), length (cm)
77.466	19.069
137.453	62.620
137.889	41.895
145.740	69.746
167.848	89.347
168.434	81.233
174.891	49.638
192.214	69.287
198.689	96.250
198.796	105.258
227.619	114.883
229.971	140.085
259.553	156.010
260.683	136.179
289.625	155.713
320.396	213.967
350.328	201.960
411.763	309.462
412.759	335.578
442.820	334.380
471.546	335.899
473.204	360.207
473.973	367.406
501.988	309.472
502.656	365.321
502.721	370.726
531.274	357.831
531.915	354.221
534.579	405.546
556.611	418.842
564.237	427.776
594.179	416.670
596.035	400.435];
units.tLe  = {'d', 'cm'};  label.tLe = {'time since mar 1', 'length'};  
temp.tLe  = C2K(36);  units.temp.tLe = 'K'; label.temp.tLe = 'temperature';
bibkey.tLe = 'Laws1959';
comment.tLe = 'Data from Sanriku, Hokkaido and Azores, southern sperm whale';
   
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Lb = 10 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: tLe data added';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4HH4H'; % Cat of Life
metaData.links.id_ITIS = '180488'; % ITIS
metaData.links.id_EoL = '46559363'; % Ency of Life
metaData.links.id_Wiki = 'Physeter_macrocephalus'; % Wikipedia
metaData.links.id_ADW = 'Physeter_macrocephalus'; % ADW
metaData.links.id_Taxo = '68821'; % Taxonomicon
metaData.links.id_WoRMS = '137119'; % WoRMS
metaData.links.id_MSW3 = '14300131'; % MSW3
metaData.links.id_AnAge = 'Physeter_macrocephalus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Physeter_macrocephalus}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Physeter_macrocephalus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Physeter_macrocephalus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EvanHind2004'; type = 'Article'; bib = [ ... 
'author = {Evans, K. and Hindell, M. A.}, ' ... 
'year = {2004}, ' ...
'title = {The age structure and growth of female sperm whales (\emph{Physeter macrocephalus}) in southern {A}ustralian waters}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {263}, ' ...
'pages = {237-250}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Laws1959'; type = 'techreport'; bib = [ ... 
'author = {Laws, R. M.}, ' ... 
'year = {1959}, ' ...
'title = {The foetal growth rates of whales with special reference to the fin whale, \emph{Balaenoptera physalus} {L}inn}, ' ...
'institution = {Nat. Inst of Oceanography}, ' ...
'volume = {29}, ' ...
'pages = {281-308}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

