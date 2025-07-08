function [data, auxData, metaData, txtData, weights] = mydata_Archilochus_alexandri 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Apodiformes'; 
metaData.family     = 'Trochilidae';
metaData.species    = 'Archilochus_alexandri';
metaData.species_en = 'Black-chinned hummingbird'; 

metaData.ecoCode.climate = {'BSk', 'BWk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTh'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'Ml','TT'};
metaData.ecoCode.food    = {'biCi', 'xiHn'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body Temperature 
% 41.5 C (mean - range (40.5-42.5)) bib:A Natural History of the Sonoran Desert 
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Lb'; 'Li' ; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Jessica Morais'}; 
metaData.date_subm = [2017 05 03];
metaData.email    = {'jessica.morais@tecnico.ulisboa.pt'}; 
metaData.address  = {'Lisbon University'};

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 19];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 30];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data;
data.ab = 15;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'Vlec1981';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'egg temperature'; 
  comment.ab  = 'mean value taken from several measurements'; 
data.tx = 21;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'GreeHoug2008'; 
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx  = 'mean value taken from several measurements';  
data.tp = 63;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess'; 
  temp.tp = C2K(38.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp  = 'mean value taken from several measurements';  
data.tR = 365;   units.tR = 'd';   label.tR = 'time since birth at 1st brood'; bibkey.tR = 'Aboutanimals';
  temp.tR = C2K(38.1);  units.temp.tR = 'K'; label.temp.tR = 'temperature';  
data.am = 3960;  units.am = 'd';   label.am = 'life span';                     bibkey.am = 'ADW'; 
  temp.am = C2K(38.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.64; units.Lb  = 'cm'; label.Lb  = 'length at birth/hatching';     bibkey.Lb  = 'AllaboutBirds';  
data.Li  = 9;    units.Li  = 'cm'; label.Li  = 'ultimate length';              bibkey.Li  = 'Will2002';

data.Wwb = 0.33; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'GreeHoug2008';
data.Wwi = 4.16; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'GreeHoug2008';   
  comment.Wwi = 'mean value taken from several measurements (n=95)';

data.Ri  = 6/365;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AllaboutBirds';   
temp.Ri = C2K(38.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-weight
data.tW = [...
0.7931	0.3401
0.7933	0.3623
0.7935	0.3992
0.7937	0.4214
1.685	0.4654
1.652	0.4876
1.686	0.5245
1.686	0.5393
2.676	0.6128
2.645	0.8493
3.536	0.8712
4.46	0.7895
4.462	1.1369
3.571	1.1372
4.53	1.41
5.42	1.314
5.42	1.27
5.422	1.609
6.348	1.816
6.316	2.023
6.35	2.156
7.273	2
7.305	1.86
7.309	2.333
8.168	2.554
8.202	2.584
8.202	2.673
8.171	2.939
9.095	2.931
9.094	2.827
9.093	2.68
9.132	3.47
9.989	3.396
10.02	3.544
10.91	3.44
10.92	3.92
10.92	3.95
10.92	3.98
11.87	3.876
11.78	3.942
12.76	3.558
11.88	4.112
12.67	4.038
12.7	4.105
13.69	3.927
13.69	4.134
13.69	4.267
14.58	3.697
14.58	4
14.58	4.303
14.62	4.37
15.47	4.141
15.57	4.044
15.54	4.673
16.46	4.295
17.35	3.852
17.39	4.546
18.25	4.073
18.31	4.058
19.24	4.583];
n=size(data.tW,1); for i=2:n; if data.tW(i,1)<=data.tW(i-1,1);data.tW(i,1)=data.tW(i-1,1)+1e-3;end;end
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(38.1);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'GreeHoug2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.Lb = 0 * weights.Lb; % exclude length at birth, since tail is absent, so change in shape

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Length at birth is ignored, because tail and bill contribute a lot to length and they are born naked with a short bill';
D2 = 'mod_1: v is reduced and food availability in tW taken variable';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Body temperature drops at night';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'G96Y'; % Cat of Life
metaData.links.id_ITIS = '178033'; % ITIS
metaData.links.id_EoL = '45509649'; % Ency of Life
metaData.links.id_Wiki = 'Archilochus_alexandri'; % Wikipedia
metaData.links.id_ADW = 'Archilochus_alexandri'; % ADW
metaData.links.id_Taxo = '72515'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '4BB4F25726A8B123'; % avibase
metaData.links.id_birdlife = 'black-chinned-hummingbird-archilochus-alexandri'; % birdlife
metaData.links.id_AnAge = 'Archilochus_alexandri'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Archilochus_alexandri}},'...
'note = {Accessed : 2017-03-20}'];
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
bibkey = 'Vlec1981'; type = 'Article'; bib = [ ... 
'author = {C. M. Vleck}, ' ... 
'year = {1981}, ' ...
'title = {Hummingbird Incubation: Female Attentiveness Egg Temperature}, ' ...
'journal = {Oecologia}, ' ...
'volume = {51}, ' ...
'number = {Issue 2}, '...
'pages = {199--205}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GreeHoug2008'; type = 'Article'; bib = [ ... 
'author = {H. F. Greeney and E. R. Hough and C. E. Hanilton and S. M. Wethington}, ' ... 
'year = {2008}, ' ...
'title = {Nestling growth and plumage development of the Black-chinned Hummingbird (\emph{Archilochus alexandri}) in southeastern {A}rizona}, ' ...
'journal = {Huitzil}, ' ...
'volume = {9}, ' ...
'number = {2}, '...
'pages = {35--42}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Aboutanimals'; type = 'Misc'; bib = [ ...
'author = {Anonymous}, ' ...
'year = {2017}, ' ...
'howpublished = {\url{https://www.aboutanimals.com/bird/black-chinned-hummingbird/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = [ ...
'author = {University of Michigan}, ' ...
'year = {2001}, ' ...
'howpublished = {\url{http://animaldiversity.org/accounts/Archilochus_alexandri/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AllaboutBirds'; type = 'Misc'; bib = [ ...
'author = {Cornell University}, ' ...
'year = {2015}, ' ...
'howpublished = {\url{https://www.allaboutbirds.org/guide/Black-chinned_Hummingbird/lifehistory}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Will2002'; type = 'Book'; bib = [ ...  
'author = {S. Williamson}, ' ...
'year = {2002}, ' ...
'title  = {A Field Guide to Hummingbirds of North America}, ' ...
'publisher = {Houghton Mifflin Company}, ' ...
'pages = {62}, ' ...
'howpublished = {\url{https://books.google.pt/books?id=XtZ1xotyal8C&printsec=frontcover&dq=a+field+of+hummingbirds+of+north+america}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

