function [data, auxData, metaData, txtData, weights] = mydata_Cerdocyon_thous

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Canidae';
metaData.species    = 'Cerdocyon_thous'; 
metaData.species_en = 'Crab-eating fox'; 

metaData.ecoCode.climate = {'A', 'Cfa', 'Cwb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTi', '0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.2); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 09 01];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 09 01]; 

%% set data
% zero-variate data

data.tg = 55;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg =  'AnAge';   
  temp.tg = C2K(38.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 90;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 274;    units.tp = 'd';    label.tp = 'time since birth at puberty';bibkey.tp = 'AnAge';
  temp.tp = C2K(38.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 12.7*365;    units.am = 'd';    label.am = 'life span';             bibkey.am = 'AnAge';   
  temp.am = C2K(38.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 140;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'AnAge';
data.Wwi = 6500;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'AnAge';
  
data.Ri  = 4*1.9/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 pups pers litter, 1.9 litters per yr';
  
% uni-variate data
% time-weight data
data.tW = [ % time since birth (wk), wet weight (g)
0.753	169.380
1.520	100.240
2.029	100.301
3.551	185.096
4.571	146.755
9.907	255.079
10.927	209.046
14.485	278.698
14.730	447.957
14.731	417.188
16.262	348.139
16.263	325.062
17.269	525.181
19.565	425.453
19.810	587.020
24.117	895.222
24.392	541.409
25.150	633.806
25.152	595.345
29.456	965.085
29.982	657.455
30.231	749.792
34.281	1119.502
34.806	819.564
36.583	896.698
37.583	1212.200
39.887	958.627
41.155	1020.316
43.948	1128.338
43.950	1082.185
44.200	1166.830
48.268	1198.080
49.515	1652.074
49.536	1275.154
53.093	1352.498
53.343	1429.450
54.106	1444.925
55.607	1891.257
55.628	1522.028
59.178	1722.448
60.189	1837.953
64.240	2184.586
65.262	2100.092
66.036	1915.568
70.332	2431.461
73.402	2131.824
76.929	2739.934
80.746	2725.001
82.533	2617.520
84.546	3002.374
87.599	3002.735
91.158	3041.618
101.820	3450.572
102.292	4112.166
102.828	3619.922]; 
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW  = C2K(38.2);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Brad1978';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = '';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = 'SWGW'; % Cat of Life
metaData.links.id_ITIS = '183825'; % ITIS
metaData.links.id_EoL = '328685'; % Ency of Life
metaData.links.id_Wiki = 'Cerdocyon_thous'; % Wikipedia
metaData.links.id_ADW = 'Cerdocyon_thous'; % ADW
metaData.links.id_Taxo = '66474'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000783'; % MSW3
metaData.links.id_AnAge = 'Cerdocyon_thous'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Cerdocyon_thous}}';
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
bibkey = 'Brad1978'; type = 'Article'; bib = [ ... 
'author = {Brady, C. A.}, ' ... 
'year = {1978}, ' ...
'doi = {10.1111/j.1748-1090.1978.tb00243.x}, ' ...
'title = {Reproduction, growth and parental care in Crab-eating foxes}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {18}, ' ...
'pages = {130-134}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cerdocyon_thous}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Cerdocyon_thous/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

