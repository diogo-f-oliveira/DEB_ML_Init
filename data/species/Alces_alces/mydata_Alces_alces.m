function [data, auxData, metaData, txtData, weights] = mydata_Alces_alces

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Cervidae';
metaData.species    = 'Alces_alces'; 
metaData.species_en = 'Eurasian elk'; 

metaData.ecoCode.climate = {'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx';  'Wwi'; 'Ri'; 'pXi'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm   = [2016 12 29];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data

data.tg = 243;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(38.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 100;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 751;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 25*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(38.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am =  'life span between 15 and 25 yr ';
  
data.Wwb = 12844;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 94000;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 360e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'Wiki';
  comment.Wwi = '200 till 490 kg';
data.Wwim = 520e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'Wiki';
  comment.Wwim = '380 till 700 kg';
  
data.Ri  = 1.3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = {'AnAge'};   
  temp.Ri = C2K(38.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'If food is abundant, 2 calves are possible';
  
data.pXm  = 40.9;   units.pXm  = 'MJ/d';  label.pXm  = 'energy intake at 360 kg';   bibkey.pXm  = 'Wiki';

% uni-variate data
% time-weight
data.tW_f = [ % time since birth (yr), carcass weight (kg)
0.284	90.841
0.312	53.644
0.342	48.155
0.343	57.302
0.343	62.180
0.344	67.058
0.344	71.326
0.345	74.375
0.345	79.253
0.345	82.911
0.346	85.960
0.347	93.887
0.372	37.788
1.311	165.192
1.337	118.239
1.339	135.922
1.340	139.581
1.340	142.630
1.340	145.069
1.341	149.337
1.341	151.776
1.342	159.703
1.372	156.043
1.374	170.067
1.400	126.164
1.405	177.383
2.300	171.252
2.363	176.127
2.363	182.834
2.366	209.054
2.367	221.859
3.292	201.092
3.324	208.408
3.325	222.432
3.352	180.358
3.355	214.504
4.343	210.198
4.346	241.296
4.370	175.441
6.319	201.586
6.321	218.659
6.321	224.147
6.323	240.610
7.309	219.231
7.337	191.791
9.345	193.544
9.349	227.690
10.274	217.899
10.304	209.971
11.294	223.958
13.361	197.050
15.338	195.145]; 
data.tW_f(:,1) = data.tW_f(:,1)*365; % convert yr to d
data.tW_f(:,2) = data.tW_f(:,2)*1000/ .56; % convert carcass weight to total weight in g
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'total weight', 'female'};  
temp.tW_f  = C2K(38.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'SolbGare2008';
comment.tW_f = 'Data for females';
% 
data.tW_m = [ ... % time since birth (yr), carcass weight (kg)
0.293	92.449
0.293	99.115
0.311	44.571
0.311	77.298
0.311	79.722
0.311	82.753
0.311	87.601
0.329	51.845
0.329	56.087
0.329	61.542
0.329	66.390
0.329	72.451
1.316	179.783
1.335	133.724
1.335	136.754
1.335	139.178
1.335	142.209
1.335	145.239
1.335	148.875
1.335	152.512
1.335	157.360
1.335	160.997
1.335	166.451
1.335	169.481
1.335	173.118
1.335	176.148
1.335	182.815
2.285	203.478
2.322	170.753
2.322	194.390
2.322	233.784
2.340	211.967
2.340	216.209
2.340	220.451
2.340	224.088
2.340	241.058
2.340	249.542
2.358	187.119
3.309	227.783
3.327	209.602
3.327	258.693
3.327	267.178
3.327	274.451
4.333	286.027
4.333	245.421
4.333	223.603
5.338	263.057
6.362	263.726
6.362	266.756
6.362	272.210
7.331	341.966
7.349	280.149
9.324	281.481]; 
data.tW_m(:,1) = data.tW_m(:,1)*365; % convert yr to d
data.tW_m(:,2) = data.tW_m(:,2)*1000/ .56; % convert carcass weight to total weight in g
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'total weight', 'male'};  
temp.tW_m  = C2K(38.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'SolbGare2008';
comment.tW_m = 'data for males';

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

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Slow foetal development is assumend';
D2 = 'Males are assumend to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = 'BHC3'; % Cat of Life
metaData.links.id_ITIS = '180703'; % ITIS
metaData.links.id_EoL = '328654'; % Ency of Life
metaData.links.id_Wiki = 'Alces_alces'; % Wikipedia
metaData.links.id_ADW = 'Alces_alces'; % ADW
metaData.links.id_Taxo = '68020'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200208'; % MSW3
metaData.links.id_AnAge = 'Alces_alces'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Alces_alces}}';
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
bibkey = 'SolbGare2008'; type = 'Article'; bib = [ ... 
'author = {E. J. Solberg and M. Garel and M. Heim and V. Gr{\o}tan and B.-E. S{\ae}ther}, ' ... 
'year = {2008}, ' ...
'title = {Lack of compensatory body growth in a high performance moose \emph{Alces alces} population}, ' ...
'journal = {Oecologia}, ' ...
'volume = {158}, ' ...
'pages = {485-498}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Alces_alces}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Alces_alces/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

