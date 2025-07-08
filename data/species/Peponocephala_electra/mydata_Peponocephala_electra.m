function [data, auxData, metaData, txtData, weights] = mydata_Peponocephala_electra
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Delphinidae';
metaData.species    = 'Peponocephala_electra'; 
metaData.species_en = 'Melon-headed whale'; 

metaData.ecoCode.climate = {'MA','MB','MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'OiMc'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm   = [2023 08 20];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 08 20];

%% set data
% zero-variate data

data.tg = 365;     units.tg = 'd';    label.tg = 'gestation time';           bibkey.tg =  'AnAge';   
  temp.tg = C2K(35.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '13-14 mnth';
data.tx = 15*30.5;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(35.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '12-18 mnth';
data.tp = 7*365;     units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AmanYama2013';   
  temp.tp = C2K(35.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Wiki: 6.5-7.5 yrs';
data.tpm = 12.5*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';   
  temp.tpm = C2K(35.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
  comment.tpm = 'Wiki: 12-13 yrs';
data.am = 47*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'AnAge';   
  temp.am = C2K(35.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 100; units.Lb = 'cm';   label.Lb = 'length at birth'; bibkey.Lb = 'Wiki';
  comment.Lb = '1.1-1.5 cm';
data.Lp = 230; units.Lp = 'cm';   label.Lp = 'length at puberty'; bibkey.Lp = 'AmanYama2013';
  comment.Lp = '221-236 cm';
data.Lpm = 245; units.Lpm = 'cm';   label.Lpm = 'length at puberty'; bibkey.Lpm = 'AmanYama2013';
  comment.Lpm = '2.4-2.5 m';
data.Li = 275; units.Li = 'cm'; label.Li = 'ultimate length for females'; bibkey.Li = 'Wiki';

data.Wwi = 225e3; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'Wiki';
  
data.Ri  = 1/365/3.5;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AmanYama2013';   
  temp.Ri = C2K(35.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'calving interval 3-4 yr';

  
% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), length (vm)
0.352	164.888
0.891	183.476
1.299	207.045
1.433	209.767
1.496	203.425
1.892	200.263
2.495	214.775
3.624	221.143
4.225	231.124
4.498	249.707
6.539	224.381
6.616	245.677
6.673	226.649
7.537	233.918
8.800	243.461
9.726	242.123
9.731	252.544
10.790	251.208
11.580	240.806
11.585	250.773
11.586	253.039
12.507	239.920
12.581	257.139
13.437	245.832
13.562	229.524
13.630	234.509
14.425	235.886
15.619	239.991
16.611	235.483
17.541	243.206
17.604	235.052
18.661	229.639
19.523	231.471
20.390	245.989
20.452	235.570
20.458	248.256
20.515	230.134
20.521	242.820
21.505	221.095
21.508	228.344
22.644	249.665
25.479	222.091
25.551	234.779
26.489	258.360
26.550	246.582
26.605	223.476
26.678	237.976
27.675	245.248
29.529	245.743
29.591	234.871
30.523	246.219
30.588	243.049
32.567	226.330
32.634	229.503
32.708	245.362
32.776	249.441
33.568	242.663
34.698	251.750
35.556	245.880];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'length', 'female'};
  temp.tL_f = C2K(35.5); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'AmanYama2013';
%
data.tL_m = [ ... % time since birth (yr), length (vm)
0.419	136.258
0.602	171.935
1.143	181.419
1.205	178.258
1.245	207.161
2.312	214.387
2.652	221.613
2.710	216.194
2.835	210.774
4.639	226.581
5.685	219.355
10.923	235.613
11.941	255.484
14.789	262.258
15.752	243.290
16.743	243.742
22.828	252.774
23.678	246.903
25.667	253.226
25.776	236.968
25.858	248.258
26.161	275.806
27.633	243.290
32.661	251.419
32.678	263.613];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'length', 'male'};
  temp.tL_m = C2K(35.5); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'AmanYama2013';

%% set weights for all real data
weights = setweights(data, []);
weights.tg = 3 * weights.tg;
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp';
D2 = 'Lactation is taken into account in predictions for tL data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Males tend to be larger than females';
metaData.bibkey.F1 = 'ADW'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '76PZV'; % Cat of Life
metaData.links.id_ITIS = '180459'; % ITIS
metaData.links.id_EoL = '46559275'; % Ency of Life
metaData.links.id_Wiki = 'Peponocephala_electra'; % Wikipedia
metaData.links.id_ADW = 'Peponocephala_electra'; % ADW
metaData.links.id_Taxo = '68731'; % Taxonomicon
metaData.links.id_WoRMS = '137103'; % WoRMS
metaData.links.id_MSW3 = '14300076'; % MSW3
metaData.links.id_AnAge = 'Peponocephala_electra'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Peponocephala_electra}}';
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
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Peponocephala_electra/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Peponocephala_electra}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Carw1995'; type = 'Book'; bib = [ ...  
'author = {Mark Carwardine}, ' ...
'year = {1995}, ' ...
'title  = {Whales, dolphins and porpoises}, ' ...
'publisher = {Dorling Kindersley}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AmanYama2013'; type = 'article'; bib = [ ...  
'doi = {10.1111/mms.12050}, ' ...
'author = {Masao Amano and Tadasu K. Yamada and Toshiaki Kuramochi and Azusa Hayano and Arai Kazumi and Takashi Sakai}, ' ...
'year = {2013}, ' ...
'title  = {Life history and group composition of melon-headed whales based on mass strandings in {J}apan}, ' ...
'journal = {Marine Mammal Science}, ' ...
'pages = {1-14}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

