function [data, auxData, metaData, txtData, weights] = mydata_Equus_hemionus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Perissodactyla'; 
metaData.family     = 'Equidae';
metaData.species    = 'Equus_hemionus'; 
metaData.species_en = 'Asian wild ass'; 

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTd', '0iTs', '0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri';'JXi'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 12 03];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 12 03]; 

%% set data
% zero-variate data

data.tg = 339;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 456 ;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '30 till 35 d';
data.tp = 1157 ;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1187 ;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(38.3);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 31.6*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 30e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Equus africanus';
data.Wwi = 230e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';  

data.Ri  = 0.7/548;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 foal per litter, 0.7 litter per yr';

% uni-variate data
% time-length 
data.tL = [ ... % time (d), distance from the cusp (cm)
14.794	0.818
27.838	0.818
35.163	1.783
44.549	1.257
46.358	1.666
50.030	2.075
59.378	1.841
63.097	1.900
64.813	3.010
66.766	2.338
81.583	3.010
81.676	2.309
88.931	3.800
88.959	3.595
101.909	4.296
103.912	3.244
109.378	4.180
118.597	4.910
129.793	4.793
131.715	4.355
142.747	5.466
163.193	5.846
165.006	6.225
177.972	6.810
202.137	7.248
228.162	7.716
237.377	8.476
246.725	8.242
257.874	8.476
265.269	8.914
272.730	8.856
293.169	9.294
308.037	9.587
326.635	9.850
369.407	10.493
386.154	10.668
388.037	10.522
415.952	10.785
427.097	11.048
434.562	10.960
455.020	11.253
469.919	11.311
484.803	11.486
490.369	11.662
512.745	11.545
531.340	11.837
535.074	11.779
572.310	12.013
603.960	12.217
618.863	12.246
635.587	12.597
646.794	12.392
665.377	12.772
669.135	12.539
682.143	12.802
698.906	12.860
698.933	12.656
721.262	12.889
725.012	12.714
734.282	13.065
743.642	12.743
758.494	13.152
771.573	12.889
793.921	12.977
801.328	13.328
816.270	13.065
833.040	13.065
836.720	13.415
849.794	13.182
851.623	13.445
862.838	13.182
870.249	13.503
887.003	13.620
888.913	13.269
907.535	13.357
909.363	13.620
929.888	13.415
937.310	13.649
954.100	13.503
967.108	13.766
972.729	13.532
983.902	13.591
996.906	13.883
1011.832	13.737
1019.262	13.912
1034.193	13.737
1047.209	13.942
1064.002	13.766
1077.015	14.000
1086.355	13.825
1114.278	14.029
1116.161	13.883
1134.790	13.912
1140.357	14.088
1157.151	13.912
1160.850	14.117
1175.745	14.205
1175.780	13.942];
units.tL = {'d', 'cm'};  label.tL = {'age', 'distiance from the cusp'};  
temp.tL  = C2K(38.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'NacaJord2017';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
D2 = 'Teeth growth is assumed to be strictly isomorphic, also during embryonal development';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '7TKMW'; % Cat of Life
metaData.links.id_ITIS = '624993'; % ITIS
metaData.links.id_EoL = '311507'; % Ency of Life
metaData.links.id_Wiki = 'Equus_hemionus'; % Wikipedia
metaData.links.id_ADW = 'Equus_hemionus'; % ADW
metaData.links.id_Taxo = '168050'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14100020'; % MSW3
metaData.links.id_AnAge = 'Equus_hemionus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Equus_hemionus}}';
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
bibkey = 'NacaJord2017'; type = 'Article'; bib = [ ... 
'author = {Carmen Nacarino-Meneses and Xavier Jordana and Guillem Orlandi-Oliveras1 and Meike K\"{o}hler}, ' ... 
'doi = {110.1038/s41598-017-16227-2}, ' ...
'year = {2017}, ' ...
'title = {Reconstructing molar growth from enamel histology in extant and extinct {E}quus}, ' ...
'journal = {Scientific Reports}, ' ...
'volume = {7}, ' ...
'pages = {15965}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Equus_hemionus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Equus_hemionus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

