function [data, auxData, metaData, txtData, weights] = mydata_Castor_fiber

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Castoridae';
metaData.species    = 'Castor_fiber'; 
metaData.species_en = 'Eurasian bever'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHw'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 01 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 105;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 76;    units.tx = 'd';    label.tx = 'time since birth at weaning';  bibkey.tx = 'AnAge';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 639;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 25*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 530;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'AnAge';
data.Wwx = 4200; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';       bibkey.Wwx = 'AnAge';
data.Wwi = 25000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: till 27.2 kg';

data.Ri  = 3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW_f = [..., % time since birth (yr), weight (kg)
0.951	6.507
0.955	8.708
0.958	10.019
0.962	4.026
0.964	5.009
0.966	5.852
0.968	6.788
0.969	7.069
1.956	15.122
1.962	9.831
1.965	11.376
1.974	15.684
1.974	15.964
1.993	16.994
2.000	11.891
2.017	12.360
2.969	19.288
2.979	16.011
2.986	19.429
2.990	21.536
3.008	13.436
3.009	14.139
3.011	14.888
3.981	14.513
3.995	21.301
3.999	23.455
4.000	23.876
4.006	18.633
4.009	20.225
4.010	20.412
4.015	14.747
4.981	20.459
4.983	21.629
4.984	22.004
5.011	18.633
6.954	19.007
7.008	20.599
7.012	22.753
7.013	23.268
8.015	21.957
8.016	22.238
8.020	16.199
8.982	19.476
8.985	21.442
10.006	20.833
10.034	18.446];
data.tW_f(:,1) = data.tW_f(:,1) * 365; % convert yr to d 
data.tW_f(:,2) = data.tW_f(:,2) * 1e3; % convert kg to g 
units.tW_f = {'d', 'g'};  label.tW_f = {'time since birth', 'weight', 'female'};  
temp.tW_f  = C2K(37);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'RoseSchu2004';
comment.tW_f = 'Data for females';
%
% t-W data
data.tW_m = [..., % time since birth (yr), weight (kg)
0.951	6.601
0.970	7.912
0.971	8.146
0.971	8.427
0.973	9.363
1.965	11.002
1.971	14.466
1.972	14.607
1.972	14.700
1.994	17.416
2.001	12.640
2.002	12.828
2.002	13.015
2.003	13.717
2.004	13.811
2.011	9.270
2.013	10.066
2.013	10.346
2.018	12.453
2.968	18.539
2.977	14.888
2.978	15.309
2.979	15.824
2.980	16.433
2.980	16.573
3.021	20.131
3.985	16.573
3.986	16.760
3.986	16.948
4.016	15.262
4.021	17.931
4.022	18.399
4.974	17.041
4.975	17.322
4.989	16.245
5.012	19.007
5.014	20.318
6.005	21.723
6.017	19.195
6.017	19.382
6.954	18.680
7.033	16.760
7.997	21.067
8.011	19.757
8.012	20.506
8.023	17.650
8.024	17.884
8.033	14.232
10.019	19.054
10.023	20.880
11.011	20.927
11.953	14.700
12.994	16.292
13.987	18.446
13.997	23.361
13.999	16.199];
data.tW_m(:,1) = data.tW_m(:,1) * 365; % convert yr to d 
data.tW_m(:,2) = data.tW_m(:,2) * 1e3; % convert kg to g 
units.tW_m = {'yr', 'kg'};  label.tW_m = {'time since birth', 'weight', 'male'};  
temp.tW_m  = C2K(37);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'RoseSchu2004';
comment.tW_m = 'Data for males';

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = 'RQPW'; % Cat of Life
metaData.links.id_ITIS = '573165'; % ITIS
metaData.links.id_EoL = '1036116'; % Ency of Life
metaData.links.id_Wiki = 'Castor_fiber'; % Wikipedia
metaData.links.id_ADW = 'Castor_fiber'; % ADW
metaData.links.id_Taxo = '62130'; % Taxonomicon
metaData.links.id_WoRMS = '890548'; % WoRMS
metaData.links.id_MSW3 = '12600005'; % MSW3
metaData.links.id_AnAge = 'Castor_fiber'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Castor_fiber}}';
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
bibkey = 'RoseSchu2004'; type = 'Article'; bib = [ ... 
'author = {F. Rosell and B. A. Schulte}, ' ... 
'year = {2004}, ' ...
'title = {Sexual Dimorphism in the Development of Scent Structures for the Obligate Monogamous {E}urasian Beaver (\emph{Castor fiber})}, ' ...
'journal = {J. Mammal.}, ' ...
'volume = {85}, ' ...
'number = {6}, '...
'pages = {1138--1144}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Castor_fiber}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Castor_fiber/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

