function [data, auxData, metaData, txtData, weights] = mydata_Corynorhinus_rafinesquii 
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Vespertilionidae';
metaData.species    = 'Corynorhinus_rafinesquii'; 
metaData.species_en = 'Rafinesque''s big-eared bat'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM','xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 27];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 27]; 

%% set data
% zero-variate data

data.tg = 53;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'AnAge';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 42;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'guess';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'based on tL data';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at first litter female';  bibkey.tp = 'AnAge';
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'maturity at 182 d, both male and female';
data.am = 10*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 1.6; units.Lb = 'cm';   label.Lb = 'wet weight at birth';  bibkey.Lb = 'PearKofo1952';
data.Li = 4.5;  units.Li = 'cm';   label.Li = 'ultimate wet weight'; bibkey.Li = 'PearKofo1952';

data.Wwb = 2.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'AnAge';
data.Wwi = 13;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: 6-13 g';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 1 litter per yr';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), forearm length (cm)
0.129	1.597
0.264	1.697
0.308	1.750
0.560	1.592
7.134	2.528
7.232	2.494
7.287	2.408
8.132	2.610
9.305	2.897
10.396	3.013
10.604	2.802
11.274	2.802
11.530	3.190
11.944	2.802
12.254	3.109
12.367	2.898
12.924	3.109
13.104	3.243
13.203	3.200
13.490	3.200
13.898	3.493
14.446	3.210
14.472	3.493
15.922	3.301
15.954	3.503
16.536	3.402
17.052	3.532
17.284	3.623
18.235	3.695
18.665	3.695
21.382	3.820
21.463	3.998
21.671	3.792
22.232	3.955
22.285	3.897
22.324	3.998
24.333	3.998
24.900	4.089
25.816	4.008
31.246	4.302
31.772	4.302
31.883	4.110
32.107	4.302
34.363	4.202
35.024	4.303
35.080	4.202
35.702	4.202
35.804	4.130
36.458	4.322
36.803	4.198
37.511	4.318
38.828	4.002
40.382	4.309
41.235	4.405];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'forearm length','female'};  
temp.tL_f = C2K(34.8); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PearKofo1952';
comment.tL_f = 'Data for famales';
%
data.tL_m = [ ... % time since birth (d), forearm length (cm)
0.172	1.649
0.597	1.726
6.131	2.508
6.340	2.293
7.191	2.418
7.470	2.509
9.464	2.706
9.775	3.003
10.030	2.802
10.724	3.094
11.123	2.893
11.162	3.008
11.395	3.090
11.593	3.003
11.697	2.893
11.777	3.090
13.011	3.219
13.298	3.219
16.154	3.397
16.561	3.690
16.816	3.493
17.666	3.623
18.576	3.609
18.585	3.499
20.435	3.695
22.291	3.811
23.658	4.065
24.328	4.065
24.340	3.917
24.932	3.687
25.823	3.912
26.045	4.133
26.868	4.013
27.000	4.147
27.769	4.109
31.022	4.105
32.003	3.803
34.323	4.096
35.185	4.092
36.372	4.202
37.277	4.255
37.337	4.097
37.798	4.313
37.815	4.097
38.859	4.208
38.875	4.002
40.342	4.208
40.772	4.208];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'forearm length','male'};  
temp.tL_m    = C2K(34.8); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PearKofo1952';
comment.tL_m = 'pData for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Lb = 50 * weights.Lb;
weights.Li = 50 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

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
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = 'YRRY'; % Cat of Life
metaData.links.id_ITIS = '555664'; % ITIS
metaData.links.id_EoL = '327666'; % Ency of Life
metaData.links.id_Wiki = 'Corynorhinus_rafinesquii'; % Wikipedia
metaData.links.id_ADW = 'Corynorhinus_rafinesquii'; % ADW
metaData.links.id_Taxo = '331542'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13802138'; % MSW3
metaData.links.id_AnAge = 'Corynorhinus_rafinesquii'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Corynorhinus_rafinesquii}}';
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
bibkey = 'PearKofo1952'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1375769}, ' ...
'author = {Pearson, O. P. and Koford, M. R. and Pearson, A. K.}, ' ... 
'year = {1952}, ' ...
'title = {Reproduction of the Lump-Nosed Bat (\emph{Corynorhinus rafinesquei}) in {C}alifornia}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {33(3)}, ' ...
'pages = {273-320}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Corynorhinus_rafinesquii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


