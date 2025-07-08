function [data, auxData, metaData, txtData, weights] = mydata_Genetta_genetta
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Viverridae';
metaData.species    = 'Genetta_genetta'; 
metaData.species_en = 'Common genet'; 

metaData.ecoCode.climate = {'A', 'BSh', 'BWh', 'Csa'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.7); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 10 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'sta@akvaplan.niva.no'};            
metaData.date_acc  = [2021 10 29];              

%% set data
% zero-variate data

data.tg = 78;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 62;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2*365;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'Wiki';
  temp.tp = C2K(36.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 13*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(36.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 80;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
  comment.Wwb = '60-85 g';
data.Wwi = 1867;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'AnAge';
data.Wwim = 2000;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'Wiki';

data.Ri  = 2*2/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 pups per litter; 2 litters per yr';

% univariate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
0.622	77.733
2.951	78.816
3.608	93.451
5.040	110.326
6.588	120.438
7.914	128.300
12.225	154.134
14.978	189.012
19.059	229.499
23.142	266.606
27.569	284.551
29.889	300.282
33.862	335.137
36.623	356.493
44.489	370.993
49.688	396.811
53.446	419.276
57.202	446.248
60.743	460.829
65.832	483.269
70.920	506.835];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'male'};  
temp.tW  = C2K(36.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Volf1959';
comment.tW = 'male';
%
data.tW1 = [ ... % time since birth (d), weight (g)
0.396	85.624
2.834	90.085
4.270	99.073
5.923	119.323
8.016	144.073
10.113	163.188
13.425	190.168
18.064	223.884
23.034	262.101
24.802	274.462
29.333	303.672
32.428	321.642
35.418	329.474
40.183	337.271
44.049	365.368
47.368	379.953
50.793	402.424
55.883	423.737
59.420	446.206
64.398	468.648
71.037	496.692];
units.tW1  = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'female'};  
temp.tW1  = C2K(36.7);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'Volf1959';
comment.tW1 = 'female';
%
data.tW2 = [ ... % time since birth (d), weight (g)
0.066	81.123
2.614	86.709
4.492	99.068
6.699	119.309
9.679	145.168
13.985	180.017
16.636	199.122
20.949	222.703
24.926	250.797
29.348	276.630
34.432	308.084
39.754	310.237
43.841	340.583
48.931	360.769
52.583	375.348
56.343	394.433
60.882	410.122
65.418	430.319
71.284	450.490];
units.tW2  = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight', 'female'};  
temp.tW2  = C2K(36.7);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'Volf1959';
comment.tW2 = 'female';

%% set weights for all real data
weights = setweights(data, []);
weights.tW =  5 * weights.tW;
weights.tW1 = 1 * weights.tW1;
weights.tW2 = 5 * weights.tW2;
weights.Wwi = 5 * weights.Wwi;
weights.Wwim = 5 * weights.Wwim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 1;
weights.psd.p_M = 3 * weights.psd.p_M;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW1','tW2','tW'}; subtitle1 = {'Data for female, female, male'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '3FKP4'; % Cat of Life
metaData.links.id_ITIS = '621991'; % ITIS
metaData.links.id_EoL = '328095'; % Ency of Life
metaData.links.id_Wiki = 'Genetta_genetta'; % Wikipedia
metaData.links.id_ADW = 'Genetta_genetta'; % ADW
metaData.links.id_Taxo = '66851'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000390'; % MSW3
metaData.links.id_AnAge = 'Genetta_genetta'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Genetta_genetta}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Genetta_genetta}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Volf1959'; type = 'Article'; bib = [ ... 
'author = {Volf, J.}, ' ... 
'doi = {10.1515/mamm.1959.23.2.168}, ' ...
'year = {1959}, ' ...
'title = {LA REPRODUCTION DES GENETTES AU ZOO DE {P}RAGUE}, ' ...
'journal = {Mammalia}, ' ...
'volume = {23(2)}, ' ...
'pages = {165-171}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
