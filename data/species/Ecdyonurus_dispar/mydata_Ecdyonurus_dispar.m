function [data, auxData, metaData, txtData, weights] = mydata_Ecdyonurus_dispar

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Ephemeroptera'; 
metaData.family     = 'Heptageniidae';
metaData.species    = 'Ecdyonurus_dispar'; 
metaData.species_en = 'Autumn dun'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0eFr', '0eFc', 'eiTg'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'beH', 'beD', 'beS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'am'; 'Lj'; 'Li'; 'Wd0'; 'Wdj'; 'Ni'}; 
metaData.data_1     = {'t-L_T'; 't-Wd_T'; 'T-ab'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 10 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 02 11];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 19]; 

%% set data
% zero-variate data

data.ab = 25;   units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'Hump1984';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 90;   units.tj = 'd';    label.tj = 'time since at birth at emergence'; bibkey.tj = 'Hump1984';   
  temp.tj = C2K(20);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.am = 6;    units.am = 'd';    label.am = 'life span as imago';        bibkey.am = 'guess';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

%data.L0  = 175; units.Lb  = 'mum'; label.Lb  = 'total of egg';            bibkey.Lb  = 'Brit1982';
%  comment.L0 = 'Value applies to most emphemeropterans, ranging from 150 to 200 mum';
data.Lj  = 1.0; units.Lj  = 'cm';  label.Lj  = 'max body length nymph';    bibkey.Lj  = 'Hump1981';
data.Li  = 1.5; units.Li  = 'cm';  label.Li  = 'body length imago';        bibkey.Li  = 'MacaBenn2010';

data.Wd0 = 1.5/2500;   units.Wd0 = 'mg'; label.Wd0 = 'initial dry weight'; bibkey.Wd0 = {'Wata1998', 'guess'};
  comment.Wd0 = 'Wata1998 implies Ww0 = 8 mug, derived from egg volume of Ephoron shigae, using specific density of 1 g/cm^3; but see Wdj';
data.Wdj = 2.0; units.Wdj = 'mg';  label.Wdj = 'ultimate dry weight';      bibkey.Wdj = 'Hump1981';
  comment.Wdj = 'last point of tW_20, with assumed 1.5 mg contibution from eggs';
  
data.Ni = 2500; units.Ni  = '#';   label.Ni  = 'cumulative # of eggs';     bibkey.Ni  = {'riverflies','MacaBenn2010'};   
  temp.Ni = C2K(16);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
 
% uni-variate data
% t-L data
data.tL_20 = [ ... % time  (d), body length (mm)
 1	0.500
 7	0.959
13	1.070
20	1.371
27	1.634
34	3.063
41	3.483
48	3.850
55	3.870
62	4.742
69	6.659
76	8.090
82	9.069
90 10.049];
units.tL_20  = {'d', 'mm'};  label.tL_20 = {'time', 'body length', '20 C'};  
temp.tL_20   = C2K(20);  units.temp.tL_20 = 'K'; label.temp.tL_20 = 'temperature';
bibkey.tL_20 = 'Hump1981';
comment.tL_20 = 'last point represents final larval stage';
% 
data.tL_14 = [ ... % time since birth (d), length (mm)
  1	0.201
 20	0.789
 42	1.758
 55	2.023
 76	2.702
 89	3.749
103	3.959
127	4.565];
units.tL_14 = {'d', 'mm'};  label.tL_14 = {'time', 'body length', '14 C'};  
temp.tL_14  = C2K(14);  units.temp.tL_14 = 'K'; label.temp.tL_14 = 'temperature';
bibkey.tL_14 = 'Hump1981';
% 
data.tL_9 = [ ... % time since birth (d), length (mm)
  1	0.075
 35	0.476
 66 1.099
 97	1.538
126	2.269];
units.tL_9 = {'d', 'mm'};  label.tL_9 = {'time', 'body length', '9 C'};  
temp.tL_9  = C2K(9);  units.temp.tL_9 = 'K'; label.temp.tL_9 = 'temperature';
bibkey.tL_9 = 'Hump1981';
%
data.tW_20 = [ ... % time (d), mean dry weight (mg)
1	0.014
7	0.037
13	0.057
20	0.086
27	0.091
34	0.376
41	0.462
48	0.559
55	0.883
62	0.896
69	1.520
77	2.319
82	2.866
90	3.419];
units.tW_20  = {'d', 'mg'};  label.tW_20 = {'time', 'dry weight', '20 C'};  
temp.tW_20   = C2K(20);  units.temp.tW_20 = 'K'; label.temp.tW_20 = 'temperature';
bibkey.tW_20 = 'Hump1981';
comment.tW_20 = 'last point represents final larval stage';
%
data.tW_14 = [ ... % time (d), mean dry weight (mg)
  1	0.018
 20	0.052
 42	0.197
 55	0.213
 76	0.307
 89	0.529
103	0.584
127	0.738];
units.tW_14  = {'d', 'mg'};  label.tW_14 = {'time', 'dry weight', '14 C'};  
temp.tW_14   = C2K(14);  units.temp.tW_14 = 'K'; label.temp.tW_14 = 'temperature';
bibkey.tW_14 = 'Hump1981';
%
data.tW_9 = [ ... % time (d), mean dry weight (mg)
  1	0.016
 35	0.038
 66	0.076
 97	0.136
126	0.212];
units.tW_9  = {'d', 'mg'};  label.tW_9 = {'time', 'dry weight', '9 C'};  
temp.tW_9   = C2K(14);  units.temp.tW_9 = 'K'; label.temp.tW_9 = 'temperature';
bibkey.tW_9 = 'Hump1981';

