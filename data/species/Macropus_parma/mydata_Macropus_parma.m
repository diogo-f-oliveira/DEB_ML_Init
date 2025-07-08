function [data, auxData, metaData, txtData, weights] = mydata_Macropus_parma

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Diprotodontia'; 
metaData.family     = 'Macropodidae';
metaData.species    = 'Macropus_parma'; 
metaData.species_en = 'Parma wallaby'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf', '0iTi', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'; 'pL'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Jessica Ridenour'};    
metaData.date_subm = [2013 06 11];              
metaData.email    = {'jessroberts09@gmail.com'};            
metaData.address  = {'Melbourne University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2021 11 08];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 08]; 

%% set data
% zero-variate data

data.tg = 31;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'Mayn1973';   
  temp.tg = C2K(36.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Mayn1995: 35 d; temp from DawsDenn1969';
data.tx = 294;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Mayn1995';   
  temp.tx = C2K(36.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'Mayn1976: 300 d; permanent pouch exit at 212 d TaggSchu2005';
data.tp = 424;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'Mayn1973';
  temp.tp = C2K(36.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Mayn1976: 450 d';  
data.tpm = 620;    units.tpm = 'd';    label.tpm = 'time since birth at puberty';   bibkey.tpm = 'AnAge';
  temp.tpm = C2K(36.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 10*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Mayn1972';   
  temp.am = C2K(36.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = .567;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = {'Mayn1976','LeeWard1989'};
data.Wwx = 1770;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = {'Mayn1976','Russ1982'};
data.Wwp = 2510;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Mayn1976';
data.Wwi = 3550;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'Mayn1976','Mayn1995'};

data.Ri  = 365/213/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Mayn1973';   
  temp.Ri = C2K(36.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
data.pL  = .1*2.08e7/365*data.Wwi/1000; units.pL  = 'J/d'; label.pL  = 'average yearly milk production'; bibkey.pL  = 'CorkDove1989';   
  temp.pL = C2K(36.5);  units.temp.pL = 'K'; label.temp.pL = 'temperature';
  
% uni-variate data
% time - weight
data.tWw = [ ...
0.023	0.613
24.042	4.404
37.569	9.083
54.182	16.672
66.642	26.290
83.231	40.040
92.567	52.384
109.166	85.564
123.670	111.966
135.073	146.496
149.581	198.529
157.874	242.162
164.086	262.838
170.314	324.338
178.609	400.264
186.901	482.573
194.162	595.514
200.375	653.943
208.667	788.418
213.850	886.169
220.065	984.533
228.336	1008.138
233.519	1133.132
240.767	1258.965
249.037	1274.198
255.248	1366.949
263.525	1466.583
268.703	1591.726
275.944	1668.286
287.314	1669.116
298.695	1833.295
311.104	1921.909
326.620	2111.335
340.062	2213.488
352.470	2293.567
366.937	2242.095
379.351	2434.182
393.827	2552.072
409.337	2675.792
420.700	2555.074
438.286	2873.422
464.129	2944.576
493.068	2914.113
518.921	3240.360
547.865	3321.051
590.239	3250.485
634.685	3295.025
667.764	3377.688
742.184	3428.464
833.141	3442.133];
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw  = C2K(36.5);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Mayn1976';
comment.tWw = 'Data for female';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = '90 percent of milk production originates from upregulation';
D2 = 'mod_2: added t-Ww aznd tpm data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '7VR5H'; % Cat of Life
metaData.links.id_ITIS = '552736'; % ITIS
metaData.links.id_EoL = '122570'; % Ency of Life
metaData.links.id_Wiki = 'Macropus_parma'; % Wikipedia
metaData.links.id_ADW = 'Macropus_parma'; % ADW
metaData.links.id_Taxo = '168624'; % Taxonomicon
metaData.links.id_MSW3 = '11000261'; % Mammal Spec World
metaData.links.id_AnAge = 'Macropus_parma'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Macropus_parma}}';
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
bibkey = 'Mayn1972'; type = 'Article'; bib = [ ... 
'author = {Maynes, G. M.}, ' ... 
'year = {1972}, ' ...
'title = {Age estimation in the Parma wallaby, \emph{Macropus parma} {W}aterhouse.}, ' ...
'journal = {Australian Journal of Zoology}, ' ...
'volume = {20}, ' ...
'pages = {107--118}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mayn1973'; type = 'Article'; bib = [ ... 
'author = {Maynes, G. M.}, ' ... 
'year = {1973}, ' ...
'title = {Reproduction in the Parma Wallaby, \emph{Macropus parma} {W}aterhouse}, ' ...
'journal = {Australian Journal of Zoology}, ' ...
'volume = {21}, ' ...
'pages = {331--351}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mayn1976'; type = 'Article'; bib = [ ... 
'author = {Maynes, G. M.}, ' ... 
'year = {1976}, ' ...
'title = {Growth of the Parma Wallaby, \emph{Macropus parma}  {W}aterhouse}, ' ...
'journal = {Australian Journal of Zoology}, ' ...
'volume = {24}, ' ...
'pages = {217--236}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mayn1995'; type = 'Incollection'; bib = [ ... 
'author = {Maynes, G. M.}, ' ... 
'year = {1995}, ' ...
'title = {Parma Wallaby}, ' ...
'booktitle = {The Australian Museum complete book of Australian Mammals}, ' ...
'editor = {R. Strahan}, ' ...
'publisher = {Reed Books}, '...
'address = {Sydney, Australia}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CorkDove1989'; type = 'Article'; bib = [ ... 
'author = {Cork, S. J. and Dove, H.}, ' ... 
'year = {1989}, ' ...
'title = {Lactation in the tammar wallaby (\emph{Macropus eugenii}). II. {I}ntake of milk}, ' ...
'journal = {Journal of Zoology, London}, ' ...
'volume = {219}, ' ...
'pages = {399--409}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DawsDenn1969'; type = 'Article'; bib = [ ... 
'author = {Dawson, T. J. and Denny, M. J. S. and Hulbert, A. J.}, ' ... 
'year = {1969}, ' ...
'title = {Thermal balance of the macropod marsupial \emph{Macropus eugenii} {D}esmarest}, ' ...
'journal = {Comparative Biochemistry and Physiology}, ' ...
'volume = {31}, ' ...
'pages = {645--653}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TaggSchu2005'; type = 'Article'; bib = [ ... 
'author = {TAGGERT, D. A. and SCHULTZ, D. and WHITE, C. and WHITEHEAD, P. and UNDERWOOD, G. and PHILLIPS, K.}, ' ... 
'year = {2005}, ' ...
'title = {Cross-fostering, growth and reproductive studies in the brush-tailed rock wallaby, \emph{Petrogale penicillata} ({M}arsupialia: {M}acropodiae): efforts to accelerate breeding in a threatened marsupial species}, ' ...
'journal = {Australian Journal of Zoology}, ' ...
'volume = {53}, ' ...
'pages = {313--323}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LeeWard1989'; type = 'Incollection'; bib = [ ... 
'author = {LEE, A. K. and WARD, S. J.}, ' ... 
'year = {1989}, ' ...
'title = {Life histories of macropodoid marsupials}, ' ...
'booktitle = {Kangaroos, wallabies and rat kangaroos}, ' ...
'editor = {Grigg, G. and Jarman, P. and Hume, I.}, ' ...
'publisher = {Surrey Beatty and Sons}, '...
'address = {Sydney, Australia}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Russ1982'; type = 'Article'; bib = [ ... 
'author = {Russell, E. M.}, ' ... 
'year = {1982}, ' ...
'title = {Parental investment and desertion of young in marsupials}, ' ...
'journal = {American Naturalist}, ' ...
'volume = {119}, ' ...
'pages = {744--748}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mayn1976'; type = 'Article'; bib = [ ... 
'author = {G. M. Maynes}, ' ... 
'year = {1976}, ' ...
'title = {Growth  of  the  {P}arma  Wallaby, \emph{Macropus  parma}  {W}aterhouse}, ' ...
'journal = {Aust.  J . Zool.}, ' ...
'volume = {24}, ' ...
'pages = {217-236}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Macropus_parma}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