% % length - fecundity
% data.LN = [ ... % body length (cm), number of eggs (#)
% 1.095	781.588
% 1.102	819.494
% 1.107	775.271
% 1.146	1053.249
% 1.148	983.754
% 1.149	933.213
% 1.160	1040.614
% 1.200	1457.581
% 1.200	1425.993
% 1.200	1362.816
% 1.200	1293.321
% 1.200	1249.097
% 1.200	1116.426
% 1.200	1015.343
% 1.200	983.754
% 1.245	1533.393
% 1.249	1508.123
% 1.255	1539.711
% 1.250	1236.462
% 1.299	1110.108
% 1.303	1173.285
% 1.295	1324.910
% 1.306	1324.910
% 1.299	1457.581
% 1.302	1666.065
% 1.404	2215.704
% 1.400	2310.469
% 1.602	3283.393
% 1.602	3542.419
% 1.805	5740.975];
% units.LN = {'cm', '#'};  label.LN = {'body length imago', 'fecundity'};  
% temp.LN  = C2K(14);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
% bibkey.LN = 'Hump1984';
% comment.LN = 'Data actually for Ecdyonurus venosus; outcommented because Nf_hep gives problems';

% length - fecundity
data.Tab = [ ... % temperature (C), age at birth (d)
3.580	290.637
3.767	279.814
3.709	260.317
3.978	235.779
3.984	227.837
3.988	222.422
4.542	149.881
7.495	81.408
7.318	78.513
7.500	75.271
7.357	73.821
9.632	51.891
9.773	54.784
10.064	49.381
10.066	46.493
10.238	56.969
10.415	59.864
10.494	49.398
10.461	46.148
13.369	40.849
13.123	33.619
13.520	29.664
14.529	23.206
15.025	30.807
15.028	27.558
15.315	26.848
15.818	26.146
15.712	23.615
15.461	22.883
15.463	20.356
14.997	19.976
15.031	23.587
17.258	17.900
17.147	21.867
17.145	25.838
17.393	28.736
17.543	20.800
20.092	15.848
20.095	11.877
20.453	12.613
20.451	15.501
20.520	18.392
20.878	19.129
20.810	14.794];
units.Tab = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'Hump1984';
comment.Tab = 'Data actually for Ecdyonurus venosus; While ab = 25 d for E. dispar, ab = 28 d for E. venosus, both at 15 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_9(1) = 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_20','tL_14','tL_9'}; subtitle1 = {'Data at 20, 14 ,9 C'};
metaData.grp.sets = {set1};
set2 = {'tW_20','tW_14','tW_9'}; subtitle2 = {'Data at 20, 14 ,9 C'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Life span (and h_a) relates to imago';
D2 = 'Puberty is assumed to coincide with end of acceleration';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Imagos are extremely short lived and do not feed; nyphs allocate to reproduction buffer and have mature eggs';
metaData.bibkey.F1 = 'Sold1979'; 
F2 = 'Estimates of the number of instars in ephemeropterans vary between 10 and 50; most are in the range 15-25';
metaData.bibkey.F2 = {'Brit1982'}; 
F3 = 'Final emphemeropteran larval stage transforms into a flying sub-image, which moulds into an imago';
metaData.bibkey.F3 = 'Brit1982';
F4 = 'eggs have a dormant period; length grows by a fixed fraction over moulting (so Dyar rule is applicable); eggs can develop parthenogenetically';
metaData.bibkey.F4 = 'Hump1981';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4);

%% Links
metaData.links.id_CoL = '6DT5C'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '3684138'; % Ency of Life
metaData.links.id_Wiki = 'Ecdyonurus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '17355'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://nl.wikipedia.org/wiki/Ecdyonurus_dispar}}';
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
bibkey = 'Sold1979'; type = 'Article'; bib = [ ... 
'author = {Soldan, T.}, ' ... 
'howpublished = {\url{http://www.ephemeroptera-galactica.com/pubs/pub_s/pubsoldant1979p353.pdf}}, ' ...
'year = {1979}, ' ...
'title = {The structure and development of the female internal reproductive system in six {E}uropean species of {E}phemeroptera}, ' ...
'journal = {Acta entomol. bohemoslovaca}, ' ...
'volume = {76}, ' ...
'pages = {353--365}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Brit1982'; type = 'Article'; bib = [ ... 
'author = {Brittain, J. E.}, ' ... 
'howpublished = {\url{http://www.ephemeroptera-galactica.com/pubs/pub_b/pubbrittainj1982p119.pdf}}, ' ...
'year = {1982}, ' ...
'title = {Biology of mayflies}, ' ...
'journal = {Ann. Rev. Entomol.}, ' ...
'volume = {27}, ' ...
'pages = {119--147}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hump1981'; type = 'Article'; bib = [ ... 
'author = {Humpesch, U. H.}, ' ... 
'howpublished = {\url{http://onlinelibrary.wiley.com/doi/10.1111/j.1365-2427.1981.tb01276.x/pdf}}, ' ...
'year = {1981}, ' ...
'title = {Effect of temperature on larval growth of \emph{Ecdyonurus dispar} ({E}phemeroptera: {H}eptageniidae) from two {E}nglish lakes}, ' ...
'journal = {Freshwater Biol.}, ' ...
'volume = {11}, ' ...
'pages = {441--457}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wata1998'; type = 'Article'; bib = [ ... 
'author = {Watanabe, N. C. W.}, ' ... 
'howpublished = {\url{http://onlinelibrary.wiley.com/doi/10.1111/j.1365-2427.1981.tb01276.x/pdf}}, ' ...
'year = {1981}, ' ...
'title = {Geographical variation in Japan in egg development of the mayfly, \emph{Ephoron shigae} ({E}phemeroptera: {P}olymitarcyidae)}, ' ...
'journal = {Freshwater Biol.}, ' ...
'volume = {40}, ' ...
'pages = {245--254}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'riverflies'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.riverflies.org/ecdyonurus-dispar-autumn-dun}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MacaBenn2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Macadam, C. and Bennet, C.}, ' ...
'year = {2010}, ' ...
'title  = {A pictorial guide to British Ephemeroptera}, ' ...
'publisher = {Field Studies Council}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hump1984'; type = 'Article'; bib = [ ... 
'author = {Humpesch, U. H.}, ' ... 
'year = {1984}, ' ...
'journal = {\"{O}sterr. Akad. Wissensch. Mat-nat K1}, ' ...
'volume = {1}, ' ...
'pages = {329-341}, ' ...
'title = {Egg Development of Non-Diapausing Exopterygote Aquatic Insects Occurring in {E}urope}, ' ...
'howpublished = {\url{http://www.zobodat.at/pdf/SBAWW_193_0329-0341.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

